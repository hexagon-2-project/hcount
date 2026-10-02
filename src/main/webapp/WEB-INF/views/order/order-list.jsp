<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문서조회</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="order/order-list" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>주문서조회</h1>
				</header>
				<section class="screen-content simple-page">
					
					<form class="simple-search" method="get"
						action="${pageContext.request.contextPath}/order/order-list">
						<input type="search" name="q" id="searchInput"
							placeholder="검색어 입력" aria-label="주문서조회 검색">
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
						<button type="button" data-list-action="integration">다른전표생성</button>
						<button type="button" data-list-action="integration">전자결재</button>
						<button type="button" data-list-action="delete">선택삭제</button>
						<button type="button" data-list-action="export">Excel</button>
						<button type="button" data-list-action="integration">이력조회</button>
					</div>
				</section>
			</main>
		</div>
		<dialog id="entryDialog" class="simple-dialog reference-dialog document-dialog"
			aria-labelledby="entryTitle">
		<form id="entryForm" novalidate>
			<h2 id="entryTitle">주문서입력</h2>
			<div class="reference-fields">
				<div class="reference-row" data-reference-label="일자">
					<div class="reference-label">일자</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<div class="wrapper-datepicker {{style.contextCss}}"
									data-cid="{{cid}}">
									<select data-field-key="dateYear" data-cid="basic_date"
										name="dateYear" aria-label="일자" data-date-year="true"
										id="field-main-dateYear-0"><option value="2027">2027</option>
										<option value="2026" selected="">2026</option>
										<option value="2025">2025</option>
										<option value="2024">2024</option>
										<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
									<select data-field-key="dateMonth" data-cid="basic_date"
										name="dateMonth" aria-label="일자" data-date-month="true"
										id="field-main-dateMonth-1"><option value="01">01</option>
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
										<option value="12">12</option></select> <span class="">/&nbsp;</span><input
										type="text" class="form-control " data-cid="basic_date"
										value="28" data-field-key="dateDay" name="dateDay"
										aria-label="일자" id="field-main-dateDay-2">

									<div id="btn-datepicker-toggle" data-cid="basic_date"
										class="btn-datepicker-toggle " data-calendar="true"
										tabindex="0" role="button" aria-label="일자 달력">▦</div>
									<span class="hidden"> - , </span>


								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="거래처">
					<div class="reference-label">거래처</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control  {{style.css}} ">
								<input type="text"
									class="noneEvent form-control form-control-code first-child"
									data-cid="cust" placeholder="거래처" value=""
									data-field-key="partner" name="partner" aria-label="거래처"
									id="field-main-partner-0">
								<button class="btn btn-default btn-code-search" data-cid="cust"
									type="button" data-lookup="partner" aria-label="거래처 검색">⌕</button>
								<input type="text" class="form-control last-child"
									data-cid="cust" placeholder="" value=""
									data-field-key="partner_1" name="partner_1" aria-label="거래처"
									id="field-main-partner_1-1">
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									data-cid="cust" data-auto-code="partner">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="담당자">
					<div class="reference-label">담당자</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control  {{style.css}} ">
								<input type="text"
									class="noneEvent form-control form-control-code first-child"
									data-cid="emp_cd" placeholder="담당자" value="S02"
									data-field-key="staff" name="staff" aria-label="담당자"
									id="field-main-staff-0">
								<button class="btn btn-default btn-code-search"
									data-cid="emp_cd" type="button" data-lookup="staff"
									aria-label="담당자 검색">⌕</button>
								<input type="text" class="form-control last-child"
									data-cid="emp_cd" placeholder="" readonly="" value="정재원"
									data-field-key="staff_1" name="staff_1" aria-label="담당자"
									id="field-main-staff_1-1">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="출하창고">
					<div class="reference-label">출하창고</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control  {{style.css}} ">
								<input type="text"
									class="noneEvent form-control form-control-code first-child"
									data-cid="wh_cd" placeholder="출하창고" value="100"
									data-field-key="warehouse" name="warehouse" aria-label="출하창고"
									id="field-main-warehouse-0">
								<button class="btn btn-default btn-code-search" data-cid="wh_cd"
									type="button" data-lookup="warehouse" aria-label="출하창고 검색">⌕</button>
								<input type="text" class="form-control last-child"
									data-cid="wh_cd" placeholder="" readonly="" value="본사창고"
									data-field-key="warehouse_1" name="warehouse_1"
									aria-label="출하창고" id="field-main-warehouse_1-1">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="거래유형">
					<div class="reference-label">거래유형</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<select data-field-key="trade" data-cid="io_type" name="trade"
									aria-label="거래유형" id="field-main-trade-0"><option
										value="11" selected="">부가세율 적용</option>
									<option value="12">부가세율 미적용</option></select>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="통화">
					<div class="reference-label">통화</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control   ">

								<select data-field-key="foreign_type_select"
									data-cid="foreign_type_select" name="foreign_type_select"
									aria-label="통화" id="field-main-foreign_type_select-0"><option
										value="0∬0" selected="">내자</option>
									<option value="1∬100">달러 [100]</option>
									<option value="1∬400">엔화 [400]</option>
									<option value="1∬300">위안 [300]</option>
									<option value="1∬00001">유로 [00001]</option>
									<option value="1∬200">유로 [200]</option>
									<option value="1∬500">직접 등록가능 [500]</option></select>
							</div>
							<div class="control   hidden">

								<input type="text"
									class="form-control form-control text-right first-child last-child"
									data-cid="foreign_type_input" placeholder="통화" value="0"
									data-field-key="currency" name="currency" aria-label="통화"
									id="field-main-currency-1">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="프로젝트">
					<div class="reference-label">프로젝트</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control  {{style.css}} ">
								<input type="text"
									class="noneEvent form-control form-control-code first-child"
									data-cid="pjt_cd" placeholder="프로젝트" value=""
									data-field-key="project" name="project" aria-label="프로젝트"
									id="field-main-project-0">
								<button class="btn btn-default btn-code-search"
									data-cid="pjt_cd" type="button" data-lookup="project"
									aria-label="프로젝트 검색">⌕</button>
								<input type="text" class="form-control last-child"
									data-cid="pjt_cd" placeholder="" readonly="" value=""
									data-field-key="project_1" name="project_1" aria-label="프로젝트"
									id="field-main-project_1-1">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="납기일자">
					<div class="reference-label">납기일자</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<div class="wrapper-datepicker {{style.contextCss}}"
									data-cid="{{cid}}">
									<select data-field-key="deliveryDateYear" data-cid="time_date"
										name="deliveryDateYear" aria-label="납기일자"
										data-date-year="true" id="field-main-deliveryDateYear-0"><option
											value="====">====</option>
										<option value="2027">2027</option>
										<option value="2026">2026</option>
										<option value="2025" selected="">2025</option>
										<option value="2024">2024</option>
										<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
									<select data-field-key="deliveryDateMonth" data-cid="time_date"
										name="deliveryDateMonth" aria-label="납기일자"
										data-date-month="true" id="field-main-deliveryDateMonth-1"><option
											value="==">==</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07" selected="">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option></select> <span class="">/&nbsp;</span><input
										type="text" class="form-control " data-cid="time_date"
										value="12" data-field-key="deliveryDateDay"
										name="deliveryDateDay" aria-label="납기일자"
										id="field-main-deliveryDateDay-2">
									<div id="btn-datepicker-toggle" data-cid="time_date"
										class="btn-datepicker-toggle " data-calendar="true"
										tabindex="0" role="button" aria-label="납기일자 달력">▦</div>

								</div>
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									data-cid="time_date" data-auto-code="deliveryDate">Fn</button>



							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="첨부">
					<div class="reference-label">첨부</div>
					<div class="reference-control">
						<div class="attach-file-draggable-holder hidden">여기에 파일 놓기</div>
						<div class="control-set">
							<div class="control   ">

								<ul class="wrapper-attach-file" id="ulAttachFile">
									<li class="hidden"></li>
									<li class="hidden"></li>
									<li class="hidden"></li>
									<li class="hidden"></li>
									<li class="hidden"></li>
									<li class="hidden"></li>
									<li class="hidden"></li>
								</ul>
							</div>
						</div>
						<div class="control-set">
							<div class="control   ">

								<div class="wrapper-file-add false">
									<div class="file-add" role="button" tabindex="0"
										data-attachment="true" aria-label="파일 첨부">+</div>
								</div>
							</div>
							<div class="control  flex-none hidden">

								<button id="file_cd_fn"
									class="btn btn-default btn-fn first-child last-child"
									data-cid="file_cd_fn" type="button" data-auto-code="file_cd"
									data-attachment="true">Fn</button>
							</div>
							<div class="control  flex-none hidden">

								<a id="file_cd_post" data-cid="file_cd_post" class=""
									type="button" role="button" tabindex="0" data-attachment="true">게시글</a>
							</div>
							<div class="control   hidden">

								<a id="file_cd_file" data-cid="file_cd_file" class=""
									type="button" role="button" tabindex="0" data-attachment="true">파일</a>
								<div id="html5_1k3ip2kju1ego7ag8313u61i3dk_container"
									class="moxie-shim moxie-shim-html5">
									<input id="field-main-file_cd-0" type="file" multiple=""
										accept="" data-field-key="file_cd" name="file_cd"
										aria-label="첨부">
								</div>
							</div>
							<div class="control  flex-none hidden">

								<a id="file_cd_slip" data-cid="file_cd_slip" class=""
									type="button" role="button" tabindex="0" data-attachment="true">전표</a>
							</div>
							<div class="control  flex-none hidden">

								<a id="file_cd_ecdrive" data-cid="file_cd_ecdrive" class=""
									type="button" role="button" tabindex="0" data-attachment="true">ECDrive</a>
							</div>
							<div class="control  flex-none hidden">

								<a id="file_cd_image" data-cid="file_cd_image" class=""
									type="button" role="button" tabindex="0" data-attachment="true">이미지파일함</a>
							</div>
							<div class="control  flex-none hidden">

								<a id="file_cd_draft" data-cid="file_cd_draft" class=""
									type="button" role="button" tabindex="0" data-attachment="true">기안서</a>
							</div>
							<div class="control  flex-none hidden">

								<a id="file_cd_mystorage" data-cid="file_cd_mystorage" class=""
									type="button" role="button" tabindex="0" data-attachment="true">개인파일함</a>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="새로운 항목 추가">
					<div class="reference-label">새로운 항목 추가</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<input type="text"
									class="form-control form-control first-child last-child"
									data-cid="u_memo2" placeholder="새로운 항목 추가"
									value="다양한 항목을 추가하여 활용할 수 있습니다." data-field-key="u_memo2"
									name="u_memo2" aria-label="새로운 항목 추가" id="field-main-u_memo2-0">
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
								<th>단가</th>
								<th>공급가액</th>
								<th>부가세</th>
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
								<td><input name="lines.0.단가" data-field-key="lines.0.단가"
									aria-label="단가 1행" inputmode="decimal"></td>
								<td><input name="lines.0.공급가액"
									data-field-key="lines.0.공급가액" aria-label="공급가액 1행"
									inputmode="decimal"></td>
								<td><input name="lines.0.부가세" data-field-key="lines.0.부가세"
									aria-label="부가세 1행" inputmode="decimal"></td>
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
								<td><input name="lines.1.단가" data-field-key="lines.1.단가"
									aria-label="단가 2행" inputmode="decimal"></td>
								<td><input name="lines.1.공급가액"
									data-field-key="lines.1.공급가액" aria-label="공급가액 2행"
									inputmode="decimal"></td>
								<td><input name="lines.1.부가세" data-field-key="lines.1.부가세"
									aria-label="부가세 2행" inputmode="decimal"></td>
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
								<td><input name="lines.2.단가" data-field-key="lines.2.단가"
									aria-label="단가 3행" inputmode="decimal"></td>
								<td><input name="lines.2.공급가액"
									data-field-key="lines.2.공급가액" aria-label="공급가액 3행"
									inputmode="decimal"></td>
								<td><input name="lines.2.부가세" data-field-key="lines.2.부가세"
									aria-label="부가세 3행" inputmode="decimal"></td>
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
