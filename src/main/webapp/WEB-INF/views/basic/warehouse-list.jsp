<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>창고등록리스트</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
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
					
					<form class="simple-search" method="get"
						action="${pageContext.request.contextPath}/basic/warehouse-list">
						<input type="search" name="q" id="searchInput"
							placeholder="검색어 입력" aria-label="창고등록리스트 검색">
						<button type="submit" class="primary-button">검색(F3)</button>
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
									<th>전화번호</th>
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
						<button type="button" data-list-action="integration">계층그룹</button>
						<button type="button" data-list-action="active">사용중단/재사용</button>
						<button type="button" data-list-action="export">Excel</button>
						<button type="button" data-list-action="integration">웹자료올리기</button>
					</div>
				</section>
			</main>
		</div>
		<dialog id="entryDialog" class="simple-dialog reference-dialog"
			aria-labelledby="entryTitle">
		<form id="entryForm" novalidate>
			<h2 id="entryTitle">창고등록</h2>
			<div class="reference-fields">
				<div class="master-entry-tabs" role="tablist">
					<button type="button" role="tab" data-entry-tab="A1"
						aria-controls="panel-A1" aria-selected="true" class="active">기본</button>
					<button type="button" role="tab" data-entry-tab="A2"
						aria-controls="panel-A2" aria-selected="false" class="">창고정보</button>
					<button type="button" role="tab" data-entry-tab="A3"
						aria-controls="panel-A3" aria-selected="false" class="">부가정보</button>
				</div>
				<div class="reference-row" data-reference-label="창고코드">
					<div class="reference-label">창고코드</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<input type="text" class="form-control form-control first-child"
									data-cid="wh_cd" placeholder="창고코드" value="00001"
									data-field-key="code" name="code" aria-label="창고코드"
									id="field-common-code-0">
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn last-child"
									data-cid="wh_cd" data-auto-code="code">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<section id="panel-A1" data-entry-panel="A1" role="tabpanel">
					<div class="reference-row" data-reference-label="창고명">
						<div class="reference-label">창고명</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="wh_des" placeholder="창고명" value=""
										data-field-key="name" name="name" aria-label="창고명"
										id="field-A1-name-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="구분">
						<div class="reference-label">구분</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control">

									<span class="form-radio" data-cid="factory_type_factoryType"><input
										type="radio" value="0" data-cid="factory_type_factoryType"
										name="factory_type_factoryType__A1"
										id="field-A1-factory_type_factoryType-0" checked=""
										data-field-key="factory_type_factoryType" aria-label="구분"><label
										for="field-A1-factory_type_factoryType-0"
										data-cid="factory_type_factoryType">창고</label></span><span
										class="form-radio" data-cid="factory_type_factoryType"><input
										type="radio" value="1" data-cid="factory_type_factoryType"
										name="factory_type_factoryType__A1"
										id="field-A1-factory_type_factoryType-1"
										data-field-key="factory_type_factoryType" aria-label="구분"><label
										for="field-A1-factory_type_factoryType-1"
										data-cid="factory_type_factoryType">공장</label></span><span
										class="form-radio" data-cid="factory_type_factoryType"><input
										type="radio" value="2" data-cid="factory_type_factoryType"
										name="factory_type_factoryType__A1"
										id="field-A1-factory_type_factoryType-2"
										data-field-key="factory_type_factoryType" aria-label="구분"><label
										for="field-A1-factory_type_factoryType-2"
										data-cid="factory_type_factoryType">공장(외주비관리)</label></span>
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control  {{style.css}} hidden">
									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-factory_type_processCode">생산공정</span>
									</div>
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="factory_type_processCode" type="button"
										data-lookup="factory_type" aria-label="구분 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="factory_type_processCode" placeholder="생산공정"
										value="" data-field-key="factory_type_processCode"
										name="factory_type_processCode" aria-label="생산공정"
										id="field-A1-factory_type_processCode-3"><input
										type="hidden" data-cid="factory_type_processCode" value=""
										data-field-key="factory_type_processCodeCode"
										name="factory_type_processCodeCode" aria-label="구분"
										id="field-A1-factory_type_processCodeCode-4">
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control  {{style.css}} hidden">
									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-factory_type_outerFactory">외주거래처코드</span>
									</div>
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="factory_type_outerFactory" type="button"
										data-lookup="factory_type" aria-label="구분 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="factory_type_outerFactory" placeholder="외주거래처코드"
										value="" data-field-key="factory_type_outerFactory"
										name="factory_type_outerFactory" aria-label="외주거래처코드"
										id="field-A1-factory_type_outerFactory-5"><input
										type="hidden" data-cid="factory_type_outerFactory" value=""
										data-field-key="factory_type_outerFactoryCode"
										name="factory_type_outerFactoryCode" aria-label="구분"
										id="field-A1-factory_type_outerFactoryCode-6">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="부가세율(매출)">
						<div class="reference-label">부가세율(매출)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control  flex-none">

									<span class="form-radio" data-cid="rate_sale_radio"><input
										type="radio" value="N" data-cid="rate_sale_radio"
										name="rate_sale_radio__A1" id="field-A1-rate_sale_radio-0"
										data-field-key="rate_sale_radio" aria-label="부가세율(매출)"
										checked=""><label for="field-A1-rate_sale_radio-0"
										data-cid="rate_sale_radio">기본설정</label></span><span
										class="form-radio" data-cid="rate_sale_radio"><input
										type="radio" value="Y" data-cid="rate_sale_radio"
										name="rate_sale_radio__A1" id="field-A1-rate_sale_radio-1"
										data-field-key="rate_sale_radio" aria-label="부가세율(매출)"><label
										for="field-A1-rate_sale_radio-1" data-cid="rate_sale_radio">직접입력</label></span>
								</div>
								<div class="control   hidden">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="rate_sale_input" placeholder="부가세율(매출)" value=""
										data-field-key="rate_sale" name="rate_sale"
										aria-label="부가세율(매출)" id="field-A1-rate_sale-2">
								</div>
								<div class="control  flex-none hidden">

									<span class="">%</span>

								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="부가세율(매입)">
						<div class="reference-label">부가세율(매입)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control  flex-none">

									<span class="form-radio" data-cid="rate_buy_radio"><input
										type="radio" value="N" data-cid="rate_buy_radio"
										name="rate_buy_radio__A1" id="field-A1-rate_buy_radio-0"
										data-field-key="rate_buy_radio" aria-label="부가세율(매입)"
										checked=""><label for="field-A1-rate_buy_radio-0"
										data-cid="rate_buy_radio">기본설정</label></span><span class="form-radio"
										data-cid="rate_buy_radio"><input type="radio" value="Y"
										data-cid="rate_buy_radio" name="rate_buy_radio__A1"
										id="field-A1-rate_buy_radio-1" data-field-key="rate_buy_radio"
										aria-label="부가세율(매입)"><label
										for="field-A1-rate_buy_radio-1" data-cid="rate_buy_radio">직접입력</label></span>
								</div>
								<div class="control   hidden">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="rate_buy_input" placeholder="부가세율(매입)" value=""
										data-field-key="rate_buy" name="rate_buy"
										aria-label="부가세율(매입)" id="field-A1-rate_buy-2">
								</div>
								<div class="control  flex-none hidden">

									<span class="">%</span>

								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="영업단가그룹">
						<div class="reference-label">영업단가그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="price_group" type="button" data-lookup="price_group"
										aria-label="영업단가그룹 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="price_group" placeholder="영업단가그룹" value=""
										data-field-key="price_group" name="price_group"
										aria-label="영업단가그룹" id="field-A1-price_group-0"><input
										type="hidden" data-cid="price_group" value=""
										data-field-key="price_groupCode" name="price_groupCode"
										aria-label="영업단가그룹" id="field-A1-price_groupCode-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="구매단가그룹">
						<div class="reference-label">구매단가그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="price_group2" type="button"
										data-lookup="price_group2" aria-label="구매단가그룹 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="price_group2" placeholder="구매단가그룹" value=""
										data-field-key="price_group2" name="price_group2"
										aria-label="구매단가그룹" id="field-A1-price_group2-0"><input
										type="hidden" data-cid="price_group2" value=""
										data-field-key="price_group2Code" name="price_group2Code"
										aria-label="구매단가그룹" id="field-A1-price_group2Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="창고계층그룹">
						<div class="reference-label">창고계층그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   " data-cid="wh_level_group">
									<a data-cid="wh_level_group" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="wh_level_group" type="button"
										data-lookup="wh_level_group" aria-label="창고계층그룹 검색">⌕</button>
									<div class="tags-input last-child" data-cid="wh_level_group">
										<div class="input-height-fixed" data-cid="wh_level_group">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="wh_level_group" placeholder="창고계층그룹" value=""
																data-field-key="wh_level_group" name="wh_level_group"
																aria-label="창고계층그룹" id="field-A1-wh_level_group-0">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="wh_level_group" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A2" data-entry-panel="A2" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="창고명">
						<div class="reference-label">창고명</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="wh_des" placeholder="창고명" value=""
										data-field-key="name" name="name" aria-label="창고명"
										id="field-A2-name-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="구분">
						<div class="reference-label">구분</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control">

									<span class="form-radio" data-cid="factory_type_factoryType"><input
										type="radio" value="0" data-cid="factory_type_factoryType"
										name="factory_type_factoryType__A2"
										id="field-A2-factory_type_factoryType-0" checked=""
										data-field-key="factory_type_factoryType" aria-label="구분"><label
										for="field-A2-factory_type_factoryType-0"
										data-cid="factory_type_factoryType">창고</label></span><span
										class="form-radio" data-cid="factory_type_factoryType"><input
										type="radio" value="1" data-cid="factory_type_factoryType"
										name="factory_type_factoryType__A2"
										id="field-A2-factory_type_factoryType-1"
										data-field-key="factory_type_factoryType" aria-label="구분"><label
										for="field-A2-factory_type_factoryType-1"
										data-cid="factory_type_factoryType">공장</label></span><span
										class="form-radio" data-cid="factory_type_factoryType"><input
										type="radio" value="2" data-cid="factory_type_factoryType"
										name="factory_type_factoryType__A2"
										id="field-A2-factory_type_factoryType-2"
										data-field-key="factory_type_factoryType" aria-label="구분"><label
										for="field-A2-factory_type_factoryType-2"
										data-cid="factory_type_factoryType">공장(외주비관리)</label></span>
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control  {{style.css}} hidden">
									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-factory_type_processCode">생산공정</span>
									</div>
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="factory_type_processCode" type="button"
										data-lookup="factory_type" aria-label="구분 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="factory_type_processCode" placeholder="생산공정"
										value="" data-field-key="factory_type_processCode"
										name="factory_type_processCode" aria-label="생산공정"
										id="field-A2-factory_type_processCode-3"><input
										type="hidden" data-cid="factory_type_processCode" value=""
										data-field-key="factory_type_processCodeCode"
										name="factory_type_processCodeCode" aria-label="구분"
										id="field-A2-factory_type_processCodeCode-4">
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control  {{style.css}} hidden">
									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-factory_type_outerFactory">외주거래처코드</span>
									</div>
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="factory_type_outerFactory" type="button"
										data-lookup="factory_type" aria-label="구분 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="factory_type_outerFactory" placeholder="외주거래처코드"
										value="" data-field-key="factory_type_outerFactory"
										name="factory_type_outerFactory" aria-label="외주거래처코드"
										id="field-A2-factory_type_outerFactory-5"><input
										type="hidden" data-cid="factory_type_outerFactory" value=""
										data-field-key="factory_type_outerFactoryCode"
										name="factory_type_outerFactoryCode" aria-label="구분"
										id="field-A2-factory_type_outerFactoryCode-6">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="부가세율(매출)">
						<div class="reference-label">부가세율(매출)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control  flex-none">

									<span class="form-radio" data-cid="rate_sale_radio"><input
										type="radio" value="N" data-cid="rate_sale_radio"
										name="rate_sale_radio__A2" id="field-A2-rate_sale_radio-0"
										data-field-key="rate_sale_radio" aria-label="부가세율(매출)"
										checked=""><label for="field-A2-rate_sale_radio-0"
										data-cid="rate_sale_radio">기본설정</label></span><span
										class="form-radio" data-cid="rate_sale_radio"><input
										type="radio" value="Y" data-cid="rate_sale_radio"
										name="rate_sale_radio__A2" id="field-A2-rate_sale_radio-1"
										data-field-key="rate_sale_radio" aria-label="부가세율(매출)"><label
										for="field-A2-rate_sale_radio-1" data-cid="rate_sale_radio">직접입력</label></span>
								</div>
								<div class="control   hidden">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="rate_sale_input" placeholder="부가세율(매출)" value=""
										data-field-key="rate_sale" name="rate_sale"
										aria-label="부가세율(매출)" id="field-A2-rate_sale-2">
								</div>
								<div class="control  flex-none hidden">

									<span class="">%</span>

								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="부가세율(매입)">
						<div class="reference-label">부가세율(매입)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control  flex-none">

									<span class="form-radio" data-cid="rate_buy_radio"><input
										type="radio" value="N" data-cid="rate_buy_radio"
										name="rate_buy_radio__A2" id="field-A2-rate_buy_radio-0"
										data-field-key="rate_buy_radio" aria-label="부가세율(매입)"
										checked=""><label for="field-A2-rate_buy_radio-0"
										data-cid="rate_buy_radio">기본설정</label></span><span class="form-radio"
										data-cid="rate_buy_radio"><input type="radio" value="Y"
										data-cid="rate_buy_radio" name="rate_buy_radio__A2"
										id="field-A2-rate_buy_radio-1" data-field-key="rate_buy_radio"
										aria-label="부가세율(매입)"><label
										for="field-A2-rate_buy_radio-1" data-cid="rate_buy_radio">직접입력</label></span>
								</div>
								<div class="control   hidden">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="rate_buy_input" placeholder="부가세율(매입)" value=""
										data-field-key="rate_buy" name="rate_buy"
										aria-label="부가세율(매입)" id="field-A2-rate_buy-2">
								</div>
								<div class="control  flex-none hidden">

									<span class="">%</span>

								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="영업단가그룹">
						<div class="reference-label">영업단가그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="price_group" type="button" data-lookup="price_group"
										aria-label="영업단가그룹 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="price_group" placeholder="영업단가그룹" value=""
										data-field-key="price_group" name="price_group"
										aria-label="영업단가그룹" id="field-A2-price_group-0"><input
										type="hidden" data-cid="price_group" value=""
										data-field-key="price_groupCode" name="price_groupCode"
										aria-label="영업단가그룹" id="field-A2-price_groupCode-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="구매단가그룹">
						<div class="reference-label">구매단가그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="price_group2" type="button"
										data-lookup="price_group2" aria-label="구매단가그룹 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="price_group2" placeholder="구매단가그룹" value=""
										data-field-key="price_group2" name="price_group2"
										aria-label="구매단가그룹" id="field-A2-price_group2-0"><input
										type="hidden" data-cid="price_group2" value=""
										data-field-key="price_group2Code" name="price_group2Code"
										aria-label="구매단가그룹" id="field-A2-price_group2Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="창고계층그룹">
						<div class="reference-label">창고계층그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   " data-cid="wh_level_group">
									<a data-cid="wh_level_group" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="wh_level_group" type="button"
										data-lookup="wh_level_group" aria-label="창고계층그룹 검색">⌕</button>
									<div class="tags-input last-child" data-cid="wh_level_group">
										<div class="input-height-fixed" data-cid="wh_level_group">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="wh_level_group" placeholder="창고계층그룹" value=""
																data-field-key="wh_level_group" name="wh_level_group"
																aria-label="창고계층그룹" id="field-A2-wh_level_group-0">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="wh_level_group" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A3" data-entry-panel="A3" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="추가문자형식1">
						<div class="reference-label">추가문자형식1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="ADD_TXT_01_T" placeholder="추가문자형식1" value=""
										data-field-key="ADD_TXT_01_T" name="ADD_TXT_01_T"
										aria-label="추가문자형식1" id="field-A3-ADD_TXT_01_T-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가문자형식2">
						<div class="reference-label">추가문자형식2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="ADD_TXT_02_T" placeholder="추가문자형식2" value=""
										data-field-key="ADD_TXT_02_T" name="ADD_TXT_02_T"
										aria-label="추가문자형식2" id="field-A3-ADD_TXT_02_T-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가문자형식3">
						<div class="reference-label">추가문자형식3</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="ADD_TXT_03_T" placeholder="추가문자형식3" value=""
										data-field-key="ADD_TXT_03_T" name="ADD_TXT_03_T"
										aria-label="추가문자형식3" id="field-A3-ADD_TXT_03_T-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가숫자형식1">
						<div class="reference-label">추가숫자형식1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="ADD_NUM_01_T" placeholder="추가숫자형식1" value=""
										data-field-key="ADD_NUM_01_T" name="ADD_NUM_01_T"
										aria-label="추가숫자형식1" id="field-A3-ADD_NUM_01_T-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가숫자형식2">
						<div class="reference-label">추가숫자형식2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="ADD_NUM_02_T" placeholder="추가숫자형식2" value=""
										data-field-key="ADD_NUM_02_T" name="ADD_NUM_02_T"
										aria-label="추가숫자형식2" id="field-A3-ADD_NUM_02_T-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가숫자형식3">
						<div class="reference-label">추가숫자형식3</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="ADD_NUM_03_T" placeholder="추가숫자형식3" value=""
										data-field-key="ADD_NUM_03_T" name="ADD_NUM_03_T"
										aria-label="추가숫자형식3" id="field-A3-ADD_NUM_03_T-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가장문형식1">
						<div class="reference-label">추가장문형식1</div>
						<div class="reference-control">
							<div class="control-set multi-line   ">
								<div class="control   ">

									<textarea rows="2" class="form-control first-child last-child"
										data-cid="ADD_LTXT_01_T" wrap="hard" placeholder="추가장문형식1"
										data-field-key="ADD_LTXT_01_T" name="ADD_LTXT_01_T"
										aria-label="추가장문형식1" id="field-A3-ADD_LTXT_01_T-0"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가장문형식2">
						<div class="reference-label">추가장문형식2</div>
						<div class="reference-control">
							<div class="control-set multi-line   ">
								<div class="control   ">

									<textarea rows="2" class="form-control first-child last-child"
										data-cid="ADD_LTXT_02_T" wrap="hard" placeholder="추가장문형식2"
										data-field-key="ADD_LTXT_02_T" name="ADD_LTXT_02_T"
										aria-label="추가장문형식2" id="field-A3-ADD_LTXT_02_T-0"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가장문형식3">
						<div class="reference-label">추가장문형식3</div>
						<div class="reference-control">
							<div class="control-set multi-line   ">
								<div class="control   ">

									<textarea rows="2" class="form-control first-child last-child"
										data-cid="ADD_LTXT_03_T" wrap="hard" placeholder="추가장문형식3"
										data-field-key="ADD_LTXT_03_T" name="ADD_LTXT_03_T"
										aria-label="추가장문형식3" id="field-A3-ADD_LTXT_03_T-0"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가일자형식1">
						<div class="reference-label">추가일자형식1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<div class="wrapper-datepicker {{style.contextCss}}"
										data-cid="{{cid}}">
										<select data-field-key="ADD_DATE_01_T"
											data-cid="ADD_DATE_01_T" name="ADD_DATE_01_T"
											aria-label="추가일자형식1" data-date-year="true"
											id="field-A3-ADD_DATE_01_T-0"><option value="===="
												selected="">====</option>
											<option value="2027">2027</option>
											<option value="2026">2026</option>
											<option value="2025">2025</option>
											<option value="2024">2024</option>
											<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
										<select data-field-key="ADD_DATE_01_T_1"
											data-cid="ADD_DATE_01_T" name="ADD_DATE_01_T_1"
											aria-label="추가일자형식1" data-date-month="true"
											id="field-A3-ADD_DATE_01_T_1-1"><option value="=="
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
											<option value="12">12</option></select> <span class="">/&nbsp;</span><input
											type="text" class="form-control " data-cid="ADD_DATE_01_T"
											value="" data-field-key="ADD_DATE_01_T_2"
											name="ADD_DATE_01_T_2" aria-label="추가일자형식1"
											id="field-A3-ADD_DATE_01_T_2-2">
										<div id="btn-datepicker-toggle" data-cid="ADD_DATE_01_T"
											class="btn-datepicker-toggle " data-calendar="true"
											tabindex="0" role="button" aria-label="추가일자형식1 달력">▦</div>

									</div>




								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가일자형식2">
						<div class="reference-label">추가일자형식2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<div class="wrapper-datepicker {{style.contextCss}}"
										data-cid="{{cid}}">
										<select data-field-key="ADD_DATE_02_T"
											data-cid="ADD_DATE_02_T" name="ADD_DATE_02_T"
											aria-label="추가일자형식2" data-date-year="true"
											id="field-A3-ADD_DATE_02_T-0"><option value="===="
												selected="">====</option>
											<option value="2027">2027</option>
											<option value="2026">2026</option>
											<option value="2025">2025</option>
											<option value="2024">2024</option>
											<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
										<select data-field-key="ADD_DATE_02_T_1"
											data-cid="ADD_DATE_02_T" name="ADD_DATE_02_T_1"
											aria-label="추가일자형식2" data-date-month="true"
											id="field-A3-ADD_DATE_02_T_1-1"><option value="=="
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
											<option value="12">12</option></select> <span class="">/&nbsp;</span><input
											type="text" class="form-control " data-cid="ADD_DATE_02_T"
											value="" data-field-key="ADD_DATE_02_T_2"
											name="ADD_DATE_02_T_2" aria-label="추가일자형식2"
											id="field-A3-ADD_DATE_02_T_2-2">
										<div id="btn-datepicker-toggle" data-cid="ADD_DATE_02_T"
											class="btn-datepicker-toggle " data-calendar="true"
											tabindex="0" role="button" aria-label="추가일자형식2 달력">▦</div>

									</div>




								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="추가일자형식3">
						<div class="reference-label">추가일자형식3</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<div class="wrapper-datepicker {{style.contextCss}}"
										data-cid="{{cid}}">
										<select data-field-key="ADD_DATE_03_T"
											data-cid="ADD_DATE_03_T" name="ADD_DATE_03_T"
											aria-label="추가일자형식3" data-date-year="true"
											id="field-A3-ADD_DATE_03_T-0"><option value="===="
												selected="">====</option>
											<option value="2027">2027</option>
											<option value="2026">2026</option>
											<option value="2025">2025</option>
											<option value="2024">2024</option>
											<option value="직접입력">직접입력</option></select><span class="">&nbsp;/</span>
										<select data-field-key="ADD_DATE_03_T_1"
											data-cid="ADD_DATE_03_T" name="ADD_DATE_03_T_1"
											aria-label="추가일자형식3" data-date-month="true"
											id="field-A3-ADD_DATE_03_T_1-1"><option value="=="
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
											<option value="12">12</option></select> <span class="">/&nbsp;</span><input
											type="text" class="form-control " data-cid="ADD_DATE_03_T"
											value="" data-field-key="ADD_DATE_03_T_2"
											name="ADD_DATE_03_T_2" aria-label="추가일자형식3"
											id="field-A3-ADD_DATE_03_T_2-2">
										<div id="btn-datepicker-toggle" data-cid="ADD_DATE_03_T"
											class="btn-datepicker-toggle " data-calendar="true"
											tabindex="0" role="button" aria-label="추가일자형식3 달력">▦</div>

									</div>




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
	  document.querySelector("#entryForm").addEventListener("reset", function () {
	    if (tabs.length) setTimeout(function () { tabs[0].click(); }, 0);
	  });
	  const selectAllRows = document.querySelector("#selectAllRows");
	  if (selectAllRows) selectAllRows.addEventListener("click", function (event) {
	    event.preventDefault();
	    alert("목록 선택 기능 구현이 필요합니다.");
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
