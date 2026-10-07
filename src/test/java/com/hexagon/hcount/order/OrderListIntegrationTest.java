package com.hexagon.hcount.order;

import static org.junit.Assert.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.hexagon.hcount.domain.order.OrderCriteria;
import com.hexagon.hcount.domain.order.OrderListVO;
import com.hexagon.hcount.mapper.order.OrderMapper;
import com.hexagon.hcount.service.order.OrderService;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;

// 실제 DB에서 주문서 조회가 되는지 확인
// 実際のDBで受注を照会できるか確認する
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderListIntegrationTest {
    @Autowired private OrderMapper mapper;
    @Autowired private OrderService service;
    @Autowired private DataSource source;
    @Autowired private SqlSessionFactory factory;

    @Test public void totalCountsHeadersNotDetailRows() throws Exception {
        try (Connection con = source.getConnection();
             PreparedStatement sql = con.prepareStatement("SELECT COUNT(*) FROM ORD");
             ResultSet rs = sql.executeQuery()) {
            assertTrue(rs.next());
            assertEquals(rs.getLong(1), service.getTotal(new OrderCriteria()));
        }
    }
    @Test public void pagesDoNotDuplicateOrders() {
        OrderCriteria cri = new OrderCriteria();
        List<OrderListVO> first = mapper.getListWithPaging(cri);
        assertTrue(first.size() <= 10);
        Set<Long> ids = new HashSet<>();
        for (OrderListVO order : first) {
            assertTrue(ids.add(order.getOrdId()));
            assertNotNull(order.getTotAmt());
        }
        cri.setPageNum(2);
        for (OrderListVO order : mapper.getListWithPaging(cri)) {
            assertTrue(ids.add(order.getOrdId()));
        }
        for (int index = 1; index < first.size(); index++) {
            OrderListVO a = first.get(index - 1), b = first.get(index);
            assertTrue(a.getOrdDt().after(b.getOrdDt())
                    || (a.getOrdDt().equals(b.getOrdDt()) && a.getOrdId() > b.getOrdId()));
        }
    }
    @Test public void filtersMatchInternalIdsAndExactNumber() {
        List<OrderListVO> seed = mapper.getListWithPaging(new OrderCriteria());
        if (seed.isEmpty()) return;
        OrderListVO selected = seed.get(0);
        OrderCriteria cri = new OrderCriteria();
        cri.setOrdNo(selected.getOrdNo()); cri.setPartnerId(selected.getPartnerId());
        cri.setEmpId(selected.getEmpId()); cri.setWhId(selected.getWhId());
        cri.setStatus(selected.getStatus());
        assertTrue(mapper.getTotalCount(cri) > 0);
        for (OrderListVO order : mapper.getListWithPaging(cri)) {
            assertEquals(selected.getOrdNo(), order.getOrdNo());
            assertEquals(selected.getPartnerId(), order.getPartnerId());
            assertEquals(selected.getStatus(), order.getStatus());
            if (selected.getEmpId() != null) assertEquals(selected.getEmpId(), order.getEmpId());
            if (selected.getWhId() != null) assertEquals(selected.getWhId(), order.getWhId());
        }
        cri.setMatchType("contains");
        assertTrue(mapper.getTotalCount(cri) > 0);
    }
    @Test public void multipleItemsRemainOneRowAndHeaderAmount() throws Exception {
        // 품목이 여러 개인 기존 주문서로 확인
        // 品目が複数ある既存の受注で確認する
        String query = "SELECT o.ORD_ID, o.ORD_NO, o.TOT_AMT FROM ORD o "
                + "WHERE o.ORD_ID IN (SELECT ORD_ID FROM ORD_DTL GROUP BY ORD_ID HAVING COUNT(*) >= 3) "
                + "AND ROWNUM = 1";
        try (Connection con = source.getConnection(); PreparedStatement sql = con.prepareStatement(query);
             ResultSet rs = sql.executeQuery()) {
            boolean exists = rs.next();
            if (!exists) System.out.println("SKIPPED_MULTI_ITEM_DB_TEST: no existing order with three details");
            org.junit.Assume.assumeTrue("Requires existing order with at least three items", exists);
            Long id = rs.getLong(1);
            OrderCriteria cri = new OrderCriteria(); cri.setOrdNo(rs.getString(2));
            int occurrences = 0;
            for (OrderListVO order : mapper.getListWithPaging(cri)) {
                if (id.equals(order.getOrdId())) {
                    occurrences++;
                    assertTrue(order.getDetailCount() >= 3);
                    assertEquals(0, rs.getBigDecimal(3).compareTo(order.getTotAmt()));
                }
            }
            assertEquals(1, occurrences);
        }
    }
    @Test public void boundTextCannotTurnIntoSql() {
        OrderCriteria cri = new OrderCriteria(); cri.setOrdNo("' OR 1=1 --");
        assertEquals(0L, mapper.getTotalCount(cri));
        assertTrue(mapper.getListWithPaging(cri).isEmpty());
        cri.setMatchType("contains");
        assertEquals(0L, mapper.getTotalCount(cri));
    }
    @Test public void emptyDateRangeAndOptionsAreReadable() {
        OrderCriteria cri = new OrderCriteria(); cri.setStartDate("0001-01-01"); cri.setEndDate("0001-01-01");
        assertEquals(0L, mapper.getTotalCount(cri));
        assertTrue(mapper.getListWithPaging(cri).isEmpty());
        assertNotNull(mapper.getPartnerOptions()); assertNotNull(mapper.getEmpOptions());
        assertNotNull(mapper.getWhOptions()); assertNotNull(mapper.getStatusOptions());
    }
    @Test public void sameDayIncludesTheWholeEndDate() throws Exception {
        List<OrderListVO> seed = mapper.getListWithPaging(new OrderCriteria());
        assertFalse(seed.isEmpty());
        String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(seed.get(0).getOrdDt());
        OrderCriteria cri = new OrderCriteria(); cri.setStartDate(date); cri.setEndDate(date);
        try (Connection con = source.getConnection(); PreparedStatement sql = con.prepareStatement(
                "SELECT COUNT(*) FROM ORD WHERE ORD_DT >= TO_DATE(?, 'YYYY-MM-DD') "
                + "AND ORD_DT < TO_DATE(?, 'YYYY-MM-DD') + 1")) {
            sql.setString(1, date); sql.setString(2, date);
            try (ResultSet rs = sql.executeQuery()) {
                assertTrue(rs.next()); assertEquals(rs.getLong(1), mapper.getTotalCount(cri));
            }
        }
        for (OrderListVO order : mapper.getListWithPaging(cri)) {
            assertEquals(date, new java.text.SimpleDateFormat("yyyy-MM-dd").format(order.getOrdDt()));
        }
    }
    @Test public void percentAndUnderscoreAreLiteralSearchText() throws Exception {
        for (String text : new String[] {"%", "_", "\\"}) {
            OrderCriteria cri = new OrderCriteria(); cri.setOrdNo(text); cri.setMatchType("contains");
            try (Connection con = source.getConnection(); PreparedStatement sql = con.prepareStatement(
                    "SELECT COUNT(*) FROM ORD WHERE INSTR(ORD_NO, ?) > 0")) {
                sql.setString(1, text);
                try (ResultSet rs = sql.executeQuery()) {
                    assertTrue(rs.next()); assertEquals(rs.getLong(1), mapper.getTotalCount(cri));
                }
            }
        }
    }
    @Test public void threeItemSqlFixtureIsOneRowWithoutWritingDb() throws Exception {
        // 실제 테이블 대신 조회용 임시 데이터 사용
        // 実際のテーブルの代わりに照会用の仮データを使う
        // 조회만 하므로 DB에 데이터가 저장되지는 않음
        // 照会だけなのでDBにデータは保存されない
        OrderCriteria cri = new OrderCriteria();
        BoundSql bound = factory.getConfiguration().getMappedStatement(
                "com.hexagon.hcount.mapper.order.OrderMapper.getListWithPaging").getBoundSql(cri);
        String orders = "(SELECT 900000001 ORD_ID, 'TEST-ORD' ORD_NO, DATE '2026-10-07' ORD_DT, "
                + "CAST(NULL AS DATE) DUE_DT, 11 PARTNER_ID, CAST(NULL AS NUMBER) EMP_ID, "
                + "CAST(NULL AS NUMBER) WH_ID, 123.45 TOT_AMT, 'JPY' CURR_CD, 'TEST' STATUS FROM DUAL)";
        String details = "(SELECT 101 ORD_DTL_ID, 900000001 ORD_ID, 1 SEQ_NO, 21 ITEM_ID FROM DUAL "
                + "UNION ALL SELECT 102, 900000001, 2, 22 FROM DUAL "
                + "UNION ALL SELECT 103, 900000001, 3, 23 FROM DUAL)";
        String partners = "(SELECT 11 PARTNER_ID, 'P-TEST' PARTNER_CD, 'test-partner' PARTNER_NM FROM DUAL)";
        String items = "(SELECT 21 ITEM_ID, 'FIRST' ITEM_NM FROM DUAL "
                + "UNION ALL SELECT 22, 'SECOND' FROM DUAL UNION ALL SELECT 23, 'THIRD' FROM DUAL)";
        String query = bound.getSql().replaceAll("\\bORD_DTL\\b", details)
                .replaceAll("\\bORD\\b", orders).replaceAll("\\bPARTNER\\b", partners).replaceAll("\\bITEM\\b", items);
        try (Connection con = source.getConnection(); PreparedStatement sql = con.prepareStatement(query)) {
            int index = 1;
            for (ParameterMapping parameter : bound.getParameterMappings()) {
                Number value = (Number) factory.getConfiguration().newMetaObject(cri).getValue(parameter.getProperty());
                sql.setLong(index++, value.longValue());
            }
            try (ResultSet rs = sql.executeQuery()) {
                assertTrue(rs.next());
                assertEquals(900000001L, rs.getLong("ORD_ID"));
                assertEquals(3, rs.getInt("DETAIL_COUNT"));
                assertEquals("FIRST", rs.getString("ITEM_SUMMARY"));
                assertEquals(0, new java.math.BigDecimal("123.45").compareTo(rs.getBigDecimal("TOT_AMT")));
                assertFalse("A three-item order must be exactly one row", rs.next());
            }
        }
    }
}
