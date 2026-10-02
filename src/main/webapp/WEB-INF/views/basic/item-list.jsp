<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>품목등록 리스트</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="basic/item-list" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>품목등록 리스트</h1>
				</header>
				<section class="screen-content simple-page">
					
					<form class="simple-search" method="get"
						action="${pageContext.request.contextPath}/basic/item-list">
						<input type="search" name="q" id="searchInput"
							placeholder="검색어 입력" aria-label="품목등록 리스트 검색">
						<button type="submit" class="primary-button">검색(F3)</button>
					</form>
					<div class="table-scroll">
						<table class="list-table">
							<thead>
								<tr>
									<th class="selection-column"><input type="checkbox"
										class="list-row-select" id="selectAllRows" aria-label="전체 선택"></th>
									<th>품목코드</th>
									<th>품목명</th>
									<th>규격</th>
									<th>단위</th>
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
						<button type="button" data-list-action="integration">바코드</button>
						<button type="button" data-list-action="integration">관계설정</button>
						<button type="button" data-list-action="integration">계층그룹</button>
						<button type="button" data-list-action="edit">변경</button>
						<button type="button" data-list-action="integration">재고조정</button>
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
			<h2 id="entryTitle">품목등록</h2>
			<div class="reference-fields">
				<div class="master-entry-tabs" role="tablist">
					<button type="button" role="tab" data-entry-tab="A1"
						aria-controls="panel-A1" aria-selected="true" class="active">기본</button>
					<button type="button" role="tab" data-entry-tab="A2"
						aria-controls="panel-A2" aria-selected="false" class="">품목정보</button>
					<button type="button" role="tab" data-entry-tab="A3"
						aria-controls="panel-A3" aria-selected="false" class="">수량</button>
					<button type="button" role="tab" data-entry-tab="A4"
						aria-controls="panel-A4" aria-selected="false" class="">단가</button>
					<button type="button" role="tab" data-entry-tab="A5"
						aria-controls="panel-A5" aria-selected="false" class="">원가</button>
					<button type="button" role="tab" data-entry-tab="A6"
						aria-controls="panel-A6" aria-selected="false" class="">부가정보</button>
					<button type="button" role="tab" data-entry-tab="A7"
						aria-controls="panel-A7" aria-selected="false" class="">관리대상</button>
				</div>
				<div class="reference-row" data-reference-label="품목코드">
					<div class="reference-label">품목코드</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<input type="text" class="form-control form-control first-child"
									data-cid="prod_cd" placeholder="품목코드" value="Z00014"
									data-field-key="code" name="code" aria-label="품목코드"
									id="field-common-code-0">
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn last-child"
									data-cid="prod_cd" data-auto-code="code">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<section id="panel-A1" data-entry-panel="A1" role="tabpanel">
					<div class="reference-row" data-reference-label="품목명">
						<div class="reference-label">품목명</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="prod_des" placeholder="품목명" value=""
										data-field-key="name" name="name" aria-label="품목명"
										id="field-A1-name-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="prod_des" data-auto-code="name">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="규격">
						<div class="reference-label">규격</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="3" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A1" id="field-A1-SIZE_FLAG-0" checked=""
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A1-SIZE_FLAG-0" data-cid="SIZE_FLAG">규격명</label></span><span
										class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="0" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A1" id="field-A1-SIZE_FLAG-1"
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A1-SIZE_FLAG-1" data-cid="SIZE_FLAG">규격그룹</label></span><span
										class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="1" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A1" id="field-A1-SIZE_FLAG-2"
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A1-SIZE_FLAG-2" data-cid="SIZE_FLAG">규격계산</label></span><span
										class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="2" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A1" id="field-A1-SIZE_FLAG-3"
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A1-SIZE_FLAG-3" data-cid="SIZE_FLAG">규격계산그룹</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="SIZE_DES" placeholder="규격" value=""
										data-field-key="size" name="size" aria-label="규격"
										id="field-A1-size-4">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="SIZE_DES" data-auto-code="size">Fn</button>
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control   hidden" data-cid="SIZE_CD">
									<a data-cid="SIZE_CD" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="SIZE_CD" type="button" data-lookup="size"
										aria-label="규격 검색">⌕</button>
									<div class="tags-input last-child" data-cid="SIZE_CD">
										<div class="input-height-fixed" data-cid="SIZE_CD">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="SIZE_CD" placeholder="" value=""
																data-field-key="SIZE_CD" name="SIZE_CD" aria-label="규격"
																id="field-A1-SIZE_CD-5">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="SIZE_CD" type="button">…</button>



								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control   hidden" data-cid="SIZE_CALC_CD">
									<a data-cid="SIZE_CALC_CD" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="SIZE_CALC_CD" type="button" data-lookup="size"
										aria-label="규격 검색">⌕</button>
									<div class="tags-input last-child" data-cid="SIZE_CALC_CD">
										<div class="input-height-fixed" data-cid="SIZE_CALC_CD">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="SIZE_CALC_CD" placeholder="" value=""
																data-field-key="SIZE_CALC_CD" name="SIZE_CALC_CD"
																aria-label="규격" id="field-A1-SIZE_CALC_CD-6">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="SIZE_CALC_CD" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단위">
						<div class="reference-label">단위</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="unit" placeholder="단위" value=""
										data-field-key="unit" name="unit" aria-label="단위"
										id="field-A1-unit-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품목구분">
						<div class="reference-label">품목구분</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="0" data-cid="PROD_TYPE"
										name="PROD_TYPE__A1" id="field-A1-PROD_TYPE-0"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A1-PROD_TYPE-0" data-cid="PROD_TYPE">원재료</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="4" data-cid="PROD_TYPE"
										name="PROD_TYPE__A1" id="field-A1-PROD_TYPE-1"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A1-PROD_TYPE-1" data-cid="PROD_TYPE">부재료</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="1" data-cid="PROD_TYPE"
										name="PROD_TYPE__A1" id="field-A1-PROD_TYPE-2"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A1-PROD_TYPE-2" data-cid="PROD_TYPE">제품</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="2" data-cid="PROD_TYPE"
										name="PROD_TYPE__A1" id="field-A1-PROD_TYPE-3"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A1-PROD_TYPE-3" data-cid="PROD_TYPE">반제품</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="3" data-cid="PROD_TYPE"
										name="PROD_TYPE__A1" id="field-A1-PROD_TYPE-4" checked=""
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A1-PROD_TYPE-4" data-cid="PROD_TYPE">상품</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="7" data-cid="PROD_TYPE"
										name="PROD_TYPE__A1" id="field-A1-PROD_TYPE-5"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A1-PROD_TYPE-5" data-cid="PROD_TYPE">무형상품</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-SET_FLAG">세트여부</span>
									</div>
									<span class="form-radio" data-cid="SET_FLAG"><input
										type="radio" value="1" data-cid="SET_FLAG" name="SET_FLAG__A1"
										id="field-A1-SET_FLAG-6" data-field-key="SET_FLAG"
										aria-label="품목구분"><label for="field-A1-SET_FLAG-6"
										data-cid="SET_FLAG">사용</label></span><span class="form-radio"
										data-cid="SET_FLAG"><input type="radio" value="0"
										data-cid="SET_FLAG" name="SET_FLAG__A1"
										id="field-A1-SET_FLAG-7" checked="" data-field-key="SET_FLAG"
										aria-label="품목구분"><label for="field-A1-SET_FLAG-7"
										data-cid="SET_FLAG">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="재고수량관리">
						<div class="reference-label">재고수량관리</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="bal_flag"><input
										type="radio" value="1" data-cid="bal_flag" name="bal_flag__A1"
										id="field-A1-bal_flag-0" checked="" data-field-key="bal_flag"
										aria-label="재고수량관리"><label for="field-A1-bal_flag-0"
										data-cid="bal_flag">사용</label></span><span class="form-radio"
										data-cid="bal_flag"><input type="radio" value="0"
										data-cid="bal_flag" name="bal_flag__A1"
										id="field-A1-bal_flag-1" data-field-key="bal_flag"
										aria-label="재고수량관리"><label for="field-A1-bal_flag-1"
										data-cid="bal_flag">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="생산공정">
						<div class="reference-label">생산공정</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   " data-cid="WH_CD">
									<a data-cid="WH_CD" class="hidden" type="button" role="button"
										tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="WH_CD" type="button" data-lookup="wh_cd_base"
										aria-label="생산공정 검색">⌕</button>
									<div class="tags-input last-child" data-cid="WH_CD">
										<div class="input-height-fixed" data-cid="WH_CD">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="WH_CD" placeholder="생산공정" value=""
																data-field-key="wh_cd_base" name="wh_cd_base"
																aria-label="생산공정" id="field-A1-wh_cd_base-0">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="WH_CD" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="재고수량">
						<div class="reference-label">재고수량</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<a id="inv_adjust" data-cid="inv_adjust" class="" type="button"
										role="button" tabindex="0">입력</a>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="입고단가">
						<div class="reference-label">입고단가</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="in_price" placeholder="입고단가" value=""
										data-field-key="in_price" name="in_price" aria-label="입고단가"
										id="field-A1-in_price-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="in_price_vat"><input
										type="checkbox" value="1" data-cid="in_price_vat"
										name="in_price_vat" id="field-A1-in_price_vat-1" class=""
										data-field-key="in_price_vat" aria-label="입고단가"><label
										for="field-A1-in_price_vat-1" data-cid="in_price_vat" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="출고단가">
						<div class="reference-label">출고단가</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price" placeholder="출고단가" value=""
										data-field-key="price" name="price" aria-label="출고단가"
										id="field-A1-price-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price_vat"><input
										type="checkbox" value="1" data-cid="out_price_vat"
										name="out_price_vat" id="field-A1-out_price_vat-1" class=""
										data-field-key="out_price_vat" aria-label="출고단가"><label
										for="field-A1-out_price_vat-1" data-cid="out_price_vat"
										class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A2" data-entry-panel="A2" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="품목명">
						<div class="reference-label">품목명</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="prod_des" placeholder="품목명" value=""
										data-field-key="name" name="name" aria-label="품목명"
										id="field-A2-name-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="prod_des" data-auto-code="name">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="규격">
						<div class="reference-label">규격</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="3" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A2" id="field-A2-SIZE_FLAG-0" checked=""
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A2-SIZE_FLAG-0" data-cid="SIZE_FLAG">규격명</label></span><span
										class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="0" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A2" id="field-A2-SIZE_FLAG-1"
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A2-SIZE_FLAG-1" data-cid="SIZE_FLAG">규격그룹</label></span><span
										class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="1" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A2" id="field-A2-SIZE_FLAG-2"
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A2-SIZE_FLAG-2" data-cid="SIZE_FLAG">규격계산</label></span><span
										class="form-radio" data-cid="SIZE_FLAG"><input
										type="radio" value="2" data-cid="SIZE_FLAG"
										name="SIZE_FLAG__A2" id="field-A2-SIZE_FLAG-3"
										data-field-key="SIZE_FLAG" aria-label="규격"><label
										for="field-A2-SIZE_FLAG-3" data-cid="SIZE_FLAG">규격계산그룹</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="SIZE_DES" placeholder="규격" value=""
										data-field-key="size" name="size" aria-label="규격"
										id="field-A2-size-4">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="SIZE_DES" data-auto-code="size">Fn</button>
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control   hidden" data-cid="SIZE_CD">
									<a data-cid="SIZE_CD" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="SIZE_CD" type="button" data-lookup="size"
										aria-label="규격 검색">⌕</button>
									<div class="tags-input last-child" data-cid="SIZE_CD">
										<div class="input-height-fixed" data-cid="SIZE_CD">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="SIZE_CD" placeholder="" value=""
																data-field-key="SIZE_CD" name="SIZE_CD" aria-label="규격"
																id="field-A2-SIZE_CD-5">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="SIZE_CD" type="button">…</button>



								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control   hidden" data-cid="SIZE_CALC_CD">
									<a data-cid="SIZE_CALC_CD" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="SIZE_CALC_CD" type="button" data-lookup="size"
										aria-label="규격 검색">⌕</button>
									<div class="tags-input last-child" data-cid="SIZE_CALC_CD">
										<div class="input-height-fixed" data-cid="SIZE_CALC_CD">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="SIZE_CALC_CD" placeholder="" value=""
																data-field-key="SIZE_CALC_CD" name="SIZE_CALC_CD"
																aria-label="규격" id="field-A2-SIZE_CALC_CD-6">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="SIZE_CALC_CD" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단위">
						<div class="reference-label">단위</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="unit" placeholder="단위" value=""
										data-field-key="unit" name="unit" aria-label="단위"
										id="field-A2-unit-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품목구분">
						<div class="reference-label">품목구분</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="0" data-cid="PROD_TYPE"
										name="PROD_TYPE__A2" id="field-A2-PROD_TYPE-0"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A2-PROD_TYPE-0" data-cid="PROD_TYPE">원재료</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="4" data-cid="PROD_TYPE"
										name="PROD_TYPE__A2" id="field-A2-PROD_TYPE-1"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A2-PROD_TYPE-1" data-cid="PROD_TYPE">부재료</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="1" data-cid="PROD_TYPE"
										name="PROD_TYPE__A2" id="field-A2-PROD_TYPE-2"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A2-PROD_TYPE-2" data-cid="PROD_TYPE">제품</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="2" data-cid="PROD_TYPE"
										name="PROD_TYPE__A2" id="field-A2-PROD_TYPE-3"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A2-PROD_TYPE-3" data-cid="PROD_TYPE">반제품</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="3" data-cid="PROD_TYPE"
										name="PROD_TYPE__A2" id="field-A2-PROD_TYPE-4" checked=""
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A2-PROD_TYPE-4" data-cid="PROD_TYPE">상품</label></span><span
										class="form-radio" data-cid="PROD_TYPE"><input
										type="radio" value="7" data-cid="PROD_TYPE"
										name="PROD_TYPE__A2" id="field-A2-PROD_TYPE-5"
										data-field-key="PROD_TYPE" aria-label="품목구분"><label
										for="field-A2-PROD_TYPE-5" data-cid="PROD_TYPE">무형상품</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-SET_FLAG">세트여부</span>
									</div>
									<span class="form-radio" data-cid="SET_FLAG"><input
										type="radio" value="1" data-cid="SET_FLAG" name="SET_FLAG__A2"
										id="field-A2-SET_FLAG-6" data-field-key="SET_FLAG"
										aria-label="품목구분"><label for="field-A2-SET_FLAG-6"
										data-cid="SET_FLAG">사용</label></span><span class="form-radio"
										data-cid="SET_FLAG"><input type="radio" value="0"
										data-cid="SET_FLAG" name="SET_FLAG__A2"
										id="field-A2-SET_FLAG-7" checked="" data-field-key="SET_FLAG"
										aria-label="품목구분"><label for="field-A2-SET_FLAG-7"
										data-cid="SET_FLAG">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="재고수량관리">
						<div class="reference-label">재고수량관리</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="bal_flag"><input
										type="radio" value="1" data-cid="bal_flag" name="bal_flag__A2"
										id="field-A2-bal_flag-0" checked="" data-field-key="bal_flag"
										aria-label="재고수량관리"><label for="field-A2-bal_flag-0"
										data-cid="bal_flag">사용</label></span><span class="form-radio"
										data-cid="bal_flag"><input type="radio" value="0"
										data-cid="bal_flag" name="bal_flag__A2"
										id="field-A2-bal_flag-1" data-field-key="bal_flag"
										aria-label="재고수량관리"><label for="field-A2-bal_flag-1"
										data-cid="bal_flag">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="부가세율(매출)">
						<div class="reference-label">부가세율(매출)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="tax_input" placeholder="부가세율(매출)" value=""
										data-field-key="tax" name="tax" aria-label="부가세율(매출)"
										id="field-A2-tax-0">
								</div>
								<div class="control  flex-none ">

									<span class="">%</span>

								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="부가세율(매입)">
						<div class="reference-label">부가세율(매입)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="vat_rate_by_input" placeholder="부가세율(매입)" value=""
										data-field-key="vat_rate_by" name="vat_rate_by"
										aria-label="부가세율(매입)" id="field-A2-vat_rate_by-0">
								</div>
								<div class="control  flex-none ">

									<span class="">%</span>

								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="바코드">
						<div class="reference-label">바코드</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="bar_code" placeholder="바코드" value=""
										data-field-key="bar_code" name="bar_code" aria-label="바코드"
										id="field-A2-bar_code-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="bar_code" data-auto-code="bar_code">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="생산공정">
						<div class="reference-label">생산공정</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   " data-cid="WH_CD">
									<a data-cid="WH_CD" class="hidden" type="button" role="button"
										tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="WH_CD" type="button" data-lookup="wh_cd_base"
										aria-label="생산공정 검색">⌕</button>
									<div class="tags-input last-child" data-cid="WH_CD">
										<div class="input-height-fixed" data-cid="WH_CD">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="WH_CD" placeholder="생산공정" value=""
																data-field-key="wh_cd_base" name="wh_cd_base"
																aria-label="생산공정" id="field-A2-wh_cd_base-0">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="WH_CD" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="검색창내용">
						<div class="reference-label">검색창내용</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="remarks_win" placeholder="검색창내용" value=""
										data-field-key="remarks_win" name="remarks_win"
										aria-label="검색창내용" id="field-A2-remarks_win-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품목공유여부">
						<div class="reference-label">품목공유여부</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-checkbox" data-cid="cs_flag"><input
										type="checkbox" value="1" data-cid="cs_flag" name="cs_flag"
										id="field-A2-cs_flag-0" class="" data-field-key="cs_flag"
										aria-label="품목공유여부"><label for="field-A2-cs_flag-0"
										data-cid="cs_flag" class="">C-Portal공유</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="이미지">
						<div class="reference-label">이미지</div>
						<div class="reference-control">
							<div class="control-set multi-line ">
								<div class="   ">

									<div class="control {{style.display}}">
										<a id="prod_image" data-cid="prod_image" class=""
											type="button" role="button" tabindex="0">이미지삽입</a>
									</div>
									<div></div>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="파일관리">
						<div class="reference-label">파일관리</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<a id="prod_file" data-cid="prod_file" class="" type="button"
										role="button" tabindex="0">파일관리</a>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품목그룹1">
						<div class="reference-label">품목그룹1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="class_cd" type="button" data-lookup="class_cd"
										aria-label="품목그룹1 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="class_cd" placeholder="품목그룹1" value=""
										data-field-key="class_cd" name="class_cd" aria-label="품목그룹1"
										id="field-A2-class_cd-0"><input type="hidden"
										data-cid="class_cd" value="" data-field-key="class_cdCode"
										name="class_cdCode" aria-label="품목그룹1"
										id="field-A2-class_cdCode-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품목그룹2">
						<div class="reference-label">품목그룹2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="class_cd2" type="button" data-lookup="class_cd2"
										aria-label="품목그룹2 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="class_cd2" placeholder="품목그룹2" value=""
										data-field-key="class_cd2" name="class_cd2" aria-label="품목그룹2"
										id="field-A2-class_cd2-0"><input type="hidden"
										data-cid="class_cd2" value="" data-field-key="class_cd2Code"
										name="class_cd2Code" aria-label="품목그룹2"
										id="field-A2-class_cd2Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품목그룹3">
						<div class="reference-label">품목그룹3</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="class_cd3" type="button" data-lookup="class_cd3"
										aria-label="품목그룹3 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="class_cd3" placeholder="품목그룹3" value=""
										data-field-key="class_cd3" name="class_cd3" aria-label="품목그룹3"
										id="field-A2-class_cd3-0"><input type="hidden"
										data-cid="class_cd3" value="" data-field-key="class_cd3Code"
										name="class_cd3Code" aria-label="품목그룹3"
										id="field-A2-class_cd3Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="적요">
						<div class="reference-label">적요</div>
						<div class="reference-control">
							<div class="control-set multi-line   ">
								<div class="control   ">

									<textarea rows="2" class="form-control first-child last-child"
										data-cid="remarks" wrap="hard" placeholder="적요"
										data-field-key="remarks" name="remarks" aria-label="적요"
										id="field-A2-remarks-0"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품질검사유형">
						<div class="reference-label">품질검사유형</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="inspect_type_cd" type="button"
										data-lookup="inspect_type_cd" aria-label="품질검사유형 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="inspect_type_cd" placeholder="품질검사유형" value=""
										data-field-key="inspect_type_cd" name="inspect_type_cd"
										aria-label="품질검사유형" id="field-A2-inspect_type_cd-0"><input
										type="hidden" data-cid="inspect_type_cd" value="0"
										data-field-key="inspect_type_cdCode"
										name="inspect_type_cdCode" aria-label="품질검사유형"
										id="field-A2-inspect_type_cdCode-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품질검사방법">
						<div class="reference-label">품질검사방법</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="INSPECT_STATUS"><input
										type="radio" value="L" data-cid="INSPECT_STATUS"
										name="INSPECT_STATUS__A2" id="field-A2-INSPECT_STATUS-0"
										checked="" data-field-key="INSPECT_STATUS" aria-label="품질검사방법"><label
										for="field-A2-INSPECT_STATUS-0" data-cid="INSPECT_STATUS">전수</label></span><span
										class="form-radio" data-cid="INSPECT_STATUS"><input
										type="radio" value="S" data-cid="INSPECT_STATUS"
										name="INSPECT_STATUS__A2" id="field-A2-INSPECT_STATUS-1"
										data-field-key="INSPECT_STATUS" aria-label="품질검사방법"><label
										for="field-A2-INSPECT_STATUS-1" data-cid="INSPECT_STATUS">샘플링(%)</label></span>
								</div>
								<div class="control   hidden">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="SAMPLE_PERCENT" placeholder="품질검사방법" value=""
										data-field-key="inspect_status" name="inspect_status"
										aria-label="품질검사방법" id="field-A2-inspect_status-2">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품목계층그룹">
						<div class="reference-label">품목계층그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   " data-cid="prod_level_group">
									<a data-cid="prod_level_group" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="prod_level_group" type="button"
										data-lookup="prod_level_group" aria-label="품목계층그룹 검색">⌕</button>
									<div class="tags-input last-child" data-cid="prod_level_group">
										<div class="input-height-fixed" data-cid="prod_level_group">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="prod_level_group" placeholder="품목계층그룹"
																value="" data-field-key="prod_level_group"
																name="prod_level_group" aria-label="품목계층그룹"
																id="field-A2-prod_level_group-0">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="prod_level_group" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A3" data-entry-panel="A3" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="추가수량당수량">
						<div class="reference-label">추가수량당수량</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="EXCH_RATE" placeholder="추가수량당수량" value="1"
										data-field-key="exch_deno" name="exch_deno"
										aria-label="추가수량당수량" id="field-A3-exch_deno-0">
								</div>
								<div class="control  flex-none ">

									<span class=""> / </span>

								</div>
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="DENO_RATE" placeholder="" maxlength="9" value="1"
										data-field-key="DENO_RATE" name="DENO_RATE"
										aria-label="추가수량당수량" id="field-A3-DENO_RATE-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="안전재고관리">
						<div class="reference-label">안전재고관리</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-sheet_radio">주문서</span>
									</div>
									<span class="form-radio" data-cid="sheet_radio"><input
										type="radio" value="1" data-cid="sheet_radio"
										name="sheet_radio__A3" id="field-A3-sheet_radio-0"
										data-field-key="sheet_radio" aria-label="안전재고관리"><label
										for="field-A3-sheet_radio-0" data-cid="sheet_radio">사용</label></span><span
										class="form-radio" data-cid="sheet_radio"><input
										type="radio" value="2" data-cid="sheet_radio"
										name="sheet_radio__A3" id="field-A3-sheet_radio-1" checked=""
										data-field-key="sheet_radio" aria-label="안전재고관리"><label
										for="field-A3-sheet_radio-1" data-cid="sheet_radio">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-sell_radio">판매</span>
									</div>
									<span class="form-radio" data-cid="sell_radio"><input
										type="radio" value="1" data-cid="sell_radio"
										name="sell_radio__A3" id="field-A3-sell_radio-2"
										data-field-key="sell_radio" aria-label="안전재고관리"><label
										for="field-A3-sell_radio-2" data-cid="sell_radio">사용</label></span><span
										class="form-radio" data-cid="sell_radio"><input
										type="radio" value="2" data-cid="sell_radio"
										name="sell_radio__A3" id="field-A3-sell_radio-3" checked=""
										data-field-key="sell_radio" aria-label="안전재고관리"><label
										for="field-A3-sell_radio-3" data-cid="sell_radio">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-prod_out">생산불출</span>
									</div>
									<span class="form-radio" data-cid="prod_out"><input
										type="radio" value="1" data-cid="prod_out" name="prod_out__A3"
										id="field-A3-prod_out-4" data-field-key="prod_out"
										aria-label="안전재고관리"><label for="field-A3-prod_out-4"
										data-cid="prod_out">사용</label></span><span class="form-radio"
										data-cid="prod_out"><input type="radio" value="2"
										data-cid="prod_out" name="prod_out__A3"
										id="field-A3-prod_out-5" checked="" data-field-key="prod_out"
										aria-label="안전재고관리"><label for="field-A3-prod_out-5"
										data-cid="prod_out">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-prod_in">생산입고</span>
									</div>
									<span class="form-radio" data-cid="prod_in"><input
										type="radio" value="1" data-cid="prod_in" name="prod_in__A3"
										id="field-A3-prod_in-6" data-field-key="prod_in"
										aria-label="안전재고관리"><label for="field-A3-prod_in-6"
										data-cid="prod_in">사용</label></span><span class="form-radio"
										data-cid="prod_in"><input type="radio" value="2"
										data-cid="prod_in" name="prod_in__A3" id="field-A3-prod_in-7"
										checked="" data-field-key="prod_in" aria-label="안전재고관리"><label
										for="field-A3-prod_in-7" data-cid="prod_in">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-house_move">창고이동</span>
									</div>
									<span class="form-radio" data-cid="house_move"><input
										type="radio" value="1" data-cid="house_move"
										name="house_move__A3" id="field-A3-house_move-8"
										data-field-key="house_move" aria-label="안전재고관리"><label
										for="field-A3-house_move-8" data-cid="house_move">사용</label></span><span
										class="form-radio" data-cid="house_move"><input
										type="radio" value="2" data-cid="house_move"
										name="house_move__A3" id="field-A3-house_move-9" checked=""
										data-field-key="house_move" aria-label="안전재고관리"><label
										for="field-A3-house_move-9" data-cid="house_move">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-self_emp">자가사용</span>
									</div>
									<span class="form-radio" data-cid="self_emp"><input
										type="radio" value="1" data-cid="self_emp" name="self_emp__A3"
										id="field-A3-self_emp-10" data-field-key="self_emp"
										aria-label="안전재고관리"><label for="field-A3-self_emp-10"
										data-cid="self_emp">사용</label></span><span class="form-radio"
										data-cid="self_emp"><input type="radio" value="2"
										data-cid="self_emp" name="self_emp__A3"
										id="field-A3-self_emp-11" checked="" data-field-key="self_emp"
										aria-label="안전재고관리"><label for="field-A3-self_emp-11"
										data-cid="self_emp">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-remove_defect">불량처리</span>
									</div>
									<span class="form-radio" data-cid="remove_defect"><input
										type="radio" value="1" data-cid="remove_defect"
										name="remove_defect__A3" id="field-A3-remove_defect-12"
										checked="" data-field-key="remove_defect" aria-label="안전재고관리"><label
										for="field-A3-remove_defect-12" data-cid="remove_defect">사용</label></span><span
										class="form-radio" data-cid="remove_defect"><input
										type="radio" value="2" data-cid="remove_defect"
										name="remove_defect__A3" id="field-A3-remove_defect-13"
										data-field-key="remove_defect" aria-label="안전재고관리"><label
										for="field-A3-remove_defect-13" data-cid="remove_defect">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="안전재고수량">
						<div class="reference-label">안전재고수량</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="SAFE_QTY" placeholder="안전재고수량" value=""
										data-field-key="safe_qty" name="safe_qty" aria-label="안전재고수량"
										id="field-A3-safe_qty-0">
								</div>
								<div class="control  flex-none ">

									<a id="whQty" data-cid="whQty" class="" type="button"
										role="button" tabindex="0">창고별지정</a>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="C-Portal최소주문수량체크">
						<div class="reference-label">C-Portal최소주문수량체크</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<select data-field-key="CSLimitFlag" data-cid="CSLimitFlag"
										name="CSLimitFlag" aria-label="C-Portal최소주문수량체크"
										id="field-A3-CSLimitFlag-0"><option value="Y"
											selected="">사용</option>
										<option value="N">사용안함</option></select>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="C-Portal최소주문수량">
						<div class="reference-label">C-Portal최소주문수량</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="CSLimitQty" placeholder="C-Portal최소주문수량" value=""
										data-field-key="CSLimitQty" name="CSLimitQty"
										aria-label="C-Portal최소주문수량" id="field-A3-CSLimitQty-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="C-Portal최소주문단위">
						<div class="reference-label">C-Portal최소주문단위</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<select data-field-key="CSLimitUnit" data-cid="CSLimitUnit"
										name="CSLimitUnit" aria-label="C-Portal최소주문단위"
										id="field-A3-CSLimitUnit-0"><option value="Y">사용</option>
										<option value="N" selected="">사용안함</option></select>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="재고수량">
						<div class="reference-label">재고수량</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<a id="inv_adjust" data-cid="inv_adjust" class="" type="button"
										role="button" tabindex="0">입력</a>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="조달기간">
						<div class="reference-label">조달기간</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="in_term" placeholder="조달기간" value=""
										data-field-key="in_term" name="in_term" aria-label="조달기간"
										id="field-A3-in_term-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="최소구매단위">
						<div class="reference-label">최소구매단위</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="min_qty" placeholder="최소구매단위" value=""
										data-field-key="min_qty" name="min_qty" aria-label="최소구매단위"
										id="field-A3-min_qty-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="구매처">
						<div class="reference-label">구매처</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="cust" type="button" data-lookup="cust"
										aria-label="구매처 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="cust" placeholder="구매처" value=""
										data-field-key="cust" name="cust" aria-label="구매처"
										id="field-A3-cust-0"><input type="hidden"
										data-cid="cust" value="" data-field-key="custCode"
										name="custCode" aria-label="구매처" id="field-A3-custCode-1">
								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A4" data-entry-panel="A4" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="입고단가">
						<div class="reference-label">입고단가</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="in_price" placeholder="입고단가" value=""
										data-field-key="in_price" name="in_price" aria-label="입고단가"
										id="field-A4-in_price-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="in_price_vat"><input
										type="checkbox" value="1" data-cid="in_price_vat"
										name="in_price_vat" id="field-A4-in_price_vat-1" class=""
										data-field-key="in_price_vat" aria-label="입고단가"><label
										for="field-A4-in_price_vat-1" data-cid="in_price_vat" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="출고단가">
						<div class="reference-label">출고단가</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price" placeholder="출고단가" value=""
										data-field-key="price" name="price" aria-label="출고단가"
										id="field-A4-price-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price_vat"><input
										type="checkbox" value="1" data-cid="out_price_vat"
										name="out_price_vat" id="field-A4-out_price_vat-1" class=""
										data-field-key="out_price_vat" aria-label="출고단가"><label
										for="field-A4-out_price_vat-1" data-cid="out_price_vat"
										class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가A">
						<div class="reference-label">단가A</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price1" placeholder="단가A" value=""
										data-field-key="out_price1" name="out_price1" aria-label="단가A"
										id="field-A4-out_price1-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price1_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price1_vat_yn"
										name="out_price1_vat_yn" id="field-A4-out_price1_vat_yn-1"
										class="" data-field-key="out_price1_vat_yn" aria-label="단가A"><label
										for="field-A4-out_price1_vat_yn-1"
										data-cid="out_price1_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가B">
						<div class="reference-label">단가B</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price2" placeholder="단가B" value=""
										data-field-key="out_price2" name="out_price2" aria-label="단가B"
										id="field-A4-out_price2-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price2_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price2_vat_yn"
										name="out_price2_vat_yn" id="field-A4-out_price2_vat_yn-1"
										class="" data-field-key="out_price2_vat_yn" aria-label="단가B"><label
										for="field-A4-out_price2_vat_yn-1"
										data-cid="out_price2_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가C">
						<div class="reference-label">단가C</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price3" placeholder="단가C" value=""
										data-field-key="out_price3" name="out_price3" aria-label="단가C"
										id="field-A4-out_price3-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price3_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price3_vat_yn"
										name="out_price3_vat_yn" id="field-A4-out_price3_vat_yn-1"
										class="" data-field-key="out_price3_vat_yn" aria-label="단가C"><label
										for="field-A4-out_price3_vat_yn-1"
										data-cid="out_price3_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가D">
						<div class="reference-label">단가D</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price4" placeholder="단가D" value=""
										data-field-key="out_price4" name="out_price4" aria-label="단가D"
										id="field-A4-out_price4-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price4_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price4_vat_yn"
										name="out_price4_vat_yn" id="field-A4-out_price4_vat_yn-1"
										class="" data-field-key="out_price4_vat_yn" aria-label="단가D"><label
										for="field-A4-out_price4_vat_yn-1"
										data-cid="out_price4_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가E">
						<div class="reference-label">단가E</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price5" placeholder="단가E" value=""
										data-field-key="out_price5" name="out_price5" aria-label="단가E"
										id="field-A4-out_price5-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price5_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price5_vat_yn"
										name="out_price5_vat_yn" id="field-A4-out_price5_vat_yn-1"
										class="" data-field-key="out_price5_vat_yn" aria-label="단가E"><label
										for="field-A4-out_price5_vat_yn-1"
										data-cid="out_price5_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가F">
						<div class="reference-label">단가F</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price6" placeholder="단가F" value=""
										data-field-key="out_price6" name="out_price6" aria-label="단가F"
										id="field-A4-out_price6-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price6_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price6_vat_yn"
										name="out_price6_vat_yn" id="field-A4-out_price6_vat_yn-1"
										class="" data-field-key="out_price6_vat_yn" aria-label="단가F"><label
										for="field-A4-out_price6_vat_yn-1"
										data-cid="out_price6_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가G">
						<div class="reference-label">단가G</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price7" placeholder="단가G" value=""
										data-field-key="out_price7" name="out_price7" aria-label="단가G"
										id="field-A4-out_price7-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price7_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price7_vat_yn"
										name="out_price7_vat_yn" id="field-A4-out_price7_vat_yn-1"
										class="" data-field-key="out_price7_vat_yn" aria-label="단가G"><label
										for="field-A4-out_price7_vat_yn-1"
										data-cid="out_price7_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가H">
						<div class="reference-label">단가H</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price8" placeholder="단가H" value=""
										data-field-key="out_price8" name="out_price8" aria-label="단가H"
										id="field-A4-out_price8-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price8_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price8_vat_yn"
										name="out_price8_vat_yn" id="field-A4-out_price8_vat_yn-1"
										class="" data-field-key="out_price8_vat_yn" aria-label="단가H"><label
										for="field-A4-out_price8_vat_yn-1"
										data-cid="out_price8_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가I">
						<div class="reference-label">단가I</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price9" placeholder="단가I" value=""
										data-field-key="out_price9" name="out_price9" aria-label="단가I"
										id="field-A4-out_price9-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price9_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price9_vat_yn"
										name="out_price9_vat_yn" id="field-A4-out_price9_vat_yn-1"
										class="" data-field-key="out_price9_vat_yn" aria-label="단가I"><label
										for="field-A4-out_price9_vat_yn-1"
										data-cid="out_price9_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="단가J">
						<div class="reference-label">단가J</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_price10" placeholder="단가J" value=""
										data-field-key="out_price10" name="out_price10"
										aria-label="단가J" id="field-A4-out_price10-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="out_price10_vat_yn"><input
										type="checkbox" value="1" data-cid="out_price10_vat_yn"
										name="out_price10_vat_yn" id="field-A4-out_price10_vat_yn-1"
										class="" data-field-key="out_price10_vat_yn" aria-label="단가J"><label
										for="field-A4-out_price10_vat_yn-1"
										data-cid="out_price10_vat_yn" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A5" data-entry-panel="A5" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="외주비단가">
						<div class="reference-label">외주비단가</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="outside_price" placeholder="외주비단가" value=""
										data-field-key="outside_price" name="outside_price"
										aria-label="외주비단가" id="field-A5-outside_price-0">
								</div>
								<div class="control  flex-none ">

									<span class="form-checkbox" data-cid="outside_price_vat"><input
										type="checkbox" value="1" data-cid="outside_price_vat"
										name="outside_price_vat" id="field-A5-outside_price_vat-1"
										class="" data-field-key="outside_price_vat" aria-label="외주비단가"><label
										for="field-A5-outside_price_vat-1"
										data-cid="outside_price_vat" class="">VAT포함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="표준노무시간(노무비가중치)">
						<div class="reference-label">표준노무시간(노무비가중치)</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="labor_weight" placeholder="표준노무시간(노무비가중치)" value="1"
										data-field-key="labor_weight" name="labor_weight"
										aria-label="표준노무시간(노무비가중치)" id="field-A5-labor_weight-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="경비가중치">
						<div class="reference-label">경비가중치</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="expenses_weight" placeholder="경비가중치" value="1"
										data-field-key="expenses_weight" name="expenses_weight"
										aria-label="경비가중치" id="field-A5-expenses_weight-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="재료비표준원가">
						<div class="reference-label">재료비표준원가</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="material_cost" placeholder="재료비표준원가" value=""
										data-field-key="material_cost" name="material_cost"
										aria-label="재료비표준원가" id="field-A5-material_cost-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="경비표준원가">
						<div class="reference-label">경비표준원가</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="expense_cost" placeholder="경비표준원가" readonly=""
										value="0" data-field-key="expense_cost" name="expense_cost"
										aria-label="경비표준원가" id="field-A5-expense_cost-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="노무비표준원가">
						<div class="reference-label">노무비표준원가</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="labor_cost" placeholder="노무비표준원가" readonly=""
										value="0" data-field-key="labor_cost" name="labor_cost"
										aria-label="노무비표준원가" id="field-A5-labor_cost-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="외주비표준원가">
						<div class="reference-label">외주비표준원가</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="out_cost" placeholder="외주비표준원가" readonly=""
										value="0" data-field-key="out_cost" name="out_cost"
										aria-label="외주비표준원가" id="field-A5-out_cost-0">
								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A6" data-entry-panel="A6" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="문자형추가항목1">
						<div class="reference-label">문자형추가항목1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont1" placeholder="문자형추가항목1" value=""
										data-field-key="cont1" name="cont1" aria-label="문자형추가항목1"
										id="field-A6-cont1-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="문자형추가항목2">
						<div class="reference-label">문자형추가항목2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont2" placeholder="문자형추가항목2" value=""
										data-field-key="cont2" name="cont2" aria-label="문자형추가항목2"
										id="field-A6-cont2-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="문자형추가항목3">
						<div class="reference-label">문자형추가항목3</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont3" placeholder="문자형추가항목3" value=""
										data-field-key="cont3" name="cont3" aria-label="문자형추가항목3"
										id="field-A6-cont3-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="문자형추가항목4">
						<div class="reference-label">문자형추가항목4</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont4" placeholder="문자형추가항목4" value=""
										data-field-key="cont4" name="cont4" aria-label="문자형추가항목4"
										id="field-A6-cont4-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="문자형추가항목5">
						<div class="reference-label">문자형추가항목5</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont5" placeholder="문자형추가항목5" value=""
										data-field-key="cont5" name="cont5" aria-label="문자형추가항목5"
										id="field-A6-cont5-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="문자형추가항목6">
						<div class="reference-label">문자형추가항목6</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont6" placeholder="문자형추가항목6" value=""
										data-field-key="cont6" name="cont6" aria-label="문자형추가항목6"
										id="field-A6-cont6-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목1">
						<div class="reference-label">숫자형추가항목1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user1" placeholder="숫자형추가항목1" value=""
										data-field-key="no_user1" name="no_user1"
										aria-label="숫자형추가항목1" id="field-A6-no_user1-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목2">
						<div class="reference-label">숫자형추가항목2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user2" placeholder="숫자형추가항목2" value=""
										data-field-key="no_user2" name="no_user2"
										aria-label="숫자형추가항목2" id="field-A6-no_user2-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목3">
						<div class="reference-label">숫자형추가항목3</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user3" placeholder="숫자형추가항목3" value=""
										data-field-key="no_user3" name="no_user3"
										aria-label="숫자형추가항목3" id="field-A6-no_user3-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목4">
						<div class="reference-label">숫자형추가항목4</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user4" placeholder="숫자형추가항목4" value=""
										data-field-key="no_user4" name="no_user4"
										aria-label="숫자형추가항목4" id="field-A6-no_user4-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목5">
						<div class="reference-label">숫자형추가항목5</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user5" placeholder="숫자형추가항목5" value=""
										data-field-key="no_user5" name="no_user5"
										aria-label="숫자형추가항목5" id="field-A6-no_user5-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목6">
						<div class="reference-label">숫자형추가항목6</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user6" placeholder="숫자형추가항목6" value=""
										data-field-key="no_user6" name="no_user6"
										aria-label="숫자형추가항목6" id="field-A6-no_user6-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목7">
						<div class="reference-label">숫자형추가항목7</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user7" placeholder="숫자형추가항목7" value=""
										data-field-key="no_user7" name="no_user7"
										aria-label="숫자형추가항목7" id="field-A6-no_user7-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목8">
						<div class="reference-label">숫자형추가항목8</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user8" placeholder="숫자형추가항목8" value=""
										data-field-key="no_user8" name="no_user8"
										aria-label="숫자형추가항목8" id="field-A6-no_user8-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목9">
						<div class="reference-label">숫자형추가항목9</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user9" placeholder="숫자형추가항목9" value=""
										data-field-key="no_user9" name="no_user9"
										aria-label="숫자형추가항목9" id="field-A6-no_user9-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="숫자형추가항목10">
						<div class="reference-label">숫자형추가항목10</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="no_user10" placeholder="숫자형추가항목10" value=""
										data-field-key="no_user10" name="no_user10"
										aria-label="숫자형추가항목10" id="field-A6-no_user10-0">
								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A7" data-entry-panel="A7" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="관리항목">
						<div class="reference-label">관리항목</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="item_type"><input
										type="radio" value="B" data-cid="item_type"
										name="item_type__A7" id="field-A7-item_type-0" checked=""
										data-field-key="item_type" aria-label="관리항목"><label
										for="field-A7-item_type-0" data-cid="item_type">기본설정(선택입력)</label></span><span
										class="form-radio" data-cid="item_type"><input
										type="radio" value="M" data-cid="item_type"
										name="item_type__A7" id="field-A7-item_type-1"
										data-field-key="item_type" aria-label="관리항목"><label
										for="field-A7-item_type-1" data-cid="item_type">필수입력</label></span><span
										class="form-radio" data-cid="item_type"><input
										type="radio" value="Y" data-cid="item_type"
										name="item_type__A7" id="field-A7-item_type-2"
										data-field-key="item_type" aria-label="관리항목"><label
										for="field-A7-item_type-2" data-cid="item_type">선택입력</label></span><span
										class="form-radio" data-cid="item_type"><input
										type="radio" value="N" data-cid="item_type"
										name="item_type__A7" id="field-A7-item_type-3"
										data-field-key="item_type" aria-label="관리항목"><label
										for="field-A7-item_type-3" data-cid="item_type">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="시리얼/로트No.">
						<div class="reference-label">시리얼/로트No.</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="serial_type"><input
										type="radio" value="B" data-cid="serial_type"
										name="serial_type__A7" id="field-A7-serial_type-0" checked=""
										data-field-key="serial_type" aria-label="시리얼/로트No."><label
										for="field-A7-serial_type-0" data-cid="serial_type">기본설정(선택입력)</label></span><span
										class="form-radio" data-cid="serial_type"><input
										type="radio" value="M" data-cid="serial_type"
										name="serial_type__A7" id="field-A7-serial_type-1"
										data-field-key="serial_type" aria-label="시리얼/로트No."><label
										for="field-A7-serial_type-1" data-cid="serial_type">필수입력</label></span><span
										class="form-radio" data-cid="serial_type"><input
										type="radio" value="Y" data-cid="serial_type"
										name="serial_type__A7" id="field-A7-serial_type-2"
										data-field-key="serial_type" aria-label="시리얼/로트No."><label
										for="field-A7-serial_type-2" data-cid="serial_type">선택입력</label></span><span
										class="form-radio" data-cid="serial_type"><input
										type="radio" value="N" data-cid="serial_type"
										name="serial_type__A7" id="field-A7-serial_type-3"
										data-field-key="serial_type" aria-label="시리얼/로트No."><label
										for="field-A7-serial_type-3" data-cid="serial_type">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="생산전표생성대상">
						<div class="reference-label">생산전표생성대상</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-PROD_SELL_TYPE">판매</span>
									</div>
									<span class="form-radio" data-cid="PROD_SELL_TYPE"><input
										type="radio" value="B" data-cid="PROD_SELL_TYPE"
										name="PROD_SELL_TYPE__A7" id="field-A7-PROD_SELL_TYPE-0"
										checked="" data-field-key="PROD_SELL_TYPE"
										aria-label="생산전표생성대상"><label
										for="field-A7-PROD_SELL_TYPE-0" data-cid="PROD_SELL_TYPE">기본설정(사용안함)</label></span><span
										class="form-radio" data-cid="PROD_SELL_TYPE"><input
										type="radio" value="Y" data-cid="PROD_SELL_TYPE"
										name="PROD_SELL_TYPE__A7" id="field-A7-PROD_SELL_TYPE-1"
										data-field-key="PROD_SELL_TYPE" aria-label="생산전표생성대상"><label
										for="field-A7-PROD_SELL_TYPE-1" data-cid="PROD_SELL_TYPE">사용</label></span><span
										class="form-radio" data-cid="PROD_SELL_TYPE"><input
										type="radio" value="N" data-cid="PROD_SELL_TYPE"
										name="PROD_SELL_TYPE__A7" id="field-A7-PROD_SELL_TYPE-2"
										data-field-key="PROD_SELL_TYPE" aria-label="생산전표생성대상"><label
										for="field-A7-PROD_SELL_TYPE-2" data-cid="PROD_SELL_TYPE">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-PROD_WHMOVE_TYPE">창고이동</span>
									</div>
									<span class="form-radio" data-cid="PROD_WHMOVE_TYPE"><input
										type="radio" value="B" data-cid="PROD_WHMOVE_TYPE"
										name="PROD_WHMOVE_TYPE__A7" id="field-A7-PROD_WHMOVE_TYPE-3"
										checked="" data-field-key="PROD_WHMOVE_TYPE"
										aria-label="생산전표생성대상"><label
										for="field-A7-PROD_WHMOVE_TYPE-3" data-cid="PROD_WHMOVE_TYPE">기본설정(사용안함)</label></span><span
										class="form-radio" data-cid="PROD_WHMOVE_TYPE"><input
										type="radio" value="Y" data-cid="PROD_WHMOVE_TYPE"
										name="PROD_WHMOVE_TYPE__A7" id="field-A7-PROD_WHMOVE_TYPE-4"
										data-field-key="PROD_WHMOVE_TYPE" aria-label="생산전표생성대상"><label
										for="field-A7-PROD_WHMOVE_TYPE-4" data-cid="PROD_WHMOVE_TYPE">사용</label></span><span
										class="form-radio" data-cid="PROD_WHMOVE_TYPE"><input
										type="radio" value="N" data-cid="PROD_WHMOVE_TYPE"
										name="PROD_WHMOVE_TYPE__A7" id="field-A7-PROD_WHMOVE_TYPE-5"
										data-field-key="PROD_WHMOVE_TYPE" aria-label="생산전표생성대상"><label
										for="field-A7-PROD_WHMOVE_TYPE-5" data-cid="PROD_WHMOVE_TYPE">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="품질검사요청대상">
						<div class="reference-label">품질검사요청대상</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-QC_BUY_TYPE">구매</span>
									</div>
									<span class="form-radio" data-cid="QC_BUY_TYPE"><input
										type="radio" value="B" data-cid="QC_BUY_TYPE"
										name="QC_BUY_TYPE__A7" id="field-A7-QC_BUY_TYPE-0" checked=""
										data-field-key="QC_BUY_TYPE" aria-label="품질검사요청대상"><label
										for="field-A7-QC_BUY_TYPE-0" data-cid="QC_BUY_TYPE">기본설정</label></span><span
										class="form-radio" data-cid="QC_BUY_TYPE"><input
										type="radio" value="Y" data-cid="QC_BUY_TYPE"
										name="QC_BUY_TYPE__A7" id="field-A7-QC_BUY_TYPE-1"
										data-field-key="QC_BUY_TYPE" aria-label="품질검사요청대상"><label
										for="field-A7-QC_BUY_TYPE-1" data-cid="QC_BUY_TYPE">사용</label></span><span
										class="form-radio" data-cid="QC_BUY_TYPE"><input
										type="radio" value="N" data-cid="QC_BUY_TYPE"
										name="QC_BUY_TYPE__A7" id="field-A7-QC_BUY_TYPE-2"
										data-field-key="QC_BUY_TYPE" aria-label="품질검사요청대상"><label
										for="field-A7-QC_BUY_TYPE-2" data-cid="QC_BUY_TYPE">사용안함</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control   ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-qc_ynQC_YN">생산입고</span>
									</div>
									<span class="form-radio" data-cid="qc_ynQC_YN"><input
										type="radio" value="B" data-cid="qc_ynQC_YN"
										name="qc_ynQC_YN__A7" id="field-A7-qc_ynQC_YN-3" checked=""
										data-field-key="qc_ynQC_YN" aria-label="품질검사요청대상"><label
										for="field-A7-qc_ynQC_YN-3" data-cid="qc_ynQC_YN">기본설정</label></span><span
										class="form-radio" data-cid="qc_ynQC_YN"><input
										type="radio" value="Y" data-cid="qc_ynQC_YN"
										name="qc_ynQC_YN__A7" id="field-A7-qc_ynQC_YN-4"
										data-field-key="qc_ynQC_YN" aria-label="품질검사요청대상"><label
										for="field-A7-qc_ynQC_YN-4" data-cid="qc_ynQC_YN">사용</label></span><span
										class="form-radio" data-cid="qc_ynQC_YN"><input
										type="radio" value="N" data-cid="qc_ynQC_YN"
										name="qc_ynQC_YN__A7" id="field-A7-qc_ynQC_YN-5"
										data-field-key="qc_ynQC_YN" aria-label="품질검사요청대상"><label
										for="field-A7-qc_ynQC_YN-5" data-cid="qc_ynQC_YN">사용안함</label></span>
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
