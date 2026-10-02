<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>견적서현황</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="quote/quote-status" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>견적서현황</h1>
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
			action="${pageContext.request.contextPath}/quote/quote-status">
			<h2 id="searchTitle">견적서현황 검색조건</h2>
			<div class="reference-fields">
				<div class="reference-row" data-reference-label="메뉴">
					<div class="reference-label">메뉴</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<div class="wrapper-chip-radio">
									<span class="form-radio"><input type="radio"
										id="field-main-radio_14002-0" name="radio_14002__main"
										value="M_000000N000230" checked=""
										data-field-key="radio_14002" aria-label="메뉴"><label
										for="field-main-radio_14002-0">현황</label></span><span
										class="form-radio"><input type="radio"
										id="field-main-radio_14002-1" name="radio_14002__main"
										value="M_000000N000231" data-field-key="radio_14002"
										aria-label="메뉴"><label for="field-main-radio_14002-1">집계</label></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="구분">
					<div class="reference-label">구분</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<div class="control-set">
									<div class="control flex-none">
										<select
											data-field-key="inv_s$aggregate_quotationXstatus_search_field"
											data-cid="inv_s$aggregate_quotationXstatus_search_field"
											name="inv_s$aggregate_quotationXstatus_search_field"
											aria-label="구분"
											id="field-main-inv_s_aggregate_quotationXstatus_search_field-0"><option
												value="일별">일별</option>
											<option value="월별">월별</option>
											<option value="라인별" selected="">라인별</option>
											<option value="전표별">전표별</option>
											<option value="품목별">품목별</option>
											<option value="전표별품목별">전표별품목별</option>
											<option value="거래처별">거래처별</option>
											<option value="담당자별">담당자별</option></select>
									</div>
								</div>
								<div class="control-set">
									<div class="control">
										<span class="label label-default label-light">비교기간</span>
										<div class="wrapper-chip-radio">
											<span class="form-radio"><input type="radio"
												id="field-main-radio_15055-1" name="radio_15055__main"
												value="0" checked="" data-field-key="radio_15055"
												aria-label="구분"><label
												for="field-main-radio_15055-1">사용안함</label></span><span
												class="form-radio"><input type="radio"
												id="field-main-radio_15055-2" name="radio_15055__main"
												value="1" data-field-key="radio_15055" aria-label="구분"><label
												for="field-main-radio_15055-2">전년동일기간</label></span><span
												class="form-radio"><input type="radio"
												id="field-main-radio_15055-3" name="radio_15055__main"
												value="2" data-field-key="radio_15055" aria-label="구분"><label
												for="field-main-radio_15055-3">전월동일기간</label></span><span
												class="form-radio"><input type="radio"
												id="field-main-radio_15055-4" name="radio_15055__main"
												value="3" data-field-key="radio_15055" aria-label="구분"><label
												for="field-main-radio_15055-4">전주동일기간</label></span><span
												class="form-radio"><input type="radio"
												id="field-main-radio_15055-5" name="radio_15055__main"
												value="4" data-field-key="radio_15055" aria-label="구분"><label
												for="field-main-radio_15055-5">전일동일기간</label></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="기준일자">
					<div class="reference-label">기준일자</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<div class="control-set">
									<div class="control">
										<span
											class="label label-primary label-light label-light cursor-pointer">직접입력</span>
										<div class="wrapper-datepicker">
											<div class="wrapper-datepicker">
												<select data-field-key="year" data-cid="year" name="year"
													aria-label="기준일자" data-date-year="true"
													id="field-main-year-0"><option value="2027">2027</option>
													<option value="2026" selected="">2026</option>
													<option value="2025">2025</option>
													<option value="2024">2024</option>
													<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
													data-field-key="month" data-cid="month" name="month"
													aria-label="기준일자" data-date-month="true"
													id="field-main-month-1"><option value="01">01</option>
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
													id="field-main-data_dt_quotationXstatus_search-2"
													autocomplete="off" class="form-control  textbox-inline"
													placeholder="" value="01"
													data-field-key="data_dt_quotationXstatus_search"
													name="data_dt_quotationXstatus_search" aria-label="기준일자">
											</div>
											<span>&nbsp;~&nbsp;</span>
											<div class="wrapper-datepicker">
												<select data-field-key="year_1" data-cid="year"
													name="year_1" aria-label="기준일자" data-date-year="true"
													id="field-main-year_1-3"><option value="2027">2027</option>
													<option value="2026" selected="">2026</option>
													<option value="2025">2025</option>
													<option value="2024">2024</option>
													<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
													data-field-key="month_1" data-cid="month" name="month_1"
													aria-label="기준일자" data-date-month="true"
													id="field-main-month_1-4"><option value="01">01</option>
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
													id="field-main-data_dt_quotationXstatus_search_1-5"
													autocomplete="off" class="form-control  textbox-inline"
													placeholder="" value="28"
													data-field-key="data_dt_quotationXstatus_search_1"
													name="data_dt_quotationXstatus_search_1" aria-label="기준일자">
											</div>
											&nbsp;
											<div class="btn-datepicker-toggle" role="button" tabindex="0"
												data-calendar="true" aria-label="기준일자 달력">▦</div>
											&nbsp;
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="견적No.">
					<div class="reference-label">견적No.</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<span class="form-control-mark hidden"></span><input type=""
									autocomplete="off" class="form-control first-child last-child"
									placeholder="견적No." value=""
									data-field-key="inv_s$no_001_quotationXstatus_search_field"
									name="inv_s$no_001_quotationXstatus_search_field"
									aria-label="견적No."
									id="field-main-inv_s_no_001_quotationXstatus_search_field-0">
								<button
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									type="button"
									data-auto-code="inv_s$no_001_quotationXstatus_search_field">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="내.외자구분">
					<div class="reference-label">내.외자구분</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<div class="wrapper-chip-radio">
									<span class="form-radio"><input type="radio"
										id="field-main-radio_15009-0" name="radio_15009__main"
										value="undefined" checked="" data-field-key="radio_15009"
										aria-label="내.외자구분"><label
										for="field-main-radio_15009-0">전체</label></span><span
										class="form-radio"><input type="radio"
										id="field-main-radio_15009-1" name="radio_15009__main"
										value="false" data-field-key="radio_15009" aria-label="내.외자구분"><label
										for="field-main-radio_15009-1">내자</label></span><span
										class="form-radio"><input type="radio"
										id="field-main-radio_15009-2" name="radio_15009__main"
										value="true" data-field-key="radio_15009" aria-label="내.외자구분"><label
										for="field-main-radio_15009-2">외자</label></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="창고">
					<div class="reference-label">창고</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button"
									data-lookup="inv_s$wh_quotationXstatus_search_field"
									aria-label="창고 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-inv_s_wh_quotationXstatus_search_field-0"
												autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="창고" value=""
												data-field-key="inv_s$wh_quotationXstatus_search_field"
												name="inv_s$wh_quotationXstatus_search_field"
												aria-label="창고">
										</div>
									</div>
								</div>
								<button
									class="btn btn-default hidden btn btn-default btn-ellipsis btn-vertical-top"
									type="button">…</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="프로젝트">
					<div class="reference-label">프로젝트</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button" data-lookup="project" aria-label="프로젝트 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-project-0" autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="프로젝트" value="" data-field-key="project"
												name="project" aria-label="프로젝트">
										</div>
									</div>
								</div>
								<button
									class="btn btn-default hidden btn btn-default btn-ellipsis btn-vertical-top"
									type="button">…</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="관리항목">
					<div class="reference-label">관리항목</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button"
									data-lookup="inv_m$manage_item_quotationXstatus_search_field"
									aria-label="관리항목 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-inv_m_manage_item_quotationXstatus_search_field-0"
												autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="관리항목" value=""
												data-field-key="inv_m$manage_item_quotationXstatus_search_field"
												name="inv_m$manage_item_quotationXstatus_search_field"
												aria-label="관리항목">
										</div>
									</div>
								</div>
								<button
									class="btn btn-default hidden btn btn-default btn-ellipsis btn-vertical-top"
									type="button">…</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="거래처">
					<div class="reference-label">거래처</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button" data-lookup="partner" aria-label="거래처 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-partner-0" autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="거래처" value="" data-field-key="partner"
												name="partner" aria-label="거래처">
										</div>
									</div>
								</div>
								<button
									class="btn btn-default hidden btn btn-default btn-ellipsis btn-vertical-top"
									type="button">…</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="품목코드">
					<div class="reference-label">품목코드</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button" data-lookup="code" aria-label="품목코드 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-code-0" autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="품목코드" value="" data-field-key="code"
												name="code" aria-label="품목코드">
										</div>
									</div>
								</div>
								<button
									class="btn btn-default hidden btn btn-default btn-ellipsis btn-vertical-top"
									type="button">…</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="시리얼/로트No.">
					<div class="reference-label">시리얼/로트No.</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button"
									data-lookup="inv_serial_m$serial_sid_quotationXstatus_search_field"
									aria-label="시리얼/로트No. 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-inv_serial_m_serial_sid_quotationXstatus_search_field-0"
												autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="시리얼/로트No." value=""
												data-field-key="inv_serial_m$serial_sid_quotationXstatus_search_field"
												name="inv_serial_m$serial_sid_quotationXstatus_search_field"
												aria-label="시리얼/로트No.">
										</div>
									</div>
								</div>
								<button
									class="btn btn-default hidden btn btn-default btn-ellipsis btn-vertical-top"
									type="button">…</button>
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

