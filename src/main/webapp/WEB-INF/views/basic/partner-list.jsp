<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>거래처리스트</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body data-message="${fn:escapeXml(message)}" data-error="${fn:escapeXml(error)}">
<c:url var="listUrl" value="/basic/partner-list" />
<c:url var="registerUrl" value="/basic/partner/register" />
<c:url var="updateUrl" value="/basic/partner/update" />
<c:url var="toggleUrl" value="/basic/partner/toggle-use" />
<c:choose>
  <c:when test="${not empty editingPartner}"><c:set var="entryAction" value="${updateUrl}" /></c:when>
  <c:otherwise><c:set var="entryAction" value="${registerUrl}" /></c:otherwise>
</c:choose>
<div class="erp-app">
  <jsp:include page="../common/brand-header.jsp" />
  <div class="app-body">
    <jsp:include page="../common/sidebar.jsp"><jsp:param name="activePage" value="basic/partner-list" /></jsp:include>
    <main class="workspace">
      <header class="screen-titlebar">
        <h1>거래처리스트</h1>
      </header>
      <section class="screen-content simple-page">
        <%-- 거래처 검색 / 取引先検索 --%>
        <form class="simple-search" method="get" action="${listUrl}" id="searchForm">
          <input type="search" name="q" id="searchInput" value="${fn:escapeXml(q)}"
            placeholder="검색어 입력" aria-label="거래처리스트 검색">
          <button type="submit" class="primary-button">검색(F3)</button>
        </form>
        <%-- 거래처 목록 / 取引先リスト --%>
        <div class="table-scroll">
          <table class="list-table">
            <thead>
              <tr>
                <th class="selection-column"><input type="checkbox" class="list-row-select" id="selectAllRows" aria-label="전체 선택"></th>
                <th>거래처코드</th>
                <th>상호(이름)</th>
                <th>사업자등록번호</th>
                <th>대표자</th>
                <th>수정</th>
              </tr>
            </thead>
            <tbody id="pageRows">
              <c:forEach items="${partnerPage.partners}" var="partner">
                <tr data-partner-row="${partner.partnerId}" data-use-yn="${partner.useYn}">
                  <td class="selection-column"><input type="checkbox" class="list-row-select partner-select" value="${partner.partnerId}" aria-label="${fn:escapeXml(partner.partnerName)} 선택"></td>
                  <td><c:out value="${partner.partnerCode}" /></td>
                  <td><c:out value="${partner.partnerName}" /></td>
                  <td><c:out value="${partner.bizNo}" /></td>
                  <td><c:out value="${partner.ceoName}" /></td>
                  <td><button type="button" class="row-edit-button" data-edit-id="${partner.partnerId}">수정</button></td>
                </tr>
              </c:forEach>
              <c:if test="${empty partnerPage.partners}">
                <tr><td colspan="6">등록된 데이터가 없습니다.</td></tr>
              </c:if>
            </tbody>
          </table>
        </div>
        <%-- 페이지 이동 / ページ移動 --%>
        <nav class="list-pagination" aria-label="페이지 이동">
          <span class="list-pagination-count">총 <c:out value="${partnerPage.totalCount}" />건</span>
          <div class="list-pagination-controls">
            <c:url var="firstUrl" value="/basic/partner-list"><c:param name="page" value="1"/><c:param name="q" value="${q}"/></c:url>
            <button type="button" aria-label="첫 페이지" data-page-url="${firstUrl}" ${partnerPage.page le 1 ? 'disabled' : ''}>«</button>
            <c:choose>
              <c:when test="${partnerPage.previous}">
                <c:url var="previousUrl" value="/basic/partner-list"><c:param name="page" value="${partnerPage.page - 1}"/><c:param name="q" value="${q}"/></c:url>
                <button type="button" aria-label="이전 페이지" data-page-url="${previousUrl}">‹</button>
              </c:when>
              <c:otherwise><button type="button" aria-label="이전 페이지" disabled>‹</button></c:otherwise>
            </c:choose>
            <span class="list-pagination-current" aria-current="page"><c:out value="${partnerPage.page}" /></span>
            <c:choose>
              <c:when test="${partnerPage.next}">
                <c:url var="nextUrl" value="/basic/partner-list"><c:param name="page" value="${partnerPage.page + 1}"/><c:param name="q" value="${q}"/></c:url>
                <button type="button" aria-label="다음 페이지" data-page-url="${nextUrl}">›</button>
              </c:when>
              <c:otherwise><button type="button" aria-label="다음 페이지" disabled>›</button></c:otherwise>
            </c:choose>
            <c:url var="lastUrl" value="/basic/partner-list"><c:param name="page" value="${partnerPage.totalPages}"/><c:param name="q" value="${q}"/></c:url>
            <button type="button" aria-label="마지막 페이지" data-page-url="${lastUrl}" ${partnerPage.page ge partnerPage.totalPages ? 'disabled' : ''}>»</button>
          </div>
          <span class="list-pagination-total"><c:out value="${partnerPage.page}" /> / <c:out value="${partnerPage.totalPages}" /> 페이지</span>
        </nav>
        <%-- 목록에서 사용할 버튼만 남김 / リストで使うボタンだけ残す --%>
        <div class="list-footer-actions" role="group" aria-label="목록 작업">
          <button type="button" id="newButton">신규(F2)</button>
          <button type="button" id="editButton">변경</button>
          <form action="${toggleUrl}" method="post" id="toggleForm" style="display:inline">
            <input type="hidden" name="partnerId" id="togglePartnerId">
            <input type="hidden" name="q" value="${fn:escapeXml(q)}">
            <input type="hidden" name="page" value="${partnerPage.page}">
            <button type="submit" id="toggleButton">사용중단/재사용</button>
          </form>
        </div>
      </section>
    </main>
  </div>

  <%-- 기존 등록창 디자인 유지 / 既存の登録画面デザインを維持 --%>
  <dialog id="entryDialog" class="simple-dialog reference-dialog" aria-labelledby="entryTitle">
    <form id="entryForm" method="post" action="${entryAction}" novalidate>
      <h2 id="entryTitle"><c:choose><c:when test="${not empty editingPartner}">거래처수정</c:when><c:otherwise>거래처등록</c:otherwise></c:choose></h2>
      <input type="hidden" name="partnerId" value="${editingPartner.partnerId}">
      <input type="hidden" name="q" value="${fn:escapeXml(q)}">
      <input type="hidden" name="page" value="${partnerPage.page}">
      <input type="hidden" name="useYn" value="${empty editingPartner.useYn ? 'Y' : editingPartner.useYn}">
      <div class="reference-fields">
        <%-- 부가정보 탭은 제외 / 付加情報タブは除外 --%>
        <div class="master-entry-tabs" role="tablist">
          <button type="button" role="tab" data-entry-tab="A1" aria-controls="panel-A1" aria-selected="true" class="active">기본</button>
          <button type="button" role="tab" data-entry-tab="A2" aria-controls="panel-A2" aria-selected="false">거래처정보</button>
          <button type="button" role="tab" data-entry-tab="A3" aria-controls="panel-A3" aria-selected="false">여신/단가</button>
        </div>

        <div class="reference-row" data-reference-label="거래처코드">
          <div class="reference-label">거래처코드</div>
          <div class="reference-control"><div class="control-set"><div class="control">
            <input type="text" class="form-control form-control first-child last-child" placeholder="거래처코드"
              name="partnerCode" id="field-common-code-0" value="${fn:escapeXml(editingPartner.partnerCode)}" required>
          </div></div></div>
        </div>

        <section id="panel-A1" data-entry-panel="A1" role="tabpanel">
          <div class="reference-row" data-reference-label="상호(이름)">
            <div class="reference-label">상호(이름)</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="상호(이름)" name="partnerName" value="${fn:escapeXml(editingPartner.partnerName)}" required>
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="사업자등록번호">
            <div class="reference-label">사업자등록번호</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="사업자등록번호" name="bizNo" value="${fn:escapeXml(editingPartner.bizNo)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="대표자명">
            <div class="reference-label">대표자명</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="대표자명" name="ceoName" value="${fn:escapeXml(editingPartner.ceoName)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="업태">
            <div class="reference-label">업태</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="업태" name="bizType" value="${fn:escapeXml(editingPartner.bizType)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="종목">
            <div class="reference-label">종목</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="종목" name="bizItem" value="${fn:escapeXml(editingPartner.bizItem)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="전화">
            <div class="reference-label">전화</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="전화" name="tel" value="${fn:escapeXml(editingPartner.tel)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="Fax">
            <div class="reference-label">Fax</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="Fax" name="fax" value="${fn:escapeXml(editingPartner.fax)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="검색창내용">
            <div class="reference-label">검색창내용</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="검색창내용" name="searchText" value="${fn:escapeXml(editingPartner.searchText)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="모바일">
            <div class="reference-label">모바일</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="모바일" name="mobile" value="${fn:escapeXml(editingPartner.mobile)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="홈페이지">
            <div class="reference-label">홈페이지</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="홈페이지" name="homepage" value="${fn:escapeXml(editingPartner.homepage)}">
            </div></div></div>
          </div>
        </section>

        <section id="panel-A2" data-entry-panel="A2" role="tabpanel" hidden>
          <div class="reference-row" data-reference-label="거래처구분">
            <div class="reference-label">거래처구분</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <select name="partnerType" aria-label="거래처구분">
                <option value="SALES" ${empty editingPartner.partnerType or editingPartner.partnerType eq 'SALES' ? 'selected' : ''}>매출처</option>
                <option value="PURCHASE" ${editingPartner.partnerType eq 'PURCHASE' ? 'selected' : ''}>매입처</option>
                <option value="BOTH" ${editingPartner.partnerType eq 'BOTH' ? 'selected' : ''}>겸용</option>
              </select>
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="거래처 담당자">
            <div class="reference-label">거래처 담당자</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="거래처 담당자" name="contactName" value="${fn:escapeXml(editingPartner.contactName)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="이메일">
            <div class="reference-label">이메일</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="email" class="form-control form-control first-child last-child" placeholder="이메일" name="email" value="${fn:escapeXml(editingPartner.email)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="주소1 우편번호">
            <div class="reference-label">주소1 우편번호</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="주소1 우편번호" name="zipCode1" value="${fn:escapeXml(editingPartner.zipCode1)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="주소1">
            <div class="reference-label">주소1</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <textarea rows="2" class="form-control first-child last-child" placeholder="주소1" name="address1">${fn:escapeXml(editingPartner.address1)}</textarea>
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="주소2 우편번호">
            <div class="reference-label">주소2 우편번호</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="주소2 우편번호" name="zipCode2" value="${fn:escapeXml(editingPartner.zipCode2)}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="주소2">
            <div class="reference-label">주소2</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <textarea rows="2" class="form-control first-child last-child" placeholder="주소2" name="address2">${fn:escapeXml(editingPartner.address2)}</textarea>
            </div></div></div>
          </div>
        </section>

        <section id="panel-A3" data-entry-panel="A3" role="tabpanel" hidden>
          <div class="reference-row" data-reference-label="담당사원번호">
            <div class="reference-label">담당사원번호</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="number" class="form-control form-control first-child last-child" placeholder="담당사원번호" name="employeeId" value="${editingPartner.employeeId}">
            </div></div></div>
          </div>
          <div class="reference-row" data-reference-label="통화코드">
            <div class="reference-label">통화코드</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <input type="text" class="form-control form-control first-child last-child" placeholder="통화코드" name="currencyCode" value="${fn:escapeXml(editingPartner.currencyCode)}">
            </div></div></div>
          </div>
        </section>
      </div>
      <p class="entry-error" role="alert"></p>
      <div class="simple-dialog-actions">
        <button type="submit" class="primary-button">저장(F8)</button>
        <button type="reset">다시 작성</button>
        <button type="button" id="entryCloseButton">닫기</button>
      </div>
    </form>
  </dialog>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
  const listUrl = "${listUrl}";
  const entryDialog = document.querySelector("#entryDialog");
  const entryForm = document.querySelector("#entryForm");
  const newButton = document.querySelector("#newButton");
  const editButton = document.querySelector("#editButton");
  // 한 번에 한 거래처만 선택
  // 一度に一つの取引先だけ選択
  const selectedRows = function () { return Array.from(document.querySelectorAll(".partner-select:checked")); };
  const selectedId = function () { const selected = selectedRows(); return selected.length === 1 ? selected[0].value : null; };

  const message = document.body.dataset.message;
  const error = document.body.dataset.error;
  if (message) alert(message);
  if (error) alert(error);

  document.querySelectorAll(".partner-select").forEach(function (checkbox) {
    checkbox.addEventListener("change", function () {
      if (checkbox.checked) document.querySelectorAll(".partner-select").forEach(function (other) { if (other !== checkbox) other.checked = false; });
    });
  });
  const selectAllRows = document.querySelector("#selectAllRows");
  if (selectAllRows) selectAllRows.addEventListener("change", function () {
    const first = document.querySelector(".partner-select");
    document.querySelectorAll(".partner-select").forEach(function (item) { item.checked = false; });
    if (selectAllRows.checked && first) first.checked = true;
  });

  // 신규와 수정 창 열기
  // 新規と修正画面を開く
  newButton.addEventListener("click", function () { location.href = listUrl + "?mode=new"; });
  const openEdit = function (id) { location.href = listUrl + "?editId=" + encodeURIComponent(id); };
  editButton.addEventListener("click", function () {
    const id = selectedId();
    if (!id) { alert("변경할 거래처를 하나 선택해 주세요."); return; }
    openEdit(id);
  });
  document.querySelectorAll("[data-edit-id]").forEach(function (button) {
    button.addEventListener("click", function () { openEdit(button.dataset.editId); });
  });
  document.querySelectorAll("[data-page-url]").forEach(function (button) {
    button.addEventListener("click", function () { if (button.dataset.pageUrl) location.href = button.dataset.pageUrl; });
  });

  // 선택한 거래처의 사용상태 변경
  // 選択した取引先の使用状態を変更
  document.querySelector("#toggleForm").addEventListener("submit", function (event) {
    const id = selectedId();
    if (!id) { event.preventDefault(); alert("사용 상태를 변경할 거래처를 하나 선택해 주세요."); return; }
    document.querySelector("#togglePartnerId").value = id;
  });

  document.querySelector("#entryCloseButton").addEventListener("click", function () { entryDialog.close(); });
  entryForm.addEventListener("submit", function (event) {
    const code = entryForm.querySelector("[name='partnerCode']").value.trim();
    const name = entryForm.querySelector("[name='partnerName']").value.trim();
    if (!code || !name) {
      event.preventDefault();
      entryForm.querySelector(".entry-error").textContent = "거래처코드와 상호(이름)는 필수입니다.";
    }
  });

  // 등록창 탭 이동
  // 登録画面のタブ移動
  const tabs = Array.from(document.querySelectorAll("#entryForm [data-entry-tab]"));
  tabs.forEach(function (tab) {
    tab.addEventListener("click", function () {
      tabs.forEach(function (item) {
        const active = item.dataset.entryTab === tab.dataset.entryTab;
        item.classList.toggle("active", active);
        item.setAttribute("aria-selected", String(active));
      });
      document.querySelectorAll("#entryForm [data-entry-panel]").forEach(function (panel) {
        panel.hidden = panel.dataset.entryPanel !== tab.dataset.entryTab;
      });
    });
  });
  if (tabs.length) tabs[0].click();

  if (${openNew or not empty editingPartner}) entryDialog.showModal();
  document.addEventListener("keydown", function (event) {
    if (event.key === "F2" && !entryDialog.open) { event.preventDefault(); newButton.click(); }
    if (event.key === "F8" && entryDialog.open) { event.preventDefault(); entryForm.requestSubmit(); }
    if (event.key === "F3" && !entryDialog.open) { event.preventDefault(); document.querySelector("#searchForm").requestSubmit(); }
  });
});
</script>
</body>
</html>
