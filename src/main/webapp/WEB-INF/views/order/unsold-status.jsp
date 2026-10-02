<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미판매현황</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="order/unsold-status" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>미판매현황</h1>
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
			action="${pageContext.request.contextPath}/order/unsold-status">
			<h2 id="searchTitle">미판매현황 검색조건</h2>
			<div class="reference-fields">
				<div class="reference-row" data-reference-label="구분">
					<div class="reference-label">구분</div>
					<div class="reference-control">
						<div class="control-set">
							<div
								id="sales_orderXoutstandingstatus_search_inv_s$search_request_type_item15898"
								class="control">
								<span class="form-radio"><input type="radio"
									id="field-main-radio_16021-0" name="radio_16021__main"
									value="0" data-field-key="radio_16021" aria-label="구분"><label
									for="field-main-radio_16021-0">품목별</label></span><span
									class="form-radio"><input type="radio"
									id="field-main-radio_16021-1" name="radio_16021__main"
									value="3" checked="" data-field-key="radio_16021"
									aria-label="구분"><label for="field-main-radio_16021-1">라인별</label></span>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="기준일자(영업주기)">
					<div class="reference-label">기준일자(영업주기)</div>
					<div class="reference-control">
						<div class="control-set">
							<div
								id="sales_orderXoutstandingstatus_search_inv_s$data_dt_item15899"
								class="control">
								<div class="control-set">
									<div class="control">
										<div>
											<span class="label label-default label-light">직접입력</span>
										</div>
										<div class="wrapper-datepicker">
											<div class="hidden wrapper-datepicker">
												<select data-field-key="year" data-cid="year" name="year"
													aria-label="기준일자(영업주기)" data-date-year="true"
													id="field-main-year-0"><option value="2027">2027</option>
													<option value="2026" selected="">2026</option>
													<option value="2025">2025</option>
													<option value="2024">2024</option>
													<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
													data-field-key="month" data-cid="month" name="month"
													aria-label="기준일자(영업주기)" data-date-month="true"
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
													id="field-main-data_dt_sales_orderXoutstandingstatus_search-2"
													autocomplete="off" class="form-control  textbox-inline"
													placeholder="" value=""
													data-field-key="data_dt_sales_orderXoutstandingstatus_search"
													name="data_dt_sales_orderXoutstandingstatus_search"
													aria-label="기준일자(영업주기)">
											</div>
											<div class="wrapper-datepicker">
												<select data-field-key="year_1" data-cid="year"
													name="year_1" aria-label="기준일자(영업주기)" data-date-year="true"
													id="field-main-year_1-3"><option value="2027">2027</option>
													<option value="2026" selected="">2026</option>
													<option value="2025">2025</option>
													<option value="2024">2024</option>
													<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
													data-field-key="month_1" data-cid="month" name="month_1"
													aria-label="기준일자(영업주기)" data-date-month="true"
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
													id="field-main-data_dt_sales_orderXoutstandingstatus_search_1-5"
													autocomplete="off" class="form-control  textbox-inline"
													placeholder="" value="28"
													data-field-key="data_dt_sales_orderXoutstandingstatus_search_1"
													name="data_dt_sales_orderXoutstandingstatus_search_1"
													aria-label="기준일자(영업주기)">
											</div>
											&nbsp;
											<div class="btn-datepicker-toggle" role="button" tabindex="0"
												data-calendar="true" aria-label="기준일자(영업주기) 달력">▦</div>
											&nbsp;
										</div>
										<button
											class="btn btn-default btn-fn dropdown-toggle fn first-child last-child"
											type="button"
											data-auto-code="sales_orderXoutstandingstatus_search_inv_s$data_dt_field15967">Fn</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="품목별납기일자">
					<div class="reference-label">품목별납기일자</div>
					<div class="reference-control">
						<div class="control-set">
							<div
								id="sales_orderXoutstandingstatus_search_inv_m$due_dt_item15914"
								class="control">
								<div class="control-set">
									<div class="control">
										<div>
											<span class="label label-default label-light">직접입력</span>
										</div>
										<div class="wrapper-datepicker">
											<div class="wrapper-datepicker">
												<select data-field-key="year" data-cid="year" name="year"
													aria-label="품목별납기일자" data-date-year="true"
													id="field-main-year-0"><option value="===="
														selected="">====</option>
													<option value="2027">2027</option>
													<option value="2026">2026</option>
													<option value="2025">2025</option>
													<option value="2024">2024</option>
													<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
													data-field-key="month" data-cid="month" name="month"
													aria-label="품목별납기일자" data-date-month="true"
													id="field-main-month-1"><option value="=="
														selected="">==</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option></select>&nbsp;<span>/&nbsp;</span><input
													id="field-main-due_dt_sales_orderXoutstandingstatus_search-2"
													autocomplete="off" class="form-control  textbox-inline"
													placeholder="" value=""
													data-field-key="due_dt_sales_orderXoutstandingstatus_search"
													name="due_dt_sales_orderXoutstandingstatus_search"
													aria-label="품목별납기일자">
											</div>
											<span>&nbsp;~&nbsp;</span>
											<div class="wrapper-datepicker">
												<select data-field-key="year_1" data-cid="year"
													name="year_1" aria-label="품목별납기일자" data-date-year="true"
													id="field-main-year_1-3"><option value="===="
														selected="">====</option>
													<option value="2027">2027</option>
													<option value="2026">2026</option>
													<option value="2025">2025</option>
													<option value="2024">2024</option>
													<option value="직접입력">직접입력</option></select><span>&nbsp;/</span>&nbsp;<select
													data-field-key="month_1" data-cid="month" name="month_1"
													aria-label="품목별납기일자" data-date-month="true"
													id="field-main-month_1-4"><option value="=="
														selected="">==</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option></select>&nbsp;<span>/&nbsp;</span><input
													id="field-main-due_dt_sales_orderXoutstandingstatus_search_1-5"
													autocomplete="off" class="form-control  textbox-inline"
													placeholder="" value=""
													data-field-key="due_dt_sales_orderXoutstandingstatus_search_1"
													name="due_dt_sales_orderXoutstandingstatus_search_1"
													aria-label="품목별납기일자">
											</div>
											&nbsp;
											<div class="btn-datepicker-toggle" role="button" tabindex="0"
												data-calendar="true" aria-label="품목별납기일자 달력">▦</div>
											&nbsp;
										</div>
										<button
											class="btn btn-default btn-fn dropdown-toggle fn  hidden"
											type="button"
											data-auto-code="sales_orderXoutstandingstatus_search_inv_m$due_dt_field15968">Fn</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="창고">
					<div class="reference-label">창고</div>
					<div class="reference-control">
						<div class="control-set">
							<div id="sales_orderXoutstandingstatus_search_inv_s$wh_item15900"
								class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button"
									data-lookup="sales_orderXoutstandingstatus_search_inv_s$wh_field15969"
									aria-label="창고 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-sales_orderXoutstandingstatus_search_inv_s_wh_field15969-0"
												autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="창고" value=""
												data-field-key="sales_orderXoutstandingstatus_search_inv_s$wh_field15969"
												name="sales_orderXoutstandingstatus_search_inv_s$wh_field15969"
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
							<div
								id="sales_orderXoutstandingstatus_search_inv_s$pjt_item15902"
								class="control">
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
				<div class="reference-row" data-reference-label="거래처">
					<div class="reference-label">거래처</div>
					<div class="reference-control">
						<div class="control-set">
							<div
								id="sales_orderXoutstandingstatus_search_inv_s$cust_item15901"
								class="control">
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
							<div
								id="sales_orderXoutstandingstatus_search_inv_m$prod_item15912"
								class="control">
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
				<div class="reference-row" data-reference-label="담당자">
					<div class="reference-label">담당자</div>
					<div class="reference-control">
						<div class="control-set">
							<div
								id="sales_orderXoutstandingstatus_search_inv_s$pic_item15903"
								class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button" data-lookup="staff" aria-label="담당자 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-staff-0" autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="담당자" value="" data-field-key="staff"
												name="staff" aria-label="담당자">
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
				<div class="reference-row" data-reference-label="거래처관리담당자">
					<div class="reference-label">거래처관리담당자</div>
					<div class="reference-control">
						<div class="control-set">
							<div
								id="sales_orderXoutstandingstatus_search_cust$cust$pic_item15915"
								class="control">
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									type="button"
									data-lookup="sales_orderXoutstandingstatus_search_cust$cust$pic_field15985"
									aria-label="거래처관리담당자 검색">⌕</button>
								<div class="tags-input last-child">
									<div class="">
										<div class="tags-input-typeahead">
											<span class=""></span><input type="text"
												id="field-main-sales_orderXoutstandingstatus_search_cust_cust_pic_field15985-0"
												autocomplete="off"
												class="form-control noneEvent form-control form-control-code"
												placeholder="거래처관리담당자" value=""
												data-field-key="sales_orderXoutstandingstatus_search_cust$cust$pic_field15985"
												name="sales_orderXoutstandingstatus_search_cust$cust$pic_field15985"
												aria-label="거래처관리담당자">
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
				<div class="reference-row" data-reference-label="미판매수량">
					<div class="reference-label">미판매수량</div>
					<div class="reference-control">
						<div class="control-set">
							<div
								id="sales_orderXoutstandingstatus_search_inv_m$outstanding_qty_search_item15917"
								class="control">
								<span class="form-control-mark hidden"></span><input
									id="field-main-sales_orderXoutstandingstatus_search_inv_m_outstanding_qty_search_field15986-0"
									autocomplete="off"
									class="form-control text-right first-child last-child"
									placeholder="미판매수량" value=""
									data-field-key="sales_orderXoutstandingstatus_search_inv_m$outstanding_qty_search_field15986"
									name="sales_orderXoutstandingstatus_search_inv_m$outstanding_qty_search_field15986"
									aria-label="미판매수량"><span class="">~</span><input
									id="field-main-inv_m_outstanding_qty_search_sales_orderXoutstandingstatus_search_field_form-1"
									autocomplete="off"
									class="form-control text-right first-child last-child"
									placeholder="" value=""
									data-field-key="inv_m$outstanding_qty_search_sales_orderXoutstandingstatus_search_field_form"
									name="inv_m$outstanding_qty_search_sales_orderXoutstandingstatus_search_field_form"
									aria-label="미판매수량">
								<button
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									type="button"
									data-auto-code="sales_orderXoutstandingstatus_search_inv_m$outstanding_qty_search_field15986">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="적용양식">
					<div class="reference-label">적용양식</div>
					<div class="reference-control">
						<div class="control-set">
							<div id="search_template_applied_template_item15999"
								class="control">
								<select data-field-key="template_list_search_template"
									data-cid="template_list_search_template"
									name="template_list_search_template" aria-label="적용양식"
									id="field-main-template_list_search_template-0"><option
										value="현황" selected="">현황</option></select>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="정렬기준">
					<div class="reference-label">정렬기준</div>
					<div class="reference-control">
						<div class="control-set">
							<div id="search_template_sort_search_item16000" class="control">
								<a class="" tabindex="0" type="button" role="button"><span
									class="">설정</span></a>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="데이터 보기형식">
					<div class="reference-label">데이터 보기형식</div>
					<div class="reference-control">
						<div class="control-set">
							<div id="search_template_data_view_format_item16001"
								class="control">
								<span class="form-checkbox"><input type="checkbox"
									id="field-main-graph_setting_search_template-0"
									data-field-key="graph_setting_search_template"
									name="graph_setting_search_template" aria-label="데이터 보기형식"><label
									for="field-main-graph_setting_search_template-0">그래프로
										보기</label></span>
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

