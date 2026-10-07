package com.hexagon.hcount.order;

import static org.junit.Assert.*;
import org.junit.Test;
import com.hexagon.hcount.domain.order.OrderCriteria;
import com.hexagon.hcount.domain.order.OrderPageDTO;

// 검색 조건과 페이지 계산이 맞는지 확인
// 検索条件とページ計算が正しいか確認する
public class OrderCriteriaTest {
    @Test public void defaultsUseBookPageSize() {
        OrderCriteria cri = new OrderCriteria();
        assertEquals(1, cri.getPageNum());
        assertEquals(10, cri.getAmount());
        assertNull(cri.validate());
    }
    @Test public void emptyPageAndNegativePageAreSafe() {
        OrderCriteria cri = new OrderCriteria();
        cri.setPageNum(-3);
        cri.normalize();
        OrderPageDTO page = new OrderPageDTO(cri, 0);
        assertEquals(1, cri.getPageNum());
        assertEquals(1, page.getRealEnd());
        assertFalse(page.isPrev());
        assertFalse(page.isNext());
    }
    @Test public void lastPageIsClamped() {
        OrderCriteria cri = new OrderCriteria();
        cri.setPageNum(Integer.MAX_VALUE);
        OrderPageDTO page = new OrderPageDTO(cri, 23);
        assertEquals(3, cri.getPageNum());
        assertEquals(20L, cri.getOffset());
        assertEquals(30L, cri.getLimit());
        assertEquals(3, page.getEndPage());
    }
    @Test public void pageBlocksUseTenNumbers() {
        OrderCriteria cri = new OrderCriteria();
        cri.setPageNum(11);
        OrderPageDTO page = new OrderPageDTO(cri, 201);
        assertEquals(11, page.getStartPage());
        assertEquals(20, page.getEndPage());
        assertTrue(page.isPrev());
        assertTrue(page.isNext());
    }
    @Test public void calendarDateMustExist() {
        OrderCriteria cri = new OrderCriteria();
        cri.setStartDate("2026-02-29");
        assertNotNull(cri.validate());
        cri.setStartDate("2024-02-29");
        assertNull(cri.validate());
        cri.setStartDate("0000-01-01");
        assertNotNull(cri.validate());
    }
    @Test public void reversedRangeIsRejected() {
        OrderCriteria cri = new OrderCriteria();
        cri.setStartDate("2026-10-08"); cri.setEndDate("2026-10-07");
        assertNotNull(cri.validate());
    }
    @Test public void invalidMasterIdIsRejected() {
        OrderCriteria cri = new OrderCriteria(); cri.setWhId(0L);
        assertNotNull(cri.validate());
    }
    @Test public void literalLikeCharactersAreEscaped() {
        OrderCriteria cri = new OrderCriteria(); cri.setOrdNo("a%_\\b");
        assertEquals("a\\%\\_\\\\b", cri.getEscapedOrdNo());
    }
    @Test public void inputLengthAndModeAreChecked() {
        OrderCriteria cri = new OrderCriteria(); cri.setOrdNo(new String(new char[41]));
        assertNotNull(cri.validate());
        cri.setOrdNo(""); cri.setMatchType("unknown");
        assertNotNull(cri.validate());
    }
}
