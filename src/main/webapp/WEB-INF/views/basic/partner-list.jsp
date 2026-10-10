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
<style>
.simple-search .include-inactive-button {
	height: 36px;
	padding: 0 20px;
	border: 1px solid #dce2ea !important;
	border-radius: 0;
	outline: 0;
	background: #fff !important;
	box-shadow: none;
	color: #10204a !important;
	white-space: nowrap;
	appearance: none;
}

.simple-search .include-inactive-button:hover,
.simple-search .include-inactive-button:focus,
.simple-search .include-inactive-button:focus-visible,
.simple-search .include-inactive-button:active {
	border: 1px solid #dce2ea !important;
	outline: 0;
	background: #fff !important;
	box-shadow: none;
	color: #10204a !important;
}

.simple-page .list-table th .list-sort-button {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  width: auto;
  min-width: 0;
  height: auto;
  margin: 0;
  padding: 0;
  border: 0;
  border-radius: 0;
  background: transparent;
  box-shadow: none;
  color: #123b8f;
  font: inherit;
  font-weight: 600;
  line-height: 1;
  cursor: pointer;
  appearance: none;
}

.simple-page .list-table th .list-sort-button:hover,
.simple-page .list-table th .list-sort-button:focus,
.simple-page .list-table th .list-sort-button:focus-visible {
  padding: 0;
  border: 0;
  outline: none;
  background: transparent;
  box-shadow: none;
  color: #2457b8;
}

.sort-arrow {
  display: inline-block;
  width: 0;
  height: 0;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 6px solid #123b8f;
}

</style>
</head>
<body data-message="${fn:escapeXml(message)}" data-error="${fn:escapeXml(error)}">
<c:url var="listUrl" value="/basic/partner-list" />
<c:url var="registerUrl" value="/basic/partner/register" />
<c:url var="updateUrl" value="/basic/partner/update" />
<c:url var="toggleUrl" value="/basic/partner/toggle-use" />
<c:url var="deleteUrl" value="/basic/partner/delete" />
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
        <form class="simple-search" method="get" action="${listUrl}" id="searchForm">
          <input type="search" name="q" id="searchInput" value="${fn:escapeXml(q)}"
            placeholder="검색어 입력" aria-label="거래처리스트 검색">
          <input type="hidden" name="includeInactive" id="includeInactiveInput" value="${includeInactive}">
          <input type="hidden" name="sortBy" id="sortByInput" value="${partnerPage.sortBy}">
          <input type="hidden" name="sortDirection" id="sortDirectionInput" value="${partnerPage.sortDirection}">
          <button type="submit" class="primary-button">검색(F3)</button>
          <button type="button" class="include-inactive-button" id="includeInactiveButton" aria-pressed="${includeInactive}">사용중단포함</button>
        </form>
        <div class="table-scroll">
          <table class="list-table">
            <thead>
              <tr>
                <th class="selection-column"><input type="checkbox" class="list-row-select" id="selectAllRows" aria-label="전체 선택"></th>
                <th><button type="button" class="list-sort-button" data-sort-by="code">거래처코드<span class="sort-arrow"></span></button></th>
                <th><button type="button" class="list-sort-button" data-sort-by="name">상호(이름)<span class="sort-arrow"></span></button></th>
                <th><button type="button" class="list-sort-button" data-sort-by="bizNo">사업자등록번호<span class="sort-arrow"></span></button></th>
                <th><button type="button" class="list-sort-button" data-sort-by="ceo">대표자<span class="sort-arrow"></span></button></th>
                <th><button type="button" class="list-sort-button" data-sort-by="status">사용상태<span class="sort-arrow"></span></button></th>
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
                  <td><c:choose><c:when test="${partner.useYn eq 'N'}">사용중단</c:when><c:otherwise>사용</c:otherwise></c:choose></td>
                  <td><button type="button" class="row-edit-button" data-edit-id="${partner.partnerId}">수정</button></td>
                </tr>
              </c:forEach>
              <c:if test="${empty partnerPage.partners}">
                <tr><td colspan="7">등록된 데이터가 없습니다.</td></tr>
              </c:if>
            </tbody>
          </table>
        </div>
        <nav class="list-pagination" aria-label="페이지 이동">
          <span class="list-pagination-count">총 <c:out value="${partnerPage.totalCount}" />건</span>
          <div class="list-pagination-controls">
            <c:url var="firstUrl" value="/basic/partner-list"><c:param name="page" value="1"/><c:param name="q" value="${q}"/><c:param name="includeInactive" value="${includeInactive}"/><c:param name="sortBy" value="${partnerPage.sortBy}"/><c:param name="sortDirection" value="${partnerPage.sortDirection}"/></c:url>
            <button type="button" aria-label="첫 페이지" data-page-url="${firstUrl}" ${partnerPage.page le 1 ? 'disabled' : ''}>«</button>
            <c:choose>
              <c:when test="${partnerPage.previous}">
                <c:url var="previousUrl" value="/basic/partner-list"><c:param name="page" value="${partnerPage.startPage - 1}"/><c:param name="q" value="${q}"/><c:param name="includeInactive" value="${includeInactive}"/><c:param name="sortBy" value="${partnerPage.sortBy}"/><c:param name="sortDirection" value="${partnerPage.sortDirection}"/></c:url>
                <button type="button" aria-label="이전 페이지 묶음" data-page-url="${previousUrl}">‹</button>
              </c:when>
              <c:otherwise><button type="button" aria-label="이전 페이지 묶음" disabled>‹</button></c:otherwise>
            </c:choose>
            <c:forEach var="pageNumber" begin="${partnerPage.startPage}" end="${partnerPage.endPage}">
              <c:choose>
                <c:when test="${pageNumber eq partnerPage.page}">
                  <span class="list-pagination-current" aria-current="page"><c:out value="${pageNumber}" /></span>
                </c:when>
                <c:otherwise>
                  <c:url var="pageUrl" value="/basic/partner-list"><c:param name="page" value="${pageNumber}"/><c:param name="q" value="${q}"/><c:param name="includeInactive" value="${includeInactive}"/><c:param name="sortBy" value="${partnerPage.sortBy}"/><c:param name="sortDirection" value="${partnerPage.sortDirection}"/></c:url>
                  <button type="button" aria-label="${pageNumber} 페이지" data-page-url="${pageUrl}"><c:out value="${pageNumber}" /></button>
                </c:otherwise>
              </c:choose>
            </c:forEach>
            <c:choose>
              <c:when test="${partnerPage.next}">
                <c:url var="nextUrl" value="/basic/partner-list"><c:param name="page" value="${partnerPage.endPage + 1}"/><c:param name="q" value="${q}"/><c:param name="includeInactive" value="${includeInactive}"/><c:param name="sortBy" value="${partnerPage.sortBy}"/><c:param name="sortDirection" value="${partnerPage.sortDirection}"/></c:url>
                <button type="button" aria-label="다음 페이지 묶음" data-page-url="${nextUrl}">›</button>
              </c:when>
              <c:otherwise><button type="button" aria-label="다음 페이지 묶음" disabled>›</button></c:otherwise>
            </c:choose>
            <c:url var="lastUrl" value="/basic/partner-list"><c:param name="page" value="${partnerPage.totalPages}"/><c:param name="q" value="${q}"/><c:param name="includeInactive" value="${includeInactive}"/><c:param name="sortBy" value="${partnerPage.sortBy}"/><c:param name="sortDirection" value="${partnerPage.sortDirection}"/></c:url>
            <button type="button" aria-label="마지막 페이지" data-page-url="${lastUrl}" ${partnerPage.page ge partnerPage.totalPages ? 'disabled' : ''}>»</button>
          </div>
          <span class="list-pagination-total"><c:out value="${partnerPage.page}" /> / <c:out value="${partnerPage.totalPages}" /> 페이지</span>
        </nav>
        <div class="list-footer-actions" role="group" aria-label="목록 작업">
          <button type="button" id="newButton">신규(F2)</button>
          <button type="button" id="editButton">변경</button>
          <form action="${toggleUrl}" method="post" id="toggleForm" style="display:inline">
            <input type="hidden" name="partnerId" id="togglePartnerId">
            <input type="hidden" name="q" value="${fn:escapeXml(q)}">
            <input type="hidden" name="page" value="${partnerPage.page}">
            <input type="hidden" name="includeInactive" value="${includeInactive}">
            <input type="hidden" name="sortBy" value="${partnerPage.sortBy}">
            <input type="hidden" name="sortDirection" value="${partnerPage.sortDirection}">
            <button type="submit" id="toggleButton">사용중단/재사용</button>
          </form>
          <form action="${deleteUrl}" method="post" id="deleteForm" style="display:inline">
            <input type="hidden" name="partnerId" id="deletePartnerId">
            <input type="hidden" name="q" value="${fn:escapeXml(q)}">
            <input type="hidden" name="page" value="${partnerPage.page}">
            <input type="hidden" name="includeInactive" value="${includeInactive}">
            <input type="hidden" name="sortBy" value="${partnerPage.sortBy}">
            <input type="hidden" name="sortDirection" value="${partnerPage.sortDirection}">
            <button type="submit">삭제</button>
          </form>
        </div>
      </section>
    </main>
  </div>

  <dialog id="entryDialog" class="simple-dialog reference-dialog" aria-labelledby="entryTitle">
    <form id="entryForm" method="post" action="${entryAction}" novalidate>
      <h2 id="entryTitle"><c:choose><c:when test="${not empty editingPartner}">거래처수정</c:when><c:otherwise>거래처등록</c:otherwise></c:choose></h2>
      <input type="hidden" name="partnerId" value="${editingPartner.partnerId}">
      <input type="hidden" name="q" value="${fn:escapeXml(q)}">
      <input type="hidden" name="page" value="${partnerPage.page}">
      <input type="hidden" name="includeInactive" value="${includeInactive}">
      <input type="hidden" name="sortBy" value="${partnerPage.sortBy}">
      <input type="hidden" name="sortDirection" value="${partnerPage.sortDirection}">
      <div class="reference-fields">
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
          <div class="reference-row" data-reference-label="사용형태">
            <div class="reference-label">사용형태</div>
            <div class="reference-control"><div class="control-set"><div class="control">
              <span class="form-radio"><input type="radio" id="partnerUseYnYes" name="useYn" value="Y" ${empty editingPartner.useYn or editingPartner.useYn eq 'Y' ? 'checked' : ''}><label for="partnerUseYnYes">사용</label></span>
              <span class="form-radio"><input type="radio" id="partnerUseYnNo" name="useYn" value="N" ${editingPartner.useYn eq 'N' ? 'checked' : ''}><label for="partnerUseYnNo">사용중단</label></span>
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
  const searchForm = document.querySelector("#searchForm");
  const includeInactiveInput = document.querySelector("#includeInactiveInput");
  const includeInactiveButton = document.querySelector("#includeInactiveButton");
  const sortByInput = document.querySelector("#sortByInput");
  const sortDirectionInput = document.querySelector("#sortDirectionInput");
  const rowCheckboxes = Array.from(document.querySelectorAll(".partner-select"));
  const selectAllRows = document.querySelector("#selectAllRows");
  const selectedRows = function () { return rowCheckboxes.filter(function (checkbox) { return checkbox.checked; }); };
  const selectedId = function () { const selected = selectedRows(); return selected.length === 1 ? selected[0].value : null; };

  const message = document.body.dataset.message;
  const error = document.body.dataset.error;
  if (message) alert(message);
  if (error) alert(error);

  includeInactiveButton.addEventListener("click", function () {
    includeInactiveInput.value = includeInactiveInput.value === "true" ? "false" : "true";
    searchForm.requestSubmit();
  });

  // 개별 선택 상태를 전체선택 체크박스에 반영한다
  // 個別選択の状態を全選択チェックボックスに反映する
  const syncSelectAll = function () {
    const checkedCount = selectedRows().length;
    selectAllRows.checked = rowCheckboxes.length > 0 && checkedCount === rowCheckboxes.length;
    selectAllRows.indeterminate = checkedCount > 0 && checkedCount < rowCheckboxes.length;
  };
  rowCheckboxes.forEach(function (checkbox) {
    checkbox.addEventListener("change", syncSelectAll);
  });
  selectAllRows.addEventListener("change", function () {
    rowCheckboxes.forEach(function (checkbox) { checkbox.checked = selectAllRows.checked; });
    syncSelectAll();
  });

  // 같은 제목을 다시 누르면 정렬 방향을 반대로 바꾼다
  // 同じ見出しを再度押すと並び順を反転する
  document.querySelectorAll("[data-sort-by]").forEach(function (button) {
    button.addEventListener("click", function () {
      const nextSortBy = button.dataset.sortBy;
      const sameColumn = sortByInput.value === nextSortBy;
      sortDirectionInput.value = sameColumn && sortDirectionInput.value === "asc" ? "desc" : "asc";
      sortByInput.value = nextSortBy;
      searchForm.requestSubmit();
    });
  });

  const currentListParams = function () {
    const params = new URLSearchParams();
    const keyword = document.querySelector("#searchInput").value.trim();
    if (keyword) params.set("q", keyword);
    if (includeInactiveInput.value === "true") params.set("includeInactive", "true");
    params.set("sortBy", sortByInput.value);
    params.set("sortDirection", sortDirectionInput.value);
    return params;
  };
  newButton.addEventListener("click", function () {
    const params = currentListParams();
    params.set("mode", "new");
    location.href = listUrl + "?" + params.toString();
  });
  const openEdit = function (id) {
    const params = currentListParams();
    params.set("editId", id);
    params.set("page", "${partnerPage.page}");
    location.href = listUrl + "?" + params.toString();
  };
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

  document.querySelector("#toggleForm").addEventListener("submit", function (event) {
    const id = selectedId();
    if (!id) { event.preventDefault(); alert("사용 상태를 변경할 거래처를 하나 선택해 주세요."); return; }
    document.querySelector("#togglePartnerId").value = id;
  });

  // 선택한 거래처는 DB에서 지우지 않고 삭제상태로 바꾼다
  // 選択した取引先はDBから削除せず削除状態に変更する
  document.querySelector("#deleteForm").addEventListener("submit", function (event) {
    const id = selectedId();
    if (!id) { event.preventDefault(); alert("삭제할 거래처를 하나 선택해 주세요."); return; }
    if (!confirm("선택한 거래처를 삭제하시겠습니까?")) { event.preventDefault(); return; }
    document.querySelector("#deletePartnerId").value = id;
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


