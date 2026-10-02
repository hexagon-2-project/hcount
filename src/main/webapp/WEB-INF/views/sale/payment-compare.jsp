<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>결제내역자료비교</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="sale/payment-compare" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>결제내역자료비교</h1>
					<button type="button" class="primary-button status-search-button" id="searchOpenButton" aria-controls="searchDialog" aria-haspopup="dialog">검색조건</button>
				</header>
				<section class="screen-content simple-page">
					<div class="table-scroll">
						<table class="list-table">
							<thead>
								<tr>
									<th>일자</th>
									<th>번호</th>
									<th>거래처</th>
									<th>품목</th>
									<th>수량</th>
								</tr>
							</thead>
							<tbody id="pageRows">
								<tr>
									<td colspan="5">등록된 데이터가 없습니다.</td>
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
				</section>
			</main>
		</div>
		<dialog id="searchDialog" class="simple-dialog reference-dialog "
			aria-labelledby="searchTitle">
		<form method="get"
			action="${pageContext.request.contextPath}/sale/payment-compare">
			<h2 id="searchTitle">결제내역자료비교 검색조건</h2>
			<div class="reference-fields">
				<div class="reference-row" data-reference-label="기준일자">
					<div class="reference-label">기준일자</div>
					<div class="reference-control">
						<div class="control-set  hidden">
							<div class="control   hidden">

								<div>
									<span ,="" class="label label-default label-light "
										addon-cid="addon-cmbSumFlagDate_SELECT">간편검색</span>
								</div>
								<select data-field-key="cmbSumFlagDate_SELECT"
									data-cid="cmbSumFlagDate_SELECT" name="cmbSumFlagDate_SELECT"
									aria-label="기준일자" id="field-main-cmbSumFlagDate_SELECT-0"><option
										value="금월(~오늘)" selected="">금월(~오늘)</option></select>
							</div>
						</div>
						<div class="control-set">
							<div class="control   ">

								<div>
									<span data-cid="cmbSumFlagDate_DATE"
										class="label label-default label-light "
										addon-cid="addon-cmbSumFlagDate_DATE">금월(~오늘)</span>
								</div>
								<div data-cid="{{cid}}"
									class="wrapper-datepicker enable-toggle-ecitem datepicker-range {{style.contextCss}}">
									<select data-field-key="cmbSumFlagDate_DATE"
										data-cid="cmbSumFlagDate_DATE" name="cmbSumFlagDate_DATE"
										aria-label="기준일자" data-date-year="true"
										id="field-main-cmbSumFlagDate_DATE-1"><option
											value="2027">2027</option>
										<option value="2026" selected="">2026</option>
										<option value="2025">2025</option>
										<option value="2024">2024</option>
										<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
									<select data-field-key="cmbSumFlagDate_DATE_1"
										data-cid="cmbSumFlagDate_DATE" name="cmbSumFlagDate_DATE_1"
										aria-label="기준일자" data-date-month="true"
										id="field-main-cmbSumFlagDate_DATE_1-2"><option
											value="01">01</option>
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
										type="text" class="form-control "
										data-cid="cmbSumFlagDate_DATE" value="01"
										data-field-key="cmbSumFlagDate_DATE_2"
										name="cmbSumFlagDate_DATE_2" aria-label="기준일자"
										id="field-main-cmbSumFlagDate_DATE_2-3"> <span
										class=""> ~ </span> <select
										data-field-key="cmbSumFlagDate_DATE_3"
										data-cid="cmbSumFlagDate_DATE" name="cmbSumFlagDate_DATE_3"
										aria-label="기준일자" data-date-year="true"
										id="field-main-cmbSumFlagDate_DATE_3-4"><option
											value="2027">2027</option>
										<option value="2026" selected="">2026</option>
										<option value="2025">2025</option>
										<option value="2024">2024</option>
										<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
									<select data-field-key="cmbSumFlagDate_DATE_4"
										data-cid="cmbSumFlagDate_DATE" name="cmbSumFlagDate_DATE_4"
										aria-label="기준일자" data-date-month="true"
										id="field-main-cmbSumFlagDate_DATE_4-5"><option
											value="01">01</option>
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
										type="text" class="form-control "
										data-cid="cmbSumFlagDate_DATE" value="28"
										data-field-key="cmbSumFlagDate_DATE_5"
										name="cmbSumFlagDate_DATE_5" aria-label="기준일자"
										id="field-main-cmbSumFlagDate_DATE_5-6">
									<div id="btn-datepicker-toggle" data-cid="cmbSumFlagDate_DATE"
										class="btn-datepicker-toggle " data-calendar="true"
										tabindex="0" role="button" aria-label="기준일자 달력">▦</div>
								</div>
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn hidden"
									data-cid="cmbSumFlagDate_DATE" data-auto-code="cmbSumFlagDate">Fn</button>



							</div>
						</div>
						<div class="control-set  hidden">
							<div class="control   hidden">

								<div class="tags-input first-child last-child">
									<div class="input-height-fixed">
										<div>
											<div class="tags-input-typeahead">
												<input type="text"
													class="form-control form-control-bordered "
													data-cid="cmbSumFlagDate_CALC" placeholder="" value=""
													data-field-key="cmbSumFlagDate_CALC"
													name="cmbSumFlagDate_CALC" aria-label="기준일자"
													id="field-main-cmbSumFlagDate_CALC-7">
											</div>
										</div>
									</div>
								</div>
								<button class="btn btn-default btn-ellipsis hidden"
									data-cid="cmbSumFlagDate_CALC_more" type="button">…</button>
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									data-cid="cmbSumFlagDate_CALC" data-auto-code="cmbSumFlagDate">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="거래처">
					<div class="reference-label">거래처</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   " data-cid="txtSCustCd">
								<a data-cid="txtSCustCd" class="hidden" type="button"
									role="button" tabindex="0">선택</a>
								<div class="hidden"></div>
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									data-cid="txtSCustCd" type="button" data-lookup="partner"
									aria-label="거래처 검색">⌕</button>
								<div class="tags-input last-child" data-cid="txtSCustCd">
									<div class="" data-cid="txtSCustCd">
										<div>
											<div class="tags-input-typeahead">
												<div>
													<div class="tags-input-typeahead">
														<input type="text"
															class="form-control form-control-code noneEvent "
															data-cid="txtSCustCd" placeholder="거래처" value=""
															data-field-key="partner" name="partner" aria-label="거래처"
															id="field-main-partner-0">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button
									class="btn btn-default btn-ellipsis btn-vertical-top hidden"
									data-cid="txtSCustCd" type="button">…</button>



							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="자료기준">
					<div class="reference-label">자료기준</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<span class="form-radio" data-cid="dataStd"><input
									type="radio" value="" data-cid="dataStd" name="dataStd__main"
									id="field-main-dataStd-0" checked="" data-field-key="dataStd"
									aria-label="자료기준"><label for="field-main-dataStd-0"
									data-cid="dataStd">전체</label></span><span class="form-radio"
									data-cid="dataStd"><input type="radio" value="Y"
									data-cid="dataStd" name="dataStd__main"
									id="field-main-dataStd-1" data-field-key="dataStd"
									aria-label="자료기준"><label for="field-main-dataStd-1"
									data-cid="dataStd">일치</label></span><span class="form-radio"
									data-cid="dataStd"><input type="radio" value="N"
									data-cid="dataStd" name="dataStd__main"
									id="field-main-dataStd-2" data-field-key="dataStd"
									aria-label="자료기준"><label for="field-main-dataStd-2"
									data-cid="dataStd">불일치</label></span>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row reference-section"
					data-reference-label="양식">
					<div class="reference-label">양식</div>
					<div class="reference-control"></div>
				</div>
				<div class="reference-row" data-reference-label="적용양식">
					<div class="reference-label">적용양식</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<select data-field-key="formList" data-cid="formList"
									name="formList" aria-label="적용양식" id="field-main-formList-0"><option
										value="1000" selected="">기본(수정불가)</option></select>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="정렬/소계기준">
					<div class="reference-label">정렬/소계기준</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<a id="linkSortTotal" data-cid="linkSortTotal" class=""
									type="button" role="button" tabindex="0">설정</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<label class="simple-field">검색어<input name="q"
				id="dialogSearchInput" type="search"></label>
			<div class="simple-dialog-actions">
				<button type="submit" class="primary-button">검색(F8)</button>
				<button type="reset">다시 작성</button>
				<button type="button" id="searchCloseButton">닫기</button>
			</div>
		</form>
		</dialog>
	</div>
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	  const searchInput = document.querySelector("#searchInput");
	  if (searchInput) searchInput.value = new URLSearchParams(location.search).get("q") || "";
	  const searchForm = document.querySelector(".simple-search");
	  if (searchForm) searchForm.addEventListener("submit", function (event) {
	    event.preventDefault();
	    alert("검색 기능 구현이 필요합니다.");
	  });
	  const searchDialog = document.querySelector("#searchDialog");
	  document.querySelector("#searchOpenButton").addEventListener("click", function () { searchDialog.showModal(); });
	  document.querySelector("#searchCloseButton").addEventListener("click", function () { searchDialog.close(); });
	  const dialogSearchInput = document.querySelector("#dialogSearchInput");
	  if (dialogSearchInput) dialogSearchInput.value = new URLSearchParams(location.search).get("q") || "";
	  searchDialog.querySelector("form").addEventListener("submit", function (event) {
	    event.preventDefault();
	    alert("검색 기능 구현이 필요합니다.");
	  });
	  document.addEventListener("keydown", function (event) {
	    if (event.key === "F8" && searchDialog.open) {
	      event.preventDefault();
	      searchDialog.querySelector("form").requestSubmit();
	    }
	  });
	  document.querySelectorAll("[data-lookup], [data-calendar], [data-attachment], [data-auto-code]").forEach(function (control) {
	    control.addEventListener("click", function (event) {
	      event.preventDefault();
	      alert((control.getAttribute("aria-label") || control.textContent.trim() || "선택") + " 기능 구현이 필요합니다.");
	    });
	  });
	});
	</script>
</body>
</html>

