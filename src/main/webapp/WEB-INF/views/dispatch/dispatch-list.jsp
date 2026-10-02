<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>출하지시서조회</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="dispatch/dispatch-list" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>출하지시서조회</h1>
				</header>
				<section class="screen-content simple-page">
					
					<form class="simple-search" method="get"
						action="${pageContext.request.contextPath}/shiprequest/list">
						<input type="search" name="q" id="searchInput"
							placeholder="검색어 입력" aria-label="출하지시서조회 검색">
						<button type="submit" class="primary-button">검색(F3)</button>
					</form>
					<div class="table-scroll">
						<table class="list-table">
							<thead>
								<tr>
									<th class="selection-column"><input type="checkbox"
										class="list-row-select" id="selectAllRows" aria-label="전체 선택"></th>
									<th>일자</th>
									<th>번호</th>
									<th>거래처</th>
									<th>품목</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody id="pageRows">
								<tr>
									<td colspan="6">등록된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<nav class="list-pagination" aria-label="페이지 이동">
					  <span class="list-pagination-count">총 0건</span>
					  <div class="list-pagination-controls">
					    <button type="button" aria-label="첫 페이지" disabled>«</button>
					    <button type="button" aria-label="이전 페이지" disabled>‹</button>
					    <span class="list-pagination-current" aria-current="page">1</span>
					    <button type="button" aria-label="다음 페이지" disabled>›</button>
					    <button type="button" aria-label="마지막 페이지" disabled>»</button>
					  </div>
					  <span class="list-pagination-total">1 / 1 페이지</span>
					</nav>
					<div class="list-footer-actions" role="group" aria-label="목록 작업">
						<button type="button" id="newButton">신규(F2)</button>
						<button type="button" data-list-action="integration">Email</button>
						<button type="button" data-list-action="integration">진행상태변경</button>
						<button type="button" data-list-action="integration">보내기</button>
						<button type="button" data-list-action="print">인쇄</button>
						<button type="button" data-list-action="integration">바코드(품목)</button>
						<button type="button" data-list-action="integration">전자결재</button>
						<button type="button" data-list-action="delete">선택삭제</button>
						<button type="button" data-list-action="export">Excel</button>
						<button type="button" data-list-action="integration">이력조회</button>
						<button type="button" data-list-action="integration">웹자료올리기</button>
					</div>
				</section>
			</main>
		</div>
		<dialog id="entryDialog" class="simple-dialog reference-dialog document-dialog"
			aria-labelledby="entryTitle">
		<form id="entryForm" novalidate>
			<h2 id="entryTitle">출하지시서입력</h2>
			<div class="reference-fields">
				<div class="reference-row" data-reference-label="일자-No.">
					<div class="reference-label">일자-No.</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<div class="wrapper-datepicker">
									<div class="wrapper-datepicker">
										<select data-field-key="dateYear" data-cid="year"
											name="dateYear" aria-label="일자-No." data-date-year="true"
											id="field-main-dateYear-0"><option value="====">====</option>
											<option value="2027">2027</option>
											<option value="2026" selected="">2026</option>
											<option value="2025">2025</option>
											<option value="2024">2024</option>
											<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
											data-field-key="dateMonth" data-cid="month" name="dateMonth"
											aria-label="일자-No." data-date-month="true"
											id="field-main-dateMonth-1"><option value="==">==</option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09" selected="">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option></select>&nbsp;<span>/&nbsp;</span><input
											id="field-main-dateDay-2" autocomplete="off"
											class="form-control  textbox-inline" placeholder=""
											value="28" data-field-key="dateDay" name="dateDay"
											aria-label="일자-No.">&nbsp;
										<div class="btn-datepicker-toggle" role="button" tabindex="0"
											data-calendar="true" aria-label="일자-No. 달력">▦</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="거래처">
					<div class="reference-label">거래처</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<input id="field-main-partner-0" autocomplete="off"
									class="form-control noneEvent form-control-code first-child"
									placeholder="거래처" value="" data-field-key="partner"
									name="partner" aria-label="거래처">
								<button id="_search_icon"
									class="btn btn-default btn btn-default btn-code-search"
									type="button" data-lookup="partner" aria-label="거래처 검색">⌕</button>
								<input id="field-main-partner_1-1" autocomplete="off"
									class="form-control last-child" placeholder="거래처" value=""
									data-field-key="partner_1" name="partner_1" aria-label="거래처">
								<button
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									type="button" data-auto-code="partner">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="담당자">
					<div class="reference-label">담당자</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<input id="field-main-staff-0" autocomplete="off"
									class="form-control noneEvent form-control-code first-child"
									placeholder="담당자" value="S04" data-field-key="staff"
									name="staff" aria-label="담당자">
								<button id="S04_search_icon"
									class="btn btn-default btn btn-default btn-code-search"
									type="button" data-lookup="staff" aria-label="담당자 검색">⌕</button>
								<input id="field-main-staff_1-1" autocomplete="off"
									class="form-control last-child" placeholder="담당자" value="홍재혁"
									data-field-key="staff_1" name="staff_1" aria-label="담당자">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="출하창고">
					<div class="reference-label">출하창고</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<input id="field-main-warehouse-0" autocomplete="off"
									class="form-control noneEvent form-control-code first-child"
									placeholder="출하창고" value="100" data-field-key="warehouse"
									name="warehouse" aria-label="출하창고">
								<button id="100_search_icon"
									class="btn btn-default btn btn-default btn-code-search"
									type="button" data-lookup="warehouse" aria-label="출하창고 검색">⌕</button>
								<input id="field-main-warehouse_1-1" autocomplete="off"
									class="form-control last-child" placeholder="출하창고" value="본사창고"
									data-field-key="warehouse_1" name="warehouse_1"
									aria-label="출하창고">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="프로젝트">
					<div class="reference-label">프로젝트</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<input id="field-main-project-0" autocomplete="off"
									class="form-control noneEvent form-control-code first-child"
									placeholder="프로젝트" value="" data-field-key="project"
									name="project" aria-label="프로젝트">
								<button id="_search_icon"
									class="btn btn-default btn btn-default btn-code-search"
									type="button" data-lookup="project" aria-label="프로젝트 검색">⌕</button>
								<input id="field-main-project_1-1" autocomplete="off"
									class="form-control last-child" placeholder="프로젝트" value=""
									data-field-key="project_1" name="project_1" aria-label="프로젝트">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="연락처">
					<div class="reference-label">연락처</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<input type="" autocomplete="off"
									class="form-control first-child last-child" placeholder="연락처"
									value="" data-field-key="contact" name="contact"
									aria-label="연락처" id="field-main-contact-0">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="출하예정일">
					<div class="reference-label">출하예정일</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<div class="wrapper-datepicker">
									<div class="wrapper-datepicker">
										<select data-field-key="deliveryDateYear" data-cid="year"
											name="deliveryDateYear" aria-label="출하예정일"
											data-date-year="true" id="field-main-deliveryDateYear-0"><option
												value="====">====</option>
											<option value="2027">2027</option>
											<option value="2026" selected="">2026</option>
											<option value="2025">2025</option>
											<option value="2024">2024</option>
											<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
											data-field-key="deliveryDateMonth" data-cid="month"
											name="deliveryDateMonth" aria-label="출하예정일"
											data-date-month="true" id="field-main-deliveryDateMonth-1"><option
												value="==">==</option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09" selected="">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option></select>&nbsp;<span>/&nbsp;</span><input
											id="field-main-deliveryDateDay-2" autocomplete="off"
											class="form-control  textbox-inline" placeholder=""
											value="28" data-field-key="deliveryDateDay"
											name="deliveryDateDay" aria-label="출하예정일">&nbsp;
										<div class="btn-datepicker-toggle" role="button" tabindex="0"
											data-calendar="true" aria-label="출하예정일 달력">▦</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="우편번호">
					<div class="reference-label">우편번호</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<div class="control">
									<a class="" tabindex="0" type="button" role="button"
										data-address="true"><span class="">주소검색</span></a>
								</div>
								<div class="control">
									<input type="" autocomplete="off"
										class="form-control first-child last-child" placeholder="우편번호"
										value="" data-field-key="postal" name="postal"
										aria-label="우편번호" id="field-main-postal-0">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="주소">
					<div class="reference-label">주소</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<textarea rows="2" class="form-control first-child last-child"
									placeholder="주소" data-field-key="address" name="address"
									aria-label="주소" id="field-main-address-0"></textarea>
								<button
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									type="button" data-auto-code="address">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="새로운 항목 추가">
					<div class="reference-label">새로운 항목 추가</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<input type="" autocomplete="off"
									class="form-control first-child last-child"
									placeholder="새로운 항목 추가" value="다양한 항목을 추가하여 활용할 수 있습니다."
									data-field-key="inv_s$txt_001_shipping_orderXmaster_field"
									name="inv_s$txt_001_shipping_orderXmaster_field"
									aria-label="새로운 항목 추가"
									id="field-main-inv_s_txt_001_shipping_orderXmaster_field-0">
							</div>
						</div>
					</div>
				</div>
				<div class="table-scroll">
					<table class="entry-table reference-lines">
						<thead>
							<tr>
								<th>No.</th>
								<th>품목코드</th>
								<th>품목명</th>
								<th>규격</th>
								<th>수량</th>
								<th>새로운 항목 추가</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td class="item-code-cell"><div class="item-code-picker"><input name="lines.0.품목코드" data-field-key="lines.0.품목코드" aria-label="품목코드 1행" readonly><button type="button" class="item-search-button" data-item-lookup aria-label="품목검색 1행">품목검색</button></div><input type="hidden" name="lines.0.itemId" data-field-key="lines.0.itemId"></td>
								<td><input name="lines.0.품목명" data-field-key="lines.0.품목명" aria-label="품목명 1행" readonly></td>
								<td><input name="lines.0.규격" data-field-key="lines.0.규격"
									aria-label="규격 1행"></td>
								<td><input name="lines.0.수량" data-field-key="lines.0.수량"
									aria-label="수량 1행" inputmode="decimal"></td>
								<td><input name="lines.0.새로운 항목 추가"
									data-field-key="lines.0.새로운 항목 추가" aria-label="새로운 항목 추가 1행"></td>
							</tr>
							<tr>
								<td>2</td>
								<td class="item-code-cell"><div class="item-code-picker"><input name="lines.1.품목코드" data-field-key="lines.1.품목코드" aria-label="품목코드 2행" readonly><button type="button" class="item-search-button" data-item-lookup aria-label="품목검색 2행">품목검색</button></div><input type="hidden" name="lines.1.itemId" data-field-key="lines.1.itemId"></td>
								<td><input name="lines.1.품목명" data-field-key="lines.1.품목명" aria-label="품목명 2행" readonly></td>
								<td><input name="lines.1.규격" data-field-key="lines.1.규격"
									aria-label="규격 2행"></td>
								<td><input name="lines.1.수량" data-field-key="lines.1.수량"
									aria-label="수량 2행" inputmode="decimal"></td>
								<td><input name="lines.1.새로운 항목 추가"
									data-field-key="lines.1.새로운 항목 추가" aria-label="새로운 항목 추가 2행"></td>
							</tr>
							<tr>
								<td>3</td>
								<td class="item-code-cell"><div class="item-code-picker"><input name="lines.2.품목코드" data-field-key="lines.2.품목코드" aria-label="품목코드 3행" readonly><button type="button" class="item-search-button" data-item-lookup aria-label="품목검색 3행">품목검색</button></div><input type="hidden" name="lines.2.itemId" data-field-key="lines.2.itemId"></td>
								<td><input name="lines.2.품목명" data-field-key="lines.2.품목명" aria-label="품목명 3행" readonly></td>
								<td><input name="lines.2.규격" data-field-key="lines.2.규격"
									aria-label="규격 3행"></td>
								<td><input name="lines.2.수량" data-field-key="lines.2.수량"
									aria-label="수량 3행" inputmode="decimal"></td>
								<td><input name="lines.2.새로운 항목 추가"
									data-field-key="lines.2.새로운 항목 추가" aria-label="새로운 항목 추가 3행"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<button type="button" class="tool-button" data-add-line>행
					추가</button>
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
	<dialog id="itemLookupDialog" class="simple-dialog item-lookup-dialog" aria-labelledby="itemLookupTitle">
	  <form id="itemLookupForm">
	    <div class="item-lookup-header">
	      <h2 id="itemLookupTitle">품목검색</h2>
	      <button type="button" id="itemLookupCloseButton">닫기</button>
	    </div>
	    <label for="itemLookupKeyword">품목코드 또는 품목명</label>
	    <div class="item-lookup-search">
	      <input id="itemLookupKeyword" type="search" autocomplete="off" placeholder="품목코드 또는 품목명 입력">
	      <button type="submit" class="primary-button">검색</button>
	    </div>
	    <div class="item-lookup-results">
	      <table>
	        <thead><tr><th>품목코드</th><th>품목명</th><th>선택</th></tr></thead>
	        <tbody id="itemLookupRows"><tr><td colspan="3">품목을 조회하고 있습니다.</td></tr></tbody>
	      </table>
	    </div>
	  </form>
	</dialog>
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	  const searchInput = document.querySelector("#searchInput");
	  if (searchInput) searchInput.value = new URLSearchParams(location.search).get("q") || "";
	  const searchForm = document.querySelector(".simple-search");
	  if (searchForm) searchForm.addEventListener("submit", function (event) {
	    event.preventDefault();
	    alert("검색 기능 구현이 필요합니다.");
	  });
	  const entryForm = document.querySelector("#entryForm");
	  const entryDialog = document.querySelector("#entryDialog");
	  const newButton = document.querySelector("#newButton");
	  if (newButton) newButton.addEventListener("click", function () {
	    entryForm.reset();
	    entryDialog.showModal();
	  });
	  const closeButton = document.querySelector("#entryCloseButton");
	  if (closeButton) closeButton.addEventListener("click", function () {
	    entryDialog.close();
	  });
	  entryForm.addEventListener("submit", function (event) {
	    event.preventDefault();
	    alert("저장 기능 구현이 필요합니다.");
	  });
	  document.addEventListener("keydown", function (event) {
	    if (event.key === "F2" && !document.querySelector("dialog[open]")) {
	      event.preventDefault();
	      newButton.click();
	    }
	    if (event.key === "F8" && entryDialog.open) {
	      event.preventDefault();
	      entryForm.requestSubmit();
	    }
	  });
	  document.querySelectorAll("[data-list-action]").forEach(function (button) {
	    button.addEventListener("click", function () {
	      if (button.dataset.listAction === "print") { window.print(); return; }
	      alert(button.textContent.trim() + " 기능 구현이 필요합니다.");
	    });
	  });
	  const selectAllRows = document.querySelector("#selectAllRows");
	  if (selectAllRows) selectAllRows.addEventListener("click", function (event) {
	    event.preventDefault();
	    alert("목록 선택 기능 구현이 필요합니다.");
	  });
	  const itemLookupDialog = document.querySelector("#itemLookupDialog");
	  const itemLookupForm = document.querySelector("#itemLookupForm");
	  const itemLookupKeyword = document.querySelector("#itemLookupKeyword");
	  const itemLookupRows = document.querySelector("#itemLookupRows");
	  let itemLookupTargetRow = null;
	  let itemLookupRequest = 0;
	  entryForm.addEventListener("click", function (event) {
	    const button = event.target.closest("[data-item-lookup]");
	    if (!button) return;
	    itemLookupTargetRow = button.closest("tr");
	    itemLookupKeyword.value = "";
	    itemLookupDialog.showModal();
	    itemLookupKeyword.focus();
	    itemLookupForm.requestSubmit();
	  });
	  document.querySelector("#itemLookupCloseButton").addEventListener("click", function () {
	    itemLookupDialog.close();
	  });
	  itemLookupForm.addEventListener("submit", async function (event) {
	    event.preventDefault();
	    const request = ++itemLookupRequest;
	    itemLookupRows.innerHTML = '<tr><td colspan="3">품목을 조회하고 있습니다.</td></tr>';
	    try {
	      const url = "${pageContext.request.contextPath}/basic/items/lookup?q=" + encodeURIComponent(itemLookupKeyword.value.trim());
	      const response = await fetch(url, {headers: {"Accept": "application/json"}});
	      if (!response.ok) throw new Error("품목 조회 실패");
	      const items = await response.json();
	      if (request !== itemLookupRequest) return;
	      itemLookupRows.replaceChildren();
	      if (!items.length) {
	        const row = itemLookupRows.insertRow();
	        const cell = row.insertCell();
	        cell.colSpan = 3;
	        cell.textContent = "검색 결과가 없습니다.";
	      }
	      items.forEach(function (item) {
	        const row = itemLookupRows.insertRow();
	        row.insertCell().textContent = item.code || "";
	        row.insertCell().textContent = item.name || "";
	        const button = document.createElement("button");
	        button.type = "button";
	        button.textContent = "선택";
	        button.addEventListener("click", function () {
	          if (!itemLookupTargetRow) return;
	          itemLookupTargetRow.querySelector('input[name$=".품목코드"]').value = item.code || "";
	          itemLookupTargetRow.querySelector('input[name$=".품목명"]').value = item.name || "";
	          itemLookupTargetRow.querySelector('input[name$=".itemId"]').value = item.itemId == null ? "" : String(item.itemId);
	          itemLookupDialog.close();
	        });
	        row.insertCell().appendChild(button);
	      });
	    } catch (error) {
	      if (request !== itemLookupRequest) return;
	      itemLookupRows.innerHTML = '<tr><td colspan="3">품목을 조회하지 못했습니다.</td></tr>';
	      alert("품목 조회에 실패했습니다.");
	    }
	  });
	  document.querySelectorAll("[data-lookup], [data-calendar], [data-attachment], [data-auto-code]").forEach(function (control) {
	    control.addEventListener("click", function (event) {
	      event.preventDefault();
	      alert((control.getAttribute("aria-label") || control.textContent.trim() || "선택") + " 기능 구현이 필요합니다.");
	    });
	  });
	  document.querySelectorAll("[data-add-line]").forEach(function (button) {
	    button.addEventListener("click", function () {
	      const body = button.closest("form").querySelector(".reference-lines tbody");
	      if (!body || !body.lastElementChild) { alert("행 추가 기능 구현이 필요합니다."); return; }
	      const row = body.lastElementChild.cloneNode(true);
	      const index = body.children.length;
	      row.firstElementChild.textContent = index + 1;
	      row.querySelectorAll("input").forEach(function (input) {
	        input.value = "";
	        input.defaultValue = "";
	        input.name = input.name.replace(/^lines\.\d+\./, "lines." + index + ".");
	        input.dataset.fieldKey = input.name;
	        const label = input.getAttribute("aria-label");
	        if (label) input.setAttribute("aria-label", label.replace(/\d+행$/, (index + 1) + "행"));
	      });
	      body.appendChild(row);
	    });
	  });
	});
	</script>
</body>
</html>
