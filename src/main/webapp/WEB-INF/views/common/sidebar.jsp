<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 공통 좌측 메뉴. activePage로 현재 화면을 표시한다. --%>
<aside class="side-menu simple-menu" aria-label="메뉴">
          <section class="simple-menu-group">
            <strong>기초등록</strong>
            <a href="${pageContext.request.contextPath}/basic/partner-list" class="${param.activePage eq 'basic/partner-list' ? 'active' : ''}" aria-current="${param.activePage eq 'basic/partner-list' ? 'page' : 'false'}">거래처리스트</a>
            <a href="${pageContext.request.contextPath}/basic/warehouse-list" class="${param.activePage eq 'basic/warehouse-list' ? 'active' : ''}" aria-current="${param.activePage eq 'basic/warehouse-list' ? 'page' : 'false'}">창고등록리스트</a>
            <a href="${pageContext.request.contextPath}/basic/item-list" class="${param.activePage eq 'basic/item-list' ? 'active' : ''}" aria-current="${param.activePage eq 'basic/item-list' ? 'page' : 'false'}">품목등록 리스트</a>
          </section>
          <section class="simple-menu-group">
            <strong>견적서</strong>
            <a href="${pageContext.request.contextPath}/quote/quote-list" class="${param.activePage eq 'quote/quote-list' ? 'active' : ''}" aria-current="${param.activePage eq 'quote/quote-list' ? 'page' : 'false'}">견적서조회</a>
            <a href="${pageContext.request.contextPath}/quote/quote-input" class="${param.activePage eq 'quote/quote-input' ? 'active' : ''}" aria-current="${param.activePage eq 'quote/quote-input' ? 'page' : 'false'}">견적서입력</a>
            <a href="${pageContext.request.contextPath}/quote/quote-status" class="${param.activePage eq 'quote/quote-status' ? 'active' : ''}" aria-current="${param.activePage eq 'quote/quote-status' ? 'page' : 'false'}">견적서현황</a>
            <a href="${pageContext.request.contextPath}/quote/unordered-status" class="${param.activePage eq 'quote/unordered-status' ? 'active' : ''}" aria-current="${param.activePage eq 'quote/unordered-status' ? 'page' : 'false'}">미주문현황</a>
          </section>
          <section class="simple-menu-group">
            <strong>주문서</strong>
            <a href="${pageContext.request.contextPath}/order/order-list" class="${param.activePage eq 'order/order-list' ? 'active' : ''}" aria-current="${param.activePage eq 'order/order-list' ? 'page' : 'false'}">주문서조회</a>
            <a href="${pageContext.request.contextPath}/order/order-input" class="${param.activePage eq 'order/order-input' ? 'active' : ''}" aria-current="${param.activePage eq 'order/order-input' ? 'page' : 'false'}">주문서입력</a>
            <a href="${pageContext.request.contextPath}/order/order-status" class="${param.activePage eq 'order/order-status' ? 'active' : ''}" aria-current="${param.activePage eq 'order/order-status' ? 'page' : 'false'}">주문서현황</a>
            <a href="${pageContext.request.contextPath}/order/order-release" class="${param.activePage eq 'order/order-release' ? 'active' : ''}" aria-current="${param.activePage eq 'order/order-release' ? 'page' : 'false'}">주문서출고처리</a>
            <a href="${pageContext.request.contextPath}/order/unsold-status" class="${param.activePage eq 'order/unsold-status' ? 'active' : ''}" aria-current="${param.activePage eq 'order/unsold-status' ? 'page' : 'false'}">미판매현황</a>
          </section>
          <section class="simple-menu-group">
            <strong>판매</strong>
            <a href="${pageContext.request.contextPath}/sale/sale-list" class="${param.activePage eq 'sale/sale-list' ? 'active' : ''}" aria-current="${param.activePage eq 'sale/sale-list' ? 'page' : 'false'}">판매조회</a>
            <a href="${pageContext.request.contextPath}/sale/sale-input" class="${param.activePage eq 'sale/sale-input' ? 'active' : ''}" aria-current="${param.activePage eq 'sale/sale-input' ? 'page' : 'false'}">판매입력</a>
            <a href="${pageContext.request.contextPath}/sale/sale-input-ii" class="${param.activePage eq 'sale/sale-input-ii' ? 'active' : ''}" aria-current="${param.activePage eq 'sale/sale-input-ii' ? 'page' : 'false'}">판매입력 II</a>
            <a href="${pageContext.request.contextPath}/sale/sale-price" class="${param.activePage eq 'sale/sale-price' ? 'active' : ''}" aria-current="${param.activePage eq 'sale/sale-price' ? 'page' : 'false'}">판매단가일괄변경</a>
            <a href="${pageContext.request.contextPath}/sale/sale-status" class="${param.activePage eq 'sale/sale-status' ? 'active' : ''}" aria-current="${param.activePage eq 'sale/sale-status' ? 'page' : 'false'}">판매현황</a>
            <a href="${pageContext.request.contextPath}/sale/payment-list" class="${param.activePage eq 'sale/payment-list' ? 'active' : ''}" aria-current="${param.activePage eq 'sale/payment-list' ? 'page' : 'false'}">결제내역조회</a>
            <a href="${pageContext.request.contextPath}/sale/payment-compare" class="${param.activePage eq 'sale/payment-compare' ? 'active' : ''}" aria-current="${param.activePage eq 'sale/payment-compare' ? 'page' : 'false'}">결제내역자료비교</a>
          </section>
          <section class="simple-menu-group">
            <strong>출하지시서</strong>
            <a href="${pageContext.request.contextPath}/shiprequest/list" class="${param.activePage eq 'dispatch/dispatch-list' ? 'active' : ''}" aria-current="${param.activePage eq 'dispatch/dispatch-list' ? 'page' : 'false'}">출하지시서조회</a>
            <a href="${pageContext.request.contextPath}/shiprequest/input" class="${param.activePage eq 'dispatch/dispatch-input' ? 'active' : ''}" aria-current="${param.activePage eq 'dispatch/dispatch-input' ? 'page' : 'false'}">출하지시서입력</a>
            <a href="${pageContext.request.contextPath}/shiprequest/status" class="${param.activePage eq 'dispatch/dispatch-status' ? 'active' : ''}" aria-current="${param.activePage eq 'dispatch/dispatch-status' ? 'page' : 'false'}">출하지시서현황</a>
          </section>
          <section class="simple-menu-group">
            <strong>출하</strong>
            <a href="${pageContext.request.contextPath}/shipment/shipment-list" class="${param.activePage eq 'shipment/shipment-list' ? 'active' : ''}" aria-current="${param.activePage eq 'shipment/shipment-list' ? 'page' : 'false'}">출하조회</a>
            <a href="${pageContext.request.contextPath}/shipment/shipment-input" class="${param.activePage eq 'shipment/shipment-input' ? 'active' : ''}" aria-current="${param.activePage eq 'shipment/shipment-input' ? 'page' : 'false'}">출하입력</a>
          </section>
      </aside>
