<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>受注伝票照会</title>
<jsp:include page="../common/styles.jsp" />
<!-- 주문서조회 화면에서만 쓰는 스타일
     受注照会画面だけで使うスタイル -->
<style>
.order-search { display:grid; grid-template-columns:repeat(3,minmax(0,1fr)); gap:12px; margin-bottom:12px; }
.order-search label { display:grid; gap:4px; }
.order-search input, .order-search select { width:100%; min-width:0; padding:8px; border:1px solid #d7dce4; background:white; }
.order-search-actions { display:flex; align-items:end; gap:8px; flex-wrap:wrap; }
.order-search-actions button, .order-search-actions a { padding:8px 14px; }
.order-message { padding:10px; margin:0 0 10px; border:1px solid #d7dce4; }
.order-error { color:#9f2020; background:#fff2f2; }
.order-note { font-size:12px; color:#526078; }
@media(max-width:900px) { .order-search { grid-template-columns:repeat(2,minmax(0,1fr)); } }
@media(max-width:600px) { .order-search { grid-template-columns:1fr; } }
</style>
</head>
<body>
<div class="erp-app">
    <jsp:include page="../common/brand-header.jsp" />
    <div class="app-body">
        <jsp:include page="../common/sidebar.jsp"><jsp:param name="activePage" value="order/order-list" /></jsp:include>
        <main class="workspace">
            <header class="screen-titlebar"><h1>受注伝票照会</h1></header>
            <section class="screen-content simple-page">
                <!-- 검색하면 1페이지부터 보여주기
                                     検索したら1ページから表示する -->
                <form id="orderSearchForm" class="order-search" method="get" action="${pageContext.request.contextPath}/order/order-list">
                    <label>受注日（開始）<input type="date" name="startDate" value="<c:out value='${cri.startDate}'/>"></label>
                    <label>受注日（終了）<input type="date" name="endDate" value="<c:out value='${cri.endDate}'/>"></label>
                    <label>取引先
                        <select name="partnerId"><option value="">すべて</option>
                            <c:forEach items="${partnerOptions}" var="option">
                                <option value="${option.id}" ${cri.partnerId == option.id ? 'selected' : ''}><c:out value="${option.code}"/> / <c:out value="${option.name}"/></option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>担当者
                        <select name="empId"><option value="">すべて</option>
                            <c:forEach items="${empOptions}" var="option">
                                <option value="${option.id}" ${cri.empId == option.id ? 'selected' : ''}><c:out value="${option.code}"/> / <c:out value="${option.name}"/></option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>倉庫
                        <select name="whId"><option value="">すべて</option>
                            <c:forEach items="${whOptions}" var="option">
                                <option value="${option.id}" ${cri.whId == option.id ? 'selected' : ''}><c:out value="${option.code}"/> / <c:out value="${option.name}"/></option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>進行状態
                        <select name="status"><option value="">すべて</option>
                            <c:forEach items="${statusOptions}" var="option">
                                <option value="<c:out value='${option}'/>" ${cri.status == option ? 'selected' : ''}><c:out value="${option}"/></option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>受注番号<input type="search" name="ordNo" maxlength="40" value="<c:out value='${cri.ordNo}'/>"></label>
                    <label>受注番号の検索方法
                        <select name="matchType">
                            <option value="exact" ${cri.matchType == 'exact' ? 'selected' : ''}>完全一致</option>
                            <option value="contains" ${cri.matchType == 'contains' ? 'selected' : ''}>部分一致</option>
                        </select>
                    </label>
                    <div class="order-search-actions">
                        <button type="submit" class="primary-button">検索(F3)</button>
                        <a href="${pageContext.request.contextPath}/order/order-list">条件クリア</a>
                    </div>
                </form>
                <c:if test="${not empty searchError}"><p class="order-message order-error" role="alert"><c:out value="${searchError}"/></p></c:if>
                <c:if test="${not empty dbError}"><p class="order-message order-error" role="alert"><c:out value="${dbError}"/></p></c:if>
                <div class="table-scroll">
                    <table class="list-table">
                        <thead><tr>
                            <th class="selection-column"><input type="checkbox" class="list-row-select" id="selectAllRows" aria-label="このページをすべて選択"></th>
                            <th>受注番号</th><th>受注日</th><th>取引先</th><th>納期</th><th>品目</th><th>合計金額</th><th>通貨</th><th>進行状態</th><th>編集</th>
                        </tr></thead>
                        <tbody>
                            <c:forEach items="${list}" var="order">
                                <tr>
                                    <td class="selection-column"><input type="checkbox" name="selectedOrdId" value="${order.ordId}" class="list-row-select order-row-select" aria-label="受注を選択"></td>
                                    <td><c:out value="${order.ordNo}"/></td>
                                    <td><fmt:formatDate value="${order.ordDt}" pattern="yyyy/MM/dd"/></td>
                                    <td><c:out value="${order.partnerCd}"/> / <c:out value="${order.partnerNm}"/></td>
                                    <td><fmt:formatDate value="${order.dueDt}" pattern="yyyy/MM/dd"/></td>
                                    <td><c:out value="${order.itemSummary}"/><c:if test="${order.detailCount > 1}"> 他${order.detailCount - 1}件</c:if></td>
                                    <td><fmt:formatNumber value="${order.totAmt}" pattern="#,##0.00"/></td>
                                    <td><c:out value="${order.currCd}"/></td>
                                    <td><c:out value="${order.status}"/></td>
                                    <td><button type="button" disabled title="受注伝票入力の編集機能は次の開発対象です">準備中</button></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty list}">
                                <tr><td colspan="10">
                                    <c:choose>
                                        <c:when test="${not empty dbError}">取得エラーのため一覧を表示できません。</c:when>
                                        <c:when test="${not empty searchError}">検索条件を修正してください。</c:when>
                                        <c:otherwise>該当する受注伝票はありません。</c:otherwise>
                                    </c:choose>
                                </td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                <!-- 다른 페이지로 넘어가도 검색 조건 유지
                                     別のページに移動しても検索条件を残す -->
                <form id="orderPageForm" method="get" action="${pageContext.request.contextPath}/order/order-list">
                    <input type="hidden" name="startDate" value="<c:out value='${cri.startDate}'/>">
                    <input type="hidden" name="endDate" value="<c:out value='${cri.endDate}'/>">
                    <input type="hidden" name="partnerId" value="<c:out value='${cri.partnerId}'/>">
                    <input type="hidden" name="empId" value="<c:out value='${cri.empId}'/>">
                    <input type="hidden" name="whId" value="<c:out value='${cri.whId}'/>">
                    <input type="hidden" name="status" value="<c:out value='${cri.status}'/>">
                    <input type="hidden" name="ordNo" value="<c:out value='${cri.ordNo}'/>">
                    <input type="hidden" name="matchType" value="<c:out value='${cri.matchType}'/>">
                </form>
                <c:if test="${empty dbError and empty searchError}">
                    <nav class="list-pagination" aria-label="ページ移動">
                        <span class="list-pagination-count">全 <fmt:formatNumber value="${pageMaker.total}"/> 件</span>
                        <div class="list-pagination-controls">
                            <button form="orderPageForm" name="pageNum" value="1" ${cri.pageNum == 1 ? 'disabled' : ''} aria-label="最初のページ">«</button>
                            <c:if test="${pageMaker.prev}"><button form="orderPageForm" name="pageNum" value="${pageMaker.startPage - 1}" aria-label="前の10ページ">‹</button></c:if>
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                                <c:choose>
                                    <c:when test="${num == cri.pageNum}"><span class="list-pagination-current" aria-current="page">${num}</span></c:when>
                                    <c:otherwise><button form="orderPageForm" name="pageNum" value="${num}">${num}</button></c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${pageMaker.next}"><button form="orderPageForm" name="pageNum" value="${pageMaker.endPage + 1}" aria-label="次の10ページ">›</button></c:if>
                            <button form="orderPageForm" name="pageNum" value="${pageMaker.realEnd}" ${cri.pageNum == pageMaker.realEnd ? 'disabled' : ''} aria-label="最後のページ">»</button>
                        </div>
                        <span class="list-pagination-total">${cri.pageNum} / ${pageMaker.realEnd} ページ</span>
                    </nav>
                </c:if>
                <div class="list-footer-actions" role="group" aria-label="一覧操作">
                    <button type="button" id="newButton">新規(F2)</button>
                    <button type="button" disabled title="変更ルール確認後に実装">進行状態変更（準備中）</button>
                    <button type="button" disabled title="削除ルール確認後に実装">選択削除（準備中）</button>
                </div>
                <p class="order-note">編集・状態変更・削除は未実装です。共通メニューの翻訳はこの作業に含みません。</p>
            </section>
        </main>
    </div>
</div>
<script>
// 신규 버튼, 전체 선택, 단축키 처리
// 新規ボタン、全選択、ショートカットの処理
document.addEventListener('DOMContentLoaded', function () {
    var newButton = document.getElementById('newButton');
    newButton.addEventListener('click', function () {
        window.location.href = '${pageContext.request.contextPath}/order/order-input';
    });
    document.getElementById('selectAllRows').addEventListener('change', function () {
        var all = this;
        document.querySelectorAll('.order-row-select').forEach(function (row) { row.checked = all.checked; });
    });
    document.addEventListener('keydown', function (event) {
        if (event.key === 'F2') { event.preventDefault(); newButton.click(); }
        if (event.key === 'F3') { event.preventDefault(); document.getElementById('orderSearchForm').requestSubmit(); }
    });
});
</script>
</body>
</html>
