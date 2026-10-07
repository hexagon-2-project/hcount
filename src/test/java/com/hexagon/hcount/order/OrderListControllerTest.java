package com.hexagon.hcount.order;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import com.hexagon.hcount.controller.order.OrderListController;
import com.hexagon.hcount.domain.order.*;
import com.hexagon.hcount.mapper.order.OrderMapper;
import com.hexagon.hcount.service.order.OrderService;

// DB 연결 없이 검색 요청과 오류 처리 확인
// DB接続なしで検索リクエストとエラー処理を確認する
public class OrderListControllerTest {
    private MockMvc mvc;
    private ReadOnlyMapper mapper;

    @Before public void setup() {
        mapper = new ReadOnlyMapper();
        mvc = MockMvcBuilders.standaloneSetup(new OrderListController(new OrderService(mapper))).build();
    }
    @Test public void listModelUsesCorrectJspAndClampsPage() throws Exception {
        mvc.perform(get("/order/order-list").param("pageNum", "999"))
                .andExpect(status().isOk()).andExpect(view().name("order/order-list"))
                .andExpect(model().attributeExists("list", "pageMaker", "cri"));
        assertEquals(3, mapper.lastCriteria.getPageNum());
    }
    @Test public void invalidDateDoesNotQueryOrders() throws Exception {
        mvc.perform(get("/order/order-list").param("startDate", "2026-02-30"))
                .andExpect(status().isBadRequest()).andExpect(model().attributeExists("searchError"));
        assertEquals(0, mapper.orderQueryCount);
    }
    @Test public void invalidIdDoesNotQueryOrders() throws Exception {
        mvc.perform(get("/order/order-list").param("partnerId", "abc"))
                .andExpect(status().isBadRequest()).andExpect(model().attributeExists("searchError"));
        assertEquals(0, mapper.orderQueryCount);
    }
    @Test public void reversedDatesDoNotQueryOrders() throws Exception {
        mvc.perform(get("/order/order-list").param("startDate", "2026-10-08").param("endDate", "2026-10-07"))
                .andExpect(status().isBadRequest());
        assertEquals(0, mapper.orderQueryCount);
    }
    @Test public void dbFailureIsNotAnEmptySuccess() throws Exception {
        mapper.fail = true;
        mvc.perform(get("/order/order-list"))
                .andExpect(status().isServiceUnavailable()).andExpect(model().attributeExists("dbError"));
    }
    @Test public void emptyIdParameterIsAllAndConditionsArePassed() throws Exception {
        mvc.perform(get("/order/order-list").param("partnerId", "").param("ordNo", " A-1 ")
                .param("matchType", "contains")).andExpect(status().isOk());
        assertNull(mapper.lastCriteria.getPartnerId());
        assertEquals("A-1", mapper.lastCriteria.getOrdNo());
        assertEquals("contains", mapper.lastCriteria.getMatchType());
    }

    // 테스트에서 실제 Mapper 대신 사용
    // テストで実際のMapperの代わりに使う
    private static class ReadOnlyMapper implements OrderMapper {
        private OrderCriteria lastCriteria;
        private int orderQueryCount;
        private boolean fail;
        public long getTotalCount(OrderCriteria cri) {
            orderQueryCount++;
            if (fail) throw new DataAccessResourceFailureException("Test failure");
            return 23;
        }
        public List<OrderListVO> getListWithPaging(OrderCriteria cri) {
            orderQueryCount++; lastCriteria = cri; return Collections.emptyList();
        }
        public List<OrderSearchOptionVO> getPartnerOptions() { return Collections.emptyList(); }
        public List<OrderSearchOptionVO> getEmpOptions() { return Collections.emptyList(); }
        public List<OrderSearchOptionVO> getWhOptions() { return Collections.emptyList(); }
        public List<String> getStatusOptions() { return Collections.emptyList(); }
    }
}
