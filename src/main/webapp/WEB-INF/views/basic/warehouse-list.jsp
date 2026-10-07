<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>창고등록리스트</title>
<jsp:include page="../common/styles.jsp" />
<style>
.include-inactive-button {
	height: 36px;
	padding: 0 20px;
	border: 1px solid var(--line);
	border-radius: 0;
	background: #fff;
	color: var(--text);
	white-space: nowrap;
}

.include-inactive-button:focus,
.include-inactive-button:focus-visible {
	outline: none;
	box-shadow: none;
}
</style>
</head>
<body data-message="${fn:escapeXml(message)}"
	data-error="${fn:escapeXml(error)}">
	<c:url var="listUrl" value="/basic/warehouse-list" />
	<c:url var="registerUrl" value="/basic/warehouse/register" />
	<c:url var="updateUrl" value="/basic/warehouse/update" />
	<c:url var="toggleUrl" value="/basic/warehouse/toggle-use" />
	<c:choose>
		<c:when test="${not empty editingWarehouse}">
			<c:set var="entryAction" value="${updateUrl}" />
		</c:when>
		<c:otherwise>
			<c:set var="entryAction" value="${registerUrl}" />
		</c:otherwise>
	</c:choose>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="basic/warehouse-list" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>창고등록리스트</h1>
				</header>
				<section class="screen-content simple-page">
					<form class="simple-search" method="get" action="${listUrl}"
						id="searchForm">
						<input type="search" name="q" id="searchInput"
							value="${fn:escapeXml(q)}" placeholder="검색어 입력"
							aria-label="창고등록리스트 검색"> <input type="hidden"
							name="includeInactive" id="includeInactiveInput"
							value="${includeInactive}">
						<button type="submit" class="primary-button">검색(F3)</button>
						<button type="button" class="include-inactive-button"
							id="includeInactiveButton" aria-pressed="${includeInactive}">사용중단포함</button>
					</form>
					<div class="table-scroll">
						<table class="list-table">
							<thead>
								<tr>
									<th class="selection-column"><input type="checkbox"
										class="list-row-select" id="selectAllRows" aria-label="전체 선택"></th>
									<th>창고코드</th>
									<th>창고명</th>
									<th>구분</th>
									<th>사용상태</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody id="pageRows">
								<c:forEach items="${warehousePage.warehouses}" var="warehouse">
									<tr data-warehouse-row="${warehouse.warehouseId}">
										<td class="selection-column"><input type="checkbox"
											class="list-row-select warehouse-select"
											value="${warehouse.warehouseId}"
											aria-label="${fn:escapeXml(warehouse.warehouseName)} 선택"></td>
										<td><c:out value="${warehouse.warehouseCode}" /></td>
										<td><c:out value="${warehouse.warehouseName}" /></td>
										<td><c:choose>
												<c:when test="${warehouse.warehouseType eq 'FACTORY'}">공장</c:when>
												<c:otherwise>창고</c:otherwise>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${warehouse.useYn eq 'Y'}">사용</c:when>
												<c:otherwise>사용중단</c:otherwise>
											</c:choose></td>
										<td><button type="button" class="row-edit-button"
												data-edit-id="${warehouse.warehouseId}">수정</button></td>
									</tr>
								</c:forEach>
								<c:if test="${empty warehousePage.warehouses}">
									<tr>
										<td colspan="6">등록된 데이터가 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<nav class="list-pagination" aria-label="페이지 이동">
						<span class="list-pagination-count">총 <c:out
								value="${warehousePage.totalCount}" />건
						</span>
						<div class="list-pagination-controls">
							<c:url var="firstUrl" value="/basic/warehouse-list">
								<c:param name="page" value="1" />
								<c:param name="q" value="${q}" />
								<c:param name="includeInactive" value="${includeInactive}" />
							</c:url>
							<button type="button" aria-label="첫 페이지"
								data-page-url="${firstUrl}"
								${warehousePage.page le 1 ? 'disabled' : ''}>«</button>
							<c:choose>
								<c:when test="${warehousePage.previous}">
									<c:url var="previousUrl" value="/basic/warehouse-list">
										<c:param name="page" value="${warehousePage.startPage - 1}" />
										<c:param name="q" value="${q}" />
										<c:param name="includeInactive" value="${includeInactive}" />
									</c:url>
									<button type="button" aria-label="이전 페이지 묶음"
										data-page-url="${previousUrl}">‹</button>
								</c:when>
								<c:otherwise>
									<button type="button" aria-label="이전 페이지 묶음" disabled>‹</button>
								</c:otherwise>
							</c:choose>
							<c:forEach var="pageNumber" begin="${warehousePage.startPage}"
								end="${warehousePage.endPage}">
								<c:choose>
									<c:when test="${pageNumber eq warehousePage.page}">
										<span class="list-pagination-current" aria-current="page"><c:out
												value="${pageNumber}" /></span>
									</c:when>
									<c:otherwise>
										<c:url var="pageUrl" value="/basic/warehouse-list">
											<c:param name="page" value="${pageNumber}" />
											<c:param name="q" value="${q}" />
											<c:param name="includeInactive" value="${includeInactive}" />
										</c:url>
										<button type="button" aria-label="${pageNumber} 페이지"
											data-page-url="${pageUrl}">
											<c:out value="${pageNumber}" />
										</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${warehousePage.next}">
									<c:url var="nextUrl" value="/basic/warehouse-list">
										<c:param name="page" value="${warehousePage.endPage + 1}" />
										<c:param name="q" value="${q}" />
										<c:param name="includeInactive" value="${includeInactive}" />
									</c:url>
									<button type="button" aria-label="다음 페이지 묶음"
										data-page-url="${nextUrl}">›</button>
								</c:when>
								<c:otherwise>
									<button type="button" aria-label="다음 페이지 묶음" disabled>›</button>
								</c:otherwise>
							</c:choose>
							<c:url var="lastUrl" value="/basic/warehouse-list">
								<c:param name="page" value="${warehousePage.totalPages}" />
								<c:param name="q" value="${q}" />
								<c:param name="includeInactive" value="${includeInactive}" />
							</c:url>
							<button type="button" aria-label="마지막 페이지"
								data-page-url="${lastUrl}"
								${warehousePage.page ge warehousePage.totalPages ? 'disabled' : ''}>»</button>
						</div>
						<span class="list-pagination-total"><c:out
								value="${warehousePage.page}" /> / <c:out
								value="${warehousePage.totalPages}" /> 페이지</span>
					</nav>
					<div class="list-footer-actions" role="group" aria-label="목록 작업">
						<button type="button" id="newButton">신규(F2)</button>
						<button type="button" id="editButton">변경</button>
						<form action="${toggleUrl}" method="post" id="toggleForm"
							style="display: inline">
							<input type="hidden" name="warehouseId" id="toggleWarehouseId">
							<input type="hidden" name="q" value="${fn:escapeXml(q)}">
							<input type="hidden" name="page" value="${warehousePage.page}">
							<input type="hidden" name="includeInactive"
								value="${includeInactive}">
							<button type="submit">사용중단/재사용</button>
						</form>
					</div>
				</section>
			</main>
		</div>

		<dialog id="entryDialog" class="simple-dialog reference-dialog"
			aria-labelledby="entryTitle">
		<form id="entryForm" method="post" action="${entryAction}" novalidate>
			<h2 id="entryTitle">
				<c:choose>
					<c:when test="${not empty editingWarehouse}">창고수정</c:when>
					<c:otherwise>창고등록</c:otherwise>
				</c:choose>
			</h2>
			<input type="hidden" name="warehouseId"
				value="${editingWarehouse.warehouseId}"> <input
				type="hidden" name="q" value="${fn:escapeXml(q)}"> <input
				type="hidden" name="page" value="${warehousePage.page}"> <input
				type="hidden" name="includeInactive" value="${includeInactive}">
			<div class="reference-fields">
				<div class="master-entry-tabs" role="tablist">
					<button type="button" role="tab" data-entry-tab="A1"
						aria-controls="panel-A1" aria-selected="true" class="active">기본</button>
					<button type="button" role="tab" data-entry-tab="A2"
						aria-controls="panel-A2" aria-selected="false">창고정보</button>
				</div>
				<div class="reference-row" data-reference-label="창고코드">
					<div class="reference-label">창고코드</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<input type="text"
									class="form-control form-control first-child last-child"
									placeholder="창고코드" name="warehouseCode"
									value="${fn:escapeXml(editingWarehouse.warehouseCode)}"
									${not empty editingWarehouse ? 'readonly' : ''} required>
							</div>
						</div>
					</div>
				</div>
				<section id="panel-A1" data-entry-panel="A1" role="tabpanel">
					<div class="reference-row" data-reference-label="창고명">
						<div class="reference-label">창고명</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control">
									<input type="text" id="warehouseNameBasic"
										class="form-control form-control first-child last-child"
										placeholder="창고명" name="warehouseName"
										value="${fn:escapeXml(editingWarehouse.warehouseName)}"
										required>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="구분">
						<div class="reference-label">구분</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control">
									<span class="form-radio"><input type="radio"
										id="warehouseTypeNormal" name="warehouseType" value="NORMAL"
										${empty editingWarehouse.warehouseType or editingWarehouse.warehouseType eq 'NORMAL' ? 'checked' : ''}><label
										for="warehouseTypeNormal">창고</label></span> <span class="form-radio"><input
										type="radio" id="warehouseTypeFactory" name="warehouseType"
										value="FACTORY"
										${editingWarehouse.warehouseType eq 'FACTORY' ? 'checked' : ''}><label
										for="warehouseTypeFactory">공장</label></span> <span class="form-radio"><input
										type="radio" id="warehouseTypeOutside" name="warehouseType"
										value="OUTSIDE"
										${editingWarehouse.warehouseType eq 'OUTSIDE' ? 'checked' : ''}><label
										for="warehouseTypeOutside">공장(외주비관리)</label></span>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A2" data-entry-panel="A2" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="창고명">
						<div class="reference-label">창고명</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control">
									<input type="text" id="warehouseNameInfo"
										class="form-control form-control first-child last-child"
										placeholder="창고명"
										value="${fn:escapeXml(editingWarehouse.warehouseName)}">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="구분">
						<div class="reference-label">구분</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control">
									<span class="form-radio"><input type="radio"
										id="warehouseTypeInfoNormal" name="warehouseTypeInfo"
										value="NORMAL"
										${empty editingWarehouse.warehouseType or editingWarehouse.warehouseType eq 'NORMAL' ? 'checked' : ''}><label
										for="warehouseTypeInfoNormal">창고</label></span> <span
										class="form-radio"><input type="radio"
										id="warehouseTypeInfoFactory" name="warehouseTypeInfo"
										value="FACTORY"
										${editingWarehouse.warehouseType eq 'FACTORY' ? 'checked' : ''}><label
										for="warehouseTypeInfoFactory">공장</label></span> <span
										class="form-radio"><input type="radio"
										id="warehouseTypeInfoOutside" name="warehouseTypeInfo"
										value="OUTSIDE"
										${editingWarehouse.warehouseType eq 'OUTSIDE' ? 'checked' : ''}><label
										for="warehouseTypeInfoOutside">공장(외주비관리)</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="사용형태">
						<div class="reference-label">사용형태</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control">
									<span class="form-radio"><input type="radio"
										id="useYnYes" name="useYn" value="Y"
										${empty editingWarehouse.useYn or editingWarehouse.useYn eq 'Y' ? 'checked' : ''}><label
										for="useYnYes">사용</label></span> <span class="form-radio"><input
										type="radio" id="useYnNo" name="useYn" value="N"
										${editingWarehouse.useYn eq 'N' ? 'checked' : ''}><label
										for="useYnNo">사용중단</label></span>
								</div>
							</div>
						</div>
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
  const searchForm = document.querySelector("#searchForm");
  const includeInactiveInput = document.querySelector("#includeInactiveInput");
  const newButton = document.querySelector("#newButton");
  const tabs = Array.from(document.querySelectorAll("#entryForm [data-entry-tab]"));
  const warehouseNameBasic = document.querySelector("#warehouseNameBasic");
  const warehouseNameInfo = document.querySelector("#warehouseNameInfo");
  const warehouseTypes = Array.from(document.querySelectorAll("[name='warehouseType']"));
  const warehouseTypesInfo = Array.from(document.querySelectorAll("[name='warehouseTypeInfo']"));
  const selectedRows = function () { return Array.from(document.querySelectorAll(".warehouse-select:checked")); };
  const selectedId = function () { const rows = selectedRows(); return rows.length === 1 ? rows[0].value : null; };
  const message = document.body.dataset.message;
  const error = document.body.dataset.error;
  if (message) alert(message);
  if (error) alert(error);

  // 기본과 창고정보의 입력값 맞추기
  // 基本と倉庫情報の入力値を合わせる
  const copyWarehouseType = function (source, target) {
    const selected = source.find(function (radio) { return radio.checked; });
    target.forEach(function (radio) { radio.checked = selected && radio.value === selected.value; });
  };
  const copyBasicToInfo = function () {
    warehouseNameInfo.value = warehouseNameBasic.value;
    copyWarehouseType(warehouseTypes, warehouseTypesInfo);
  };
  warehouseNameBasic.addEventListener("input", copyBasicToInfo);
  warehouseNameInfo.addEventListener("input", function () { warehouseNameBasic.value = warehouseNameInfo.value; });
  warehouseTypes.forEach(function (radio) { radio.addEventListener("change", copyBasicToInfo); });
  warehouseTypesInfo.forEach(function (radio) {
    radio.addEventListener("change", function () { copyWarehouseType(warehouseTypesInfo, warehouseTypes); });
  });
  copyBasicToInfo();

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
  entryForm.addEventListener("reset", function () {
    if (tabs.length) setTimeout(function () { tabs[0].click(); copyBasicToInfo(); }, 0);
  });
  document.querySelectorAll("[data-original-action]").forEach(function (button) {
    button.addEventListener("click", function () {
      alert(button.dataset.originalAction + " 기능 구현이 필요합니다.");
    });
  });

  document.querySelector("#includeInactiveButton").addEventListener("click", function () {
    includeInactiveInput.value = includeInactiveInput.value === "true" ? "false" : "true";
    searchForm.requestSubmit();
  });
  // 변경과 사용중단 대상은 한 건만 선택한다
  // 変更と使用停止の対象は一件だけ選択する
  document.querySelectorAll(".warehouse-select").forEach(function (checkbox) {
    checkbox.addEventListener("change", function () {
      if (checkbox.checked) document.querySelectorAll(".warehouse-select").forEach(function (other) { if (other !== checkbox) other.checked = false; });
    });
  });
  document.querySelector("#selectAllRows").addEventListener("change", function (event) {
    document.querySelectorAll(".warehouse-select").forEach(function (item) { item.checked = false; });
    const first = document.querySelector(".warehouse-select");
    if (event.target.checked && first) first.checked = true;
  });

  // 화면을 다시 열어도 현재 검색 조건을 유지한다
  // 画面を開き直しても現在の検索条件を維持する
  const listParams = function () {
    const params = new URLSearchParams();
    const keyword = document.querySelector("#searchInput").value.trim();
    if (keyword) params.set("q", keyword);
    if (includeInactiveInput.value === "true") params.set("includeInactive", "true");
    return params;
  };
  newButton.addEventListener("click", function () {
    const params = listParams();
    params.set("mode", "new");
    location.href = listUrl + "?" + params.toString();
  });
  const openEdit = function (id) {
    const params = listParams();
    params.set("editId", id);
    params.set("page", "${warehousePage.page}");
    location.href = listUrl + "?" + params.toString();
  };
  document.querySelector("#editButton").addEventListener("click", function () {
    const id = selectedId();
    if (!id) { alert("변경할 창고를 하나 선택해 주세요."); return; }
    openEdit(id);
  });
  document.querySelectorAll("[data-edit-id]").forEach(function (button) { button.addEventListener("click", function () { openEdit(button.dataset.editId); }); });
  document.querySelectorAll("[data-page-url]").forEach(function (button) { button.addEventListener("click", function () { if (button.dataset.pageUrl) location.href = button.dataset.pageUrl; }); });
  document.querySelector("#toggleForm").addEventListener("submit", function (event) {
    const id = selectedId();
    if (!id) { event.preventDefault(); alert("사용 상태를 변경할 창고를 하나 선택해 주세요."); return; }
    document.querySelector("#toggleWarehouseId").value = id;
  });
  document.querySelector("#entryCloseButton").addEventListener("click", function () { entryDialog.close(); });
  entryForm.addEventListener("submit", function (event) {
    const code = entryForm.querySelector("[name='warehouseCode']").value.trim();
    const name = entryForm.querySelector("[name='warehouseName']").value.trim();
    if (!code || !name) {
      event.preventDefault();
      entryForm.querySelector(".entry-error").textContent = "창고코드와 창고명은 필수입니다.";
    }
  });
  if (${openNew or not empty editingWarehouse}) entryDialog.showModal();
  document.addEventListener("keydown", function (event) {
    if (event.key === "F2" && !entryDialog.open) { event.preventDefault(); newButton.click(); }
    if (event.key === "F8" && entryDialog.open) { event.preventDefault(); entryForm.requestSubmit(); }
    if (event.key === "F3" && !entryDialog.open) { event.preventDefault(); searchForm.requestSubmit(); }
  });
});
</script>
</body>
</html>

