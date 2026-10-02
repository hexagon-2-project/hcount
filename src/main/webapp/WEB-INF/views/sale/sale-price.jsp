<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>판매단가일괄변경</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="sale/sale-price" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>판매단가일괄변경</h1>
					<button type="button" class="primary-button status-search-button" id="searchOpenButton" aria-controls="searchDialog" aria-haspopup="dialog">검색조건</button>
				</header>
				<section class="screen-content simple-page">
					<form class="simple-search" method="get"
						action="${pageContext.request.contextPath}/sale/sale-price">
						<input type="search" name="q" id="searchInput"
							placeholder="검색어 입력" aria-label="판매단가일괄변경 검색">
						<button type="submit" class="primary-button">검색(F3)</button>
					</form>
					<div class="table-scroll">
						<table class="list-table">
							<thead>
								<tr>
									<th>일자</th>
									<th>번호</th>
									<th>거래처</th>
									<th>품목</th>
									<th>단가</th>
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
			action="${pageContext.request.contextPath}/sale/sale-price">
			<h2 id="searchTitle">판매단가일괄변경 검색조건</h2>
			<div class="reference-fields">
				<div class="reference-row" data-reference-label="구분">
					<div class="reference-label">구분</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<span class="form-radio" data-cid="rbChangeTarget"><input
									type="radio" value="0" data-cid="rbChangeTarget"
									name="rbChangeTarget__main" id="field-main-rbChangeTarget-0"
									checked="" data-field-key="rbChangeTarget" aria-label="구분"><label
									for="field-main-rbChangeTarget-0" data-cid="rbChangeTarget">단가변경</label></span><span
									class="form-radio" data-cid="rbChangeTarget"><input
									type="radio" value="1" data-cid="rbChangeTarget"
									name="rbChangeTarget__main" id="field-main-rbChangeTarget-1"
									data-field-key="rbChangeTarget" aria-label="구분"><label
									for="field-main-rbChangeTarget-1" data-cid="rbChangeTarget">환율변경</label></span>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="기준일자">
					<div class="reference-label">기준일자</div>
					<div class="reference-control">
						<div class="control-set  hidden">
							<div class="control   hidden">

								<div>
									<span ,="" class="label label-default label-light "
										addon-cid="addon-ddlSYear_SELECT">간편검색</span>
								</div>
								<select data-field-key="ddlSYear_SELECT"
									data-cid="ddlSYear_SELECT" name="ddlSYear_SELECT"
									aria-label="기준일자" data-date-year="true"
									id="field-main-ddlSYear_SELECT-0"><option
										value="금월(~오늘)" selected="">금월(~오늘)</option></select>
							</div>
						</div>
						<div class="control-set">
							<div class="control   ">

								<div>
									<span data-cid="ddlSYear_DATE"
										class="label label-default label-light "
										addon-cid="addon-ddlSYear_DATE">금월(~오늘)</span>
								</div>
								<div data-cid="{{cid}}"
									class="wrapper-datepicker enable-toggle-ecitem datepicker-range {{style.contextCss}}">
									<select data-field-key="ddlSYear_DATE" data-cid="ddlSYear_DATE"
										name="ddlSYear_DATE" aria-label="기준일자" data-date-year="true"
										id="field-main-ddlSYear_DATE-1"><option value="2027">2027</option>
										<option value="2026" selected="">2026</option>
										<option value="2025">2025</option>
										<option value="2024">2024</option>
										<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
									<select data-field-key="ddlSYear_DATE_1"
										data-cid="ddlSYear_DATE" name="ddlSYear_DATE_1"
										aria-label="기준일자" data-date-year="true" data-date-month="true"
										id="field-main-ddlSYear_DATE_1-2"><option value="01">01</option>
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
										type="text" class="form-control " data-cid="ddlSYear_DATE"
										value="01" data-field-key="ddlSYear_DATE_2"
										name="ddlSYear_DATE_2" aria-label="기준일자"
										id="field-main-ddlSYear_DATE_2-3"> <span class="">
										~ </span> <select data-field-key="ddlSYear_DATE_3"
										data-cid="ddlSYear_DATE" name="ddlSYear_DATE_3"
										aria-label="기준일자" data-date-year="true"
										id="field-main-ddlSYear_DATE_3-4"><option
											value="2027">2027</option>
										<option value="2026" selected="">2026</option>
										<option value="2025">2025</option>
										<option value="2024">2024</option>
										<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
									<select data-field-key="ddlSYear_DATE_4"
										data-cid="ddlSYear_DATE" name="ddlSYear_DATE_4"
										aria-label="기준일자" data-date-year="true" data-date-month="true"
										id="field-main-ddlSYear_DATE_4-5"><option value="01">01</option>
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
										type="text" class="form-control " data-cid="ddlSYear_DATE"
										value="28" data-field-key="ddlSYear_DATE_5"
										name="ddlSYear_DATE_5" aria-label="기준일자"
										id="field-main-ddlSYear_DATE_5-6">
									<div id="btn-datepicker-toggle" data-cid="ddlSYear_DATE"
										class="btn-datepicker-toggle " data-calendar="true"
										tabindex="0" role="button" aria-label="기준일자 달력">▦</div>
								</div>




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
													data-cid="ddlSYear_CALC" placeholder="" value=""
													data-field-key="ddlSYear_CALC" name="ddlSYear_CALC"
													aria-label="기준일자" id="field-main-ddlSYear_CALC-7">
											</div>
										</div>
									</div>
								</div>
								<button class="btn btn-default btn-ellipsis hidden"
									data-cid="ddlSYear_CALC_more" type="button">…</button>
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn  hidden"
									data-cid="ddlSYear_CALC" data-auto-code="ddlSYear">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="거래유형">
					<div class="reference-label">거래유형</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   " data-cid="ddlSioType">
								<a data-cid="ddlSioType" class="hidden" type="button"
									role="button" tabindex="0">선택</a>
								<div class="hidden"></div>
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									data-cid="ddlSioType" type="button" data-lookup="trade"
									aria-label="거래유형 검색">⌕</button>
								<div class="tags-input last-child" data-cid="ddlSioType">
									<div class="input-height-fixed" data-cid="ddlSioType">
										<div>
											<div class="tags-input-typeahead">
												<div>
													<div class="tags-input-typeahead">
														<input type="text"
															class="form-control form-control-code noneEvent "
															data-cid="ddlSioType" placeholder="거래유형" value=""
															data-field-key="trade" name="trade" aria-label="거래유형"
															id="field-main-trade-0">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button
									class="btn btn-default btn-ellipsis btn-vertical-top hidden"
									data-cid="ddlSioType" type="button">…</button>



							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="내.외자구분">
					<div class="reference-label">내.외자구분</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<span class="form-radio" data-cid="ddlForeignFlag"><input
									type="radio" value="0" data-cid="ddlForeignFlag"
									name="ddlForeignFlag__main" id="field-main-ddlForeignFlag-0"
									checked="" data-field-key="ddlForeignFlag" aria-label="내.외자구분"><label
									for="field-main-ddlForeignFlag-0" data-cid="ddlForeignFlag">내자</label></span><span
									class="form-radio" data-cid="ddlForeignFlag"><input
									type="radio" value="1" data-cid="ddlForeignFlag"
									name="ddlForeignFlag__main" id="field-main-ddlForeignFlag-1"
									data-field-key="ddlForeignFlag" aria-label="내.외자구분"><label
									for="field-main-ddlForeignFlag-1" data-cid="ddlForeignFlag">외자</label></span>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="출하창고">
					<div class="reference-label">출하창고</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   " data-cid="txtSWhCd">
								<a data-cid="txtSWhCd" class="hidden" type="button"
									role="button" tabindex="0">선택</a>
								<div class="hidden"></div>
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									data-cid="txtSWhCd" type="button" data-lookup="warehouse"
									aria-label="출하창고 검색">⌕</button>
								<div class="tags-input last-child" data-cid="txtSWhCd">
									<div class="input-height-fixed" data-cid="txtSWhCd">
										<div>
											<div class="tags-input-typeahead">
												<div>
													<div class="tags-input-typeahead">
														<input type="text"
															class="form-control form-control-code noneEvent "
															data-cid="txtSWhCd" placeholder="출하창고" value=""
															data-field-key="warehouse" name="warehouse"
															aria-label="출하창고" id="field-main-warehouse-0">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button
									class="btn btn-default btn-ellipsis btn-vertical-top hidden"
									data-cid="txtSWhCd" type="button">…</button>



							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="프로젝트">
					<div class="reference-label">프로젝트</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   " data-cid="txtPjtCd">
								<a data-cid="txtPjtCd" class="hidden" type="button"
									role="button" tabindex="0">선택</a>
								<div class="hidden"></div>
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									data-cid="txtPjtCd" type="button" data-lookup="project"
									aria-label="프로젝트 검색">⌕</button>
								<div class="tags-input last-child" data-cid="txtPjtCd">
									<div class="input-height-fixed" data-cid="txtPjtCd">
										<div>
											<div class="tags-input-typeahead">
												<div>
													<div class="tags-input-typeahead">
														<input type="text"
															class="form-control form-control-code noneEvent "
															data-cid="txtPjtCd" placeholder="프로젝트" value=""
															data-field-key="project" name="project" aria-label="프로젝트"
															id="field-main-project-0">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button
									class="btn btn-default btn-ellipsis btn-vertical-top hidden"
									data-cid="txtPjtCd" type="button">…</button>



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
									<div class="input-height-fixed" data-cid="txtSCustCd">
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
				<div class="reference-row" data-reference-label="품목코드">
					<div class="reference-label">품목코드</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   " data-cid="txtSProdCd">
								<a data-cid="txtSProdCd" class="hidden" type="button"
									role="button" tabindex="0">선택</a>
								<div class="hidden"></div>
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									data-cid="txtSProdCd" type="button" data-lookup="code"
									aria-label="품목코드 검색">⌕</button>
								<div class="tags-input last-child" data-cid="txtSProdCd">
									<div class="input-height-fixed" data-cid="txtSProdCd">
										<div>
											<div class="tags-input-typeahead">
												<div>
													<div class="tags-input-typeahead">
														<input type="text"
															class="form-control form-control-code noneEvent "
															data-cid="txtSProdCd" placeholder="품목코드" value=""
															data-field-key="code" name="code" aria-label="품목코드"
															id="field-main-code-0">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button
									class="btn btn-default btn-ellipsis btn-vertical-top hidden"
									data-cid="txtSProdCd" type="button">…</button>



							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="거래구분">
					<div class="reference-label">거래구분</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<span class="form-radio" data-cid="EtcChk"><input
									type="radio" value="0" data-cid="EtcChk" name="EtcChk__main"
									id="field-main-EtcChk-0" checked="" data-field-key="EtcChk"
									aria-label="거래구분"><label for="field-main-EtcChk-0"
									data-cid="EtcChk">전체</label></span><span class="form-radio"
									data-cid="EtcChk"><input type="radio" value="2"
									data-cid="EtcChk" name="EtcChk__main" id="field-main-EtcChk-1"
									data-field-key="EtcChk" aria-label="거래구분"><label
									for="field-main-EtcChk-1" data-cid="EtcChk">일반</label></span><span
									class="form-radio" data-cid="EtcChk"><input type="radio"
									value="1" data-cid="EtcChk" name="EtcChk__main"
									id="field-main-EtcChk-2" data-field-key="EtcChk"
									aria-label="거래구분"><label for="field-main-EtcChk-2"
									data-cid="EtcChk">반품</label></span>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="진행상태">
					<div class="reference-label">진행상태</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control   ">

								<span class="form-checkbox" data-cid="slipStatusInfo"><input
									type="checkbox" value="A" data-cid="slipStatusInfo"
									name="slipStatusInfo" id="field-main-slipStatusInfo-0" class=""
									checked="" data-field-key="slipStatusInfo" aria-label="진행상태"><label
									for="field-main-slipStatusInfo-0" data-cid="slipStatusInfo"
									class="">전체</label></span><span class="inline-divider"></span><span
									class="form-checkbox" data-cid="slipStatusInfo"><input
									type="checkbox" value="N" data-cid="slipStatusInfo"
									name="slipStatusInfo" id="field-main-slipStatusInfo-1" class=""
									checked="" data-field-key="slipStatusInfo" aria-label="진행상태"><label
									for="field-main-slipStatusInfo-1" data-cid="slipStatusInfo"
									class="">미확인</label></span><span class="form-checkbox"
									data-cid="slipStatusInfo"><input type="checkbox"
									value="Y" data-cid="slipStatusInfo" name="slipStatusInfo"
									id="field-main-slipStatusInfo-2" class="" checked=""
									data-field-key="slipStatusInfo" aria-label="진행상태"><label
									for="field-main-slipStatusInfo-2" data-cid="slipStatusInfo"
									class="">확인</label></span>
							</div>
						</div>
						<div class="control-set  hidden">
							<div class="control   hidden" data-cid="slipStatusInfoN">
								<div>
									<span ,="" class="label label-default label-light "
										addon-cid="addon-slipStatusInfoN">미확인-진행상태</span>
								</div>
								<a data-cid="slipStatusInfoN" class="hidden" type="button"
									role="button" tabindex="0">선택</a>
								<div class="hidden"></div>
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									data-cid="slipStatusInfoN" type="button"
									data-lookup="slipStatusInfo" aria-label="진행상태 검색">⌕</button>
								<div class="tags-input last-child" data-cid="slipStatusInfoN">
									<div class="input-height-fixed" data-cid="slipStatusInfoN">
										<div>
											<div class="tags-input-typeahead">
												<div>
													<div class="tags-input-typeahead">
														<input type="text"
															class="form-control form-control-code noneEvent "
															data-cid="slipStatusInfoN" placeholder="미확인-진행상태"
															value="" data-field-key="slipStatusInfoN"
															name="slipStatusInfoN" aria-label="미확인-진행상태"
															id="field-main-slipStatusInfoN-3">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button
									class="btn btn-default btn-ellipsis btn-vertical-top hidden"
									data-cid="slipStatusInfoN" type="button">…</button>



							</div>
						</div>
						<div class="control-set">
							<div class="control   " data-cid="slipStatusInfoY">
								<div>
									<span ,="" class="label label-default label-light "
										addon-cid="addon-slipStatusInfoY">확인-진행상태</span>
								</div>
								<a data-cid="slipStatusInfoY" class="hidden" type="button"
									role="button" tabindex="0">선택</a>
								<div class="hidden"></div>
								<button
									class="btn btn-default btn-code-search btn-vertical-top first-child"
									data-cid="slipStatusInfoY" type="button"
									data-lookup="slipStatusInfo" aria-label="진행상태 검색">⌕</button>
								<div class="tags-input last-child" data-cid="slipStatusInfoY">
									<div class="input-height-fixed" data-cid="slipStatusInfoY">
										<div>
											<div class="tags-input-typeahead">
												<div>
													<div class="tags-input-typeahead">
														<input type="text"
															class="form-control form-control-code noneEvent "
															data-cid="slipStatusInfoY" placeholder="확인-진행상태" value=""
															data-field-key="slipStatusInfoY" name="slipStatusInfoY"
															aria-label="확인-진행상태" id="field-main-slipStatusInfoY-4">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button
									class="btn btn-default btn-ellipsis btn-vertical-top hidden"
									data-cid="slipStatusInfoY" type="button">…</button>



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
