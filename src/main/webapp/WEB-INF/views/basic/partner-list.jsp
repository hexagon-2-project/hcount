<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>거래처리스트</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="basic/partner-list" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>거래처리스트</h1>
				</header>
				<section class="screen-content simple-page">
					
					<form class="simple-search" method="get"
						action="${pageContext.request.contextPath}/basic/partner-list">
						<input type="search" name="q" id="searchInput"
							placeholder="검색어 입력" aria-label="거래처리스트 검색">
						<button type="submit" class="primary-button">검색(F3)</button>
					</form>
					<div class="table-scroll">
						<table class="list-table">
							<thead>
								<tr>
									<th class="selection-column"><input type="checkbox"
										class="list-row-select" id="selectAllRows" aria-label="전체 선택"></th>
									<th>거래처코드</th>
									<th>상호(이름)</th>
									<th>사업자등록번호</th>
									<th>대표자</th>
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
						<button type="button" data-list-action="integration">관계설정</button>
						<button type="button" data-list-action="integration">계층그룹</button>
						<button type="button" data-list-action="edit">변경</button>
						<button type="button" data-list-action="active">사용중단/재사용</button>
						<button type="button" data-list-action="export">Excel</button>
						<button type="button" data-list-action="integration">웹자료올리기</button>
						<button type="button" data-list-action="integration">SMS</button>
					</div>
				</section>
			</main>
		</div>
		<dialog id="entryDialog" class="simple-dialog reference-dialog"
			aria-labelledby="entryTitle">
		<form id="entryForm" novalidate>
			<h2 id="entryTitle">거래처등록</h2>
			<div class="reference-fields">
				<div class="master-entry-tabs" role="tablist">
					<button type="button" role="tab" data-entry-tab="A1"
						aria-controls="panel-A1" aria-selected="true" class="active">기본</button>
					<button type="button" role="tab" data-entry-tab="A2"
						aria-controls="panel-A2" aria-selected="false" class="">거래처정보</button>
					<button type="button" role="tab" data-entry-tab="A3"
						aria-controls="panel-A3" aria-selected="false" class="">여신/단가</button>
					<button type="button" role="tab" data-entry-tab="A4"
						aria-controls="panel-A4" aria-selected="false" class="">부가정보</button>
				</div>
				<div class="reference-row" data-reference-label="거래처코드">
					<div class="reference-label">거래처코드</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<input type="text" class="form-control form-control first-child"
									data-cid="business_no" placeholder="거래처코드" value="10001"
									data-field-key="code" name="code" aria-label="거래처코드"
									id="field-common-code-0">
								<button type="button"
									class="btn btn-default btn-fn dropdown-toggle fn last-child"
									data-cid="business_no" data-auto-code="code">Fn</button>
							</div>
						</div>
					</div>
				</div>
				<section id="panel-A1" data-entry-panel="A1" role="tabpanel">
					<div class="reference-row" data-reference-label="상호(이름)">
						<div class="reference-label">상호(이름)</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cust_name" placeholder="상호(이름)" value=""
										data-field-key="name" name="name" aria-label="상호(이름)"
										id="field-A1-name-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="cust_name" data-auto-code="name">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처코드구분">
						<div class="reference-label">거래처코드구분</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="g_gubun"><input
										type="radio" value="01" data-cid="g_gubun" name="g_gubun__A1"
										id="field-A1-g_gubun-0" checked="" data-field-key="g_gubun"
										aria-label="거래처코드구분"><label for="field-A1-g_gubun-0"
										data-cid="g_gubun">사업자등록번호</label></span><span class="form-radio"
										data-cid="g_gubun"><input type="radio" value="02"
										data-cid="g_gubun" name="g_gubun__A1" id="field-A1-g_gubun-1"
										data-field-key="g_gubun" aria-label="거래처코드구분"><label
										for="field-A1-g_gubun-1" data-cid="g_gubun">비사업자(내국인)</label></span><span
										class="form-radio" data-cid="g_gubun"><input
										type="radio" value="03" data-cid="g_gubun" name="g_gubun__A1"
										id="field-A1-g_gubun-2" data-field-key="g_gubun"
										aria-label="거래처코드구분"><label for="field-A1-g_gubun-2"
										data-cid="g_gubun">비사업자(외국인)</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="대표자명">
						<div class="reference-label">대표자명</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="boss_name" placeholder="대표자명" value=""
										data-field-key="representative" name="representative"
										aria-label="대표자명" id="field-A1-representative-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="업태">
						<div class="reference-label">업태</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="uptae" placeholder="업태" value=""
										data-field-key="uptae" name="uptae" aria-label="업태"
										id="field-A1-uptae-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="종목">
						<div class="reference-label">종목</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="jongmok" placeholder="종목" value=""
										data-field-key="jongmok" name="jongmok" aria-label="종목"
										id="field-A1-jongmok-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="전화">
						<div class="reference-label">전화</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="tel" placeholder="전화" value=""
										data-field-key="phone" name="phone" aria-label="전화"
										id="field-A1-phone-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="tel" data-auto-code="phone">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="Fax">
						<div class="reference-label">Fax</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="fax" placeholder="Fax" value="" data-field-key="fax"
										name="fax" aria-label="Fax" id="field-A1-fax-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="fax" data-auto-code="fax">Fn</button>
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
										aria-label="검색창내용" id="field-A1-remarks_win-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="모바일">
						<div class="reference-label">모바일</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="hp_no" placeholder="모바일" value=""
										data-field-key="hp_no" name="hp_no" aria-label="모바일"
										id="field-A1-hp_no-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="hp_no" data-auto-code="hp_no">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="주소1 우편번호">
						<div class="reference-label">주소1 우편번호</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control  flex-none ">

									<a id="post_noaddrLink" data-cid="post_noaddrLink" class=""
										type="button" role="button" tabindex="0" data-address="true">주소검색</a>
								</div>
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="post_no_postNo" placeholder="주소1 우편번호" maxlength="8"
										value="" data-field-key="post_no" name="post_no"
										aria-label="주소1 우편번호" id="field-A1-post_no-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="post_no_postNo" data-auto-code="post_no">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="주소1">
						<div class="reference-label">주소1</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<textarea rows="2" class="form-control first-child last-child"
										data-cid="address_areaAddr" wrap="hard" placeholder="주소1"
										data-field-key="address" name="address" aria-label="주소1"
										id="field-A1-address-0"></textarea>
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="address_areaAddr" data-auto-code="address">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="6개의 추가항목생성가능">
						<div class="reference-label">6개의 추가항목생성가능</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont1" placeholder="6개의 추가항목생성가능" value=""
										data-field-key="cont1" name="cont1" aria-label="6개의 추가항목생성가능"
										id="field-A1-cont1-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="홈페이지">
						<div class="reference-label">홈페이지</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="url_path" placeholder="홈페이지" value=""
										data-field-key="url_path" name="url_path" aria-label="홈페이지"
										id="field-A1-url_path-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="담당자">
						<div class="reference-label">담당자</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="emp_cd" type="button" data-lookup="staff"
										aria-label="담당자 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="emp_cd" placeholder="담당자" value=""
										data-field-key="staff" name="staff" aria-label="담당자"
										id="field-A1-staff-0"><input type="hidden"
										data-cid="emp_cd" value="" data-field-key="staffCode"
										name="staffCode" aria-label="담당자" id="field-A1-staffCode-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="Email">
						<div class="reference-label">Email</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="email" placeholder="Email" value=""
										data-field-key="email" name="email" aria-label="Email"
										id="field-A1-email-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="email" data-auto-code="email">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처그룹1">
						<div class="reference-label">거래처그룹1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="cust_group1" type="button" data-lookup="cust_group1"
										aria-label="거래처그룹1 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="cust_group1" placeholder="거래처그룹1" value=""
										data-field-key="cust_group1" name="cust_group1"
										aria-label="거래처그룹1" id="field-A1-cust_group1-0"><input
										type="hidden" data-cid="cust_group1" value=""
										data-field-key="cust_group1Code" name="cust_group1Code"
										aria-label="거래처그룹1" id="field-A1-cust_group1Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처그룹2">
						<div class="reference-label">거래처그룹2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="cust_group2" type="button" data-lookup="cust_group2"
										aria-label="거래처그룹2 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="cust_group2" placeholder="거래처그룹2" value=""
										data-field-key="cust_group2" name="cust_group2"
										aria-label="거래처그룹2" id="field-A1-cust_group2-0"><input
										type="hidden" data-cid="cust_group2" value=""
										data-field-key="cust_group2Code" name="cust_group2Code"
										aria-label="거래처그룹2" id="field-A1-cust_group2Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처계층그룹">
						<div class="reference-label">거래처계층그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   " data-cid="custlevelgroupdata">
									<a data-cid="custlevelgroupdata" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="custlevelgroupdata" type="button"
										data-lookup="custlevelgroupdata" aria-label="거래처계층그룹 검색">⌕</button>
									<div class="tags-input last-child"
										data-cid="custlevelgroupdata">
										<div class="input-height-fixed" data-cid="custlevelgroupdata">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="custlevelgroupdata" placeholder="거래처계층그룹"
																value="" data-field-key="custlevelgroupdata"
																name="custlevelgroupdata" aria-label="거래처계층그룹"
																id="field-A1-custlevelgroupdata-0">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="custlevelgroupdata" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A2" data-entry-panel="A2" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="상호(이름)">
						<div class="reference-label">상호(이름)</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cust_name" placeholder="상호(이름)" value=""
										data-field-key="name" name="name" aria-label="상호(이름)"
										id="field-A2-name-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="cust_name" data-auto-code="name">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처코드구분">
						<div class="reference-label">거래처코드구분</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="g_gubun"><input
										type="radio" value="01" data-cid="g_gubun" name="g_gubun__A2"
										id="field-A2-g_gubun-0" checked="" data-field-key="g_gubun"
										aria-label="거래처코드구분"><label for="field-A2-g_gubun-0"
										data-cid="g_gubun">사업자등록번호</label></span><span class="form-radio"
										data-cid="g_gubun"><input type="radio" value="02"
										data-cid="g_gubun" name="g_gubun__A2" id="field-A2-g_gubun-1"
										data-field-key="g_gubun" aria-label="거래처코드구분"><label
										for="field-A2-g_gubun-1" data-cid="g_gubun">비사업자(내국인)</label></span><span
										class="form-radio" data-cid="g_gubun"><input
										type="radio" value="03" data-cid="g_gubun" name="g_gubun__A2"
										id="field-A2-g_gubun-2" data-field-key="g_gubun"
										aria-label="거래처코드구분"><label for="field-A2-g_gubun-2"
										data-cid="g_gubun">비사업자(외국인)</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="세무신고거래처">
						<div class="reference-label">세무신고거래처</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="g_business_businessType"><input
										type="radio" value="1" data-cid="g_business_businessType"
										name="g_business_businessType__A2"
										id="field-A2-g_business_businessType-0" checked=""
										data-field-key="g_business_businessType" aria-label="세무신고거래처"><label
										for="field-A2-g_business_businessType-0"
										data-cid="g_business_businessType">거래처코드동일</label></span><span
										class="form-radio" data-cid="g_business_businessType"><input
										type="radio" value="2" data-cid="g_business_businessType"
										name="g_business_businessType__A2"
										id="field-A2-g_business_businessType-1"
										data-field-key="g_business_businessType" aria-label="세무신고거래처"><label
										for="field-A2-g_business_businessType-1"
										data-cid="g_business_businessType">검색입력</label></span><span
										class="form-radio" data-cid="g_business_businessType"><input
										type="radio" value="3" data-cid="g_business_businessType"
										name="g_business_businessType__A2"
										id="field-A2-g_business_businessType-2"
										data-field-key="g_business_businessType" aria-label="세무신고거래처"><label
										for="field-A2-g_business_businessType-2"
										data-cid="g_business_businessType">직접입력</label></span>
								</div>
							</div>
							<div class="control-set">
								<div class="control">

									<input type="text"
										class="form-control form-control first-child"
										data-cid="g_business_" placeholder="세무신고거래처" readonly=""
										value="10001" data-field-key="g_business" name="g_business"
										aria-label="세무신고거래처" id="field-A2-g_business-3">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn last-child"
										data-cid="g_business_" data-auto-code="g_business">Fn</button>
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control  {{style.css}} hidden">
									<input type="text"
										class="noneEvent form-control form-control-code first-child"
										data-cid="g_business_chkCust" placeholder="" value=""
										data-field-key="g_business_chkCust" name="g_business_chkCust"
										aria-label="세무신고거래처" id="field-A2-g_business_chkCust-4">
									<button class="btn btn-default btn-code-search"
										data-cid="g_business_chkCust" type="button"
										data-lookup="g_business" aria-label="세무신고거래처 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="g_business_chkCust" placeholder="" readonly=""
										value="" data-field-key="g_business_chkCust_1"
										name="g_business_chkCust_1" aria-label="세무신고거래처"
										id="field-A2-g_business_chkCust_1-5">
								</div>
							</div>
							<div class="control-set  hidden">
								<div class="control   hidden">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="g_business_DIRECT_INPUT" placeholder="" value=""
										data-field-key="g_business_DIRECT_INPUT"
										name="g_business_DIRECT_INPUT" aria-label="세무신고거래처"
										id="field-A2-g_business_DIRECT_INPUT-6">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="g_business_DIRECT_INPUT" data-auto-code="g_business">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="종사업장번호">
						<div class="reference-label">종사업장번호</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="tax_reg_id" placeholder="종사업장번호" value=""
										data-field-key="tax_reg_id" name="tax_reg_id"
										aria-label="종사업장번호" id="field-A2-tax_reg_id-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="대표자명">
						<div class="reference-label">대표자명</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="boss_name" placeholder="대표자명" value=""
										data-field-key="representative" name="representative"
										aria-label="대표자명" id="field-A2-representative-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="업태">
						<div class="reference-label">업태</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="uptae" placeholder="업태" value=""
										data-field-key="uptae" name="uptae" aria-label="업태"
										id="field-A2-uptae-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="종목">
						<div class="reference-label">종목</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="jongmok" placeholder="종목" value=""
										data-field-key="jongmok" name="jongmok" aria-label="종목"
										id="field-A2-jongmok-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="전화">
						<div class="reference-label">전화</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="tel" placeholder="전화" value=""
										data-field-key="phone" name="phone" aria-label="전화"
										id="field-A2-phone-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="tel" data-auto-code="phone">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="Fax">
						<div class="reference-label">Fax</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="fax" placeholder="Fax" value="" data-field-key="fax"
										name="fax" aria-label="Fax" id="field-A2-fax-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="fax" data-auto-code="fax">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="Email">
						<div class="reference-label">Email</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="email" placeholder="Email" value=""
										data-field-key="email" name="email" aria-label="Email"
										id="field-A2-email-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="email" data-auto-code="email">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="모바일">
						<div class="reference-label">모바일</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="hp_no" placeholder="모바일" value=""
										data-field-key="hp_no" name="hp_no" aria-label="모바일"
										id="field-A2-hp_no-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="hp_no" data-auto-code="hp_no">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="주소1 우편번호">
						<div class="reference-label">주소1 우편번호</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control  flex-none ">

									<a id="post_noaddrLink" data-cid="post_noaddrLink" class=""
										type="button" role="button" tabindex="0" data-address="true">주소검색</a>
								</div>
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="post_no_postNo" placeholder="주소1 우편번호" maxlength="8"
										value="" data-field-key="post_no" name="post_no"
										aria-label="주소1 우편번호" id="field-A2-post_no-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="post_no_postNo" data-auto-code="post_no">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="주소1">
						<div class="reference-label">주소1</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<textarea rows="2" class="form-control first-child last-child"
										data-cid="address_areaAddr" wrap="hard" placeholder="주소1"
										data-field-key="address" name="address" aria-label="주소1"
										id="field-A2-address-0"></textarea>
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="address_areaAddr" data-auto-code="address">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="주소2 우편번호">
						<div class="reference-label">주소2 우편번호</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control  flex-none ">

									<a id="dm_postaddrLink" data-cid="dm_postaddrLink" class=""
										type="button" role="button" tabindex="0" data-address="true">주소검색</a>
								</div>
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="dm_post_postNo" placeholder="주소2 우편번호" maxlength="8"
										value="" data-field-key="dm_post" name="dm_post"
										aria-label="주소2 우편번호" id="field-A2-dm_post-0">
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="dm_post_postNo" data-auto-code="dm_post">Fn</button>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="주소2">
						<div class="reference-label">주소2</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<textarea rows="2" class="form-control first-child last-child"
										data-cid="dm_address_areaAddr" wrap="hard" placeholder="주소2"
										data-field-key="dm_address" name="dm_address" aria-label="주소2"
										id="field-A2-dm_address-0"></textarea>
									<button type="button"
										class="btn btn-default btn-fn dropdown-toggle fn  hidden"
										data-cid="dm_address_areaAddr" data-auto-code="dm_address">Fn</button>
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
					<div class="reference-row" data-reference-label="업종별구분">
						<div class="reference-label">업종별구분</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="gubun"><input
										type="radio" value="11" data-cid="gubun" name="gubun__A2"
										id="field-A2-gubun-0" checked="" data-field-key="gubun"
										aria-label="업종별구분"><label for="field-A2-gubun-0"
										data-cid="gubun">일반</label></span><span class="form-radio"
										data-cid="gubun"><input type="radio" value="13"
										data-cid="gubun" name="gubun__A2" id="field-A2-gubun-1"
										data-field-key="gubun" aria-label="업종별구분"><label
										for="field-A2-gubun-1" data-cid="gubun">관세사</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="통화">
						<div class="reference-label">통화</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<select data-field-key="currency" data-cid="foreign_flag"
										name="currency" aria-label="통화" id="field-A2-currency-0"><option
											value="-1∬-1" selected="">내자</option>
										<option value="1∬100">달러 [100]</option>
										<option value="1∬400">엔화 [400]</option>
										<option value="1∬300">위안 [300]</option>
										<option value="1∬00001">유로 [00001]</option>
										<option value="1∬200">유로 [200]</option>
										<option value="1∬500">직접 등록가능 [500]</option></select>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="파일관리">
						<div class="reference-label">파일관리</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<a id="filecnt" data-cid="filecnt" class="" type="button"
										role="button" tabindex="0">파일관리</a>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처그룹1">
						<div class="reference-label">거래처그룹1</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="cust_group1" type="button" data-lookup="cust_group1"
										aria-label="거래처그룹1 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="cust_group1" placeholder="거래처그룹1" value=""
										data-field-key="cust_group1" name="cust_group1"
										aria-label="거래처그룹1" id="field-A2-cust_group1-0"><input
										type="hidden" data-cid="cust_group1" value=""
										data-field-key="cust_group1Code" name="cust_group1Code"
										aria-label="거래처그룹1" id="field-A2-cust_group1Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처그룹2">
						<div class="reference-label">거래처그룹2</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="cust_group2" type="button" data-lookup="cust_group2"
										aria-label="거래처그룹2 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="cust_group2" placeholder="거래처그룹2" value=""
										data-field-key="cust_group2" name="cust_group2"
										aria-label="거래처그룹2" id="field-A2-cust_group2-0"><input
										type="hidden" data-cid="cust_group2" value=""
										data-field-key="cust_group2Code" name="cust_group2Code"
										aria-label="거래처그룹2" id="field-A2-cust_group2Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="홈페이지">
						<div class="reference-label">홈페이지</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="url_path" placeholder="홈페이지" value=""
										data-field-key="url_path" name="url_path" aria-label="홈페이지"
										id="field-A2-url_path-0">
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
					<div class="reference-row" data-reference-label="출하대상거래처">
						<div class="reference-label">출하대상거래처</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<span class="form-radio" data-cid="outorder_yn"><input
										type="radio" value="Y" data-cid="outorder_yn"
										name="outorder_yn__A2" id="field-A2-outorder_yn-0"
										data-field-key="outorder_yn" aria-label="출하대상거래처"><label
										for="field-A2-outorder_yn-0" data-cid="outorder_yn">사용</label></span><span
										class="form-radio" data-cid="outorder_yn"><input
										type="radio" value="N" data-cid="outorder_yn"
										name="outorder_yn__A2" id="field-A2-outorder_yn-1" checked=""
										data-field-key="outorder_yn" aria-label="출하대상거래처"><label
										for="field-A2-outorder_yn-1" data-cid="outorder_yn">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래유형(영업)">
						<div class="reference-label">거래유형(영업)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="io_code_sl_ioCodeBaseYn"><input
										type="radio" value="Y" data-cid="io_code_sl_ioCodeBaseYn"
										name="io_code_sl_ioCodeBaseYn__A2"
										id="field-A2-io_code_sl_ioCodeBaseYn-0" checked=""
										data-field-key="io_code_sl_ioCodeBaseYn" aria-label="거래유형(영업)"><label
										for="field-A2-io_code_sl_ioCodeBaseYn-0"
										data-cid="io_code_sl_ioCodeBaseYn">기본설정</label></span><span
										class="form-radio" data-cid="io_code_sl_ioCodeBaseYn"><input
										type="radio" value="N" data-cid="io_code_sl_ioCodeBaseYn"
										name="io_code_sl_ioCodeBaseYn__A2"
										id="field-A2-io_code_sl_ioCodeBaseYn-1"
										data-field-key="io_code_sl_ioCodeBaseYn" aria-label="거래유형(영업)"><label
										for="field-A2-io_code_sl_ioCodeBaseYn-1"
										data-cid="io_code_sl_ioCodeBaseYn">직접입력</label></span>
								</div>
								<div class="control   hidden">

									<select data-field-key="io_code_sl_ioTypeSale"
										data-cid="io_code_sl_ioTypeSale" name="io_code_sl_ioTypeSale"
										aria-label="거래유형(영업)" id="field-A2-io_code_sl_ioTypeSale-2"><option
											value="11" selected="">부가세율 적용</option>
										<option value="12">부가세율 미적용</option></select>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래유형(구매)">
						<div class="reference-label">거래유형(구매)</div>
						<div class="reference-control">
							<div class="control-set">
								<div class="control   ">

									<span class="form-radio" data-cid="io_code_by_ioCodeBaseYn"><input
										type="radio" value="Y" data-cid="io_code_by_ioCodeBaseYn"
										name="io_code_by_ioCodeBaseYn__A2"
										id="field-A2-io_code_by_ioCodeBaseYn-0" checked=""
										data-field-key="io_code_by_ioCodeBaseYn" aria-label="거래유형(구매)"><label
										for="field-A2-io_code_by_ioCodeBaseYn-0"
										data-cid="io_code_by_ioCodeBaseYn">기본설정</label></span><span
										class="form-radio" data-cid="io_code_by_ioCodeBaseYn"><input
										type="radio" value="N" data-cid="io_code_by_ioCodeBaseYn"
										name="io_code_by_ioCodeBaseYn__A2"
										id="field-A2-io_code_by_ioCodeBaseYn-1"
										data-field-key="io_code_by_ioCodeBaseYn" aria-label="거래유형(구매)"><label
										for="field-A2-io_code_by_ioCodeBaseYn-1"
										data-cid="io_code_by_ioCodeBaseYn">직접입력</label></span>
								</div>
								<div class="control   hidden">

									<select data-field-key="io_code_by_ioTypeBuy"
										data-cid="io_code_by_ioTypeBuy" name="io_code_by_ioTypeBuy"
										aria-label="거래유형(구매)" id="field-A2-io_code_by_ioTypeBuy-2"><option
											value="21" selected="">부가세율 적용</option>
										<option value="22">부가세율 미적용</option></select>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="거래처계층그룹">
						<div class="reference-label">거래처계층그룹</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   " data-cid="custlevelgroupdata">
									<a data-cid="custlevelgroupdata" class="hidden" type="button"
										role="button" tabindex="0">선택</a>
									<div class="hidden"></div>
									<button
										class="btn btn-default btn-code-search btn-vertical-top first-child"
										data-cid="custlevelgroupdata" type="button"
										data-lookup="custlevelgroupdata" aria-label="거래처계층그룹 검색">⌕</button>
									<div class="tags-input last-child"
										data-cid="custlevelgroupdata">
										<div class="input-height-fixed" data-cid="custlevelgroupdata">
											<div>
												<div class="tags-input-typeahead">
													<div>
														<div class="tags-input-typeahead">
															<input type="text"
																class="form-control form-control-code noneEvent "
																data-cid="custlevelgroupdata" placeholder="거래처계층그룹"
																value="" data-field-key="custlevelgroupdata"
																name="custlevelgroupdata" aria-label="거래처계층그룹"
																id="field-A2-custlevelgroupdata-0">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button
										class="btn btn-default btn-ellipsis btn-vertical-top hidden"
										data-cid="custlevelgroupdata" type="button">…</button>



								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A3" data-entry-panel="A3" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="담당자">
						<div class="reference-label">담당자</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control  {{style.css}} ">
									<button
										class="btn btn-default btn-code-search popupHandler first-child"
										data-cid="emp_cd" type="button" data-lookup="staff"
										aria-label="담당자 검색">⌕</button>
									<input type="text" class="form-control last-child"
										data-cid="emp_cd" placeholder="담당자" value=""
										data-field-key="staff" name="staff" aria-label="담당자"
										id="field-A3-staff-0"><input type="hidden"
										data-cid="emp_cd" value="" data-field-key="staffCode"
										name="staffCode" aria-label="담당자" id="field-A3-staffCode-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="수금/지급예정일">
						<div class="reference-label">수금/지급예정일</div>
						<div class="reference-control">
							<div class="control-set whole-row">
								<div class="control  flex-none ">

									<span class="form-radio" data-cid="coll_pay_typeradio_0_0"><input
										type="radio" value="B" data-cid="coll_pay_typeradio_0_0"
										name="coll_pay_type_radio__A3"
										id="field-A3-coll_pay_type_radio-0" checked=""
										data-field-key="coll_pay_type_radio" aria-label="수금/지급예정일"><label
										for="field-A3-coll_pay_type_radio-0"
										data-cid="coll_pay_typeradio_0_0">기본설정</label></span>
								</div>
							</div>
							<div class="control-set whole-row">
								<div class="control  flex-none ">

									<span class="form-radio" data-cid="coll_pay_typeradio_1_0"><input
										type="radio" value="D" data-cid="coll_pay_typeradio_1_0"
										name="coll_pay_type_radio__A3"
										id="field-A3-coll_pay_type_radio-1"
										data-field-key="coll_pay_type_radio" aria-label="수금/지급예정일"><label
										for="field-A3-coll_pay_type_radio-1"
										data-cid="coll_pay_typeradio_1_0"></label></span>
								</div>
								<div class="control  flex-none ">

									<select data-field-key="coll_pay_typeselect_1_1"
										data-cid="coll_pay_typeselect_1_1"
										name="coll_pay_typeselect_1_1" aria-label="수금/지급예정일"
										data-date-month="true" id="field-A3-coll_pay_typeselect_1_1-2"><option
											value="1" selected="">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
										<option value="32">32</option>
										<option value="33">33</option>
										<option value="34">34</option>
										<option value="35">35</option>
										<option value="36">36</option>
										<option value="37">37</option>
										<option value="38">38</option>
										<option value="39">39</option>
										<option value="40">40</option>
										<option value="41">41</option>
										<option value="42">42</option>
										<option value="43">43</option>
										<option value="44">44</option>
										<option value="45">45</option>
										<option value="46">46</option>
										<option value="47">47</option>
										<option value="48">48</option>
										<option value="49">49</option>
										<option value="50">50</option>
										<option value="51">51</option>
										<option value="52">52</option>
										<option value="53">53</option>
										<option value="54">54</option>
										<option value="55">55</option>
										<option value="56">56</option>
										<option value="57">57</option>
										<option value="58">58</option>
										<option value="59">59</option>
										<option value="60">60</option>
										<option value="61">61</option>
										<option value="62">62</option>
										<option value="63">63</option>
										<option value="64">64</option>
										<option value="65">65</option>
										<option value="66">66</option>
										<option value="67">67</option>
										<option value="68">68</option>
										<option value="69">69</option>
										<option value="70">70</option>
										<option value="71">71</option>
										<option value="72">72</option>
										<option value="73">73</option>
										<option value="74">74</option>
										<option value="75">75</option>
										<option value="76">76</option>
										<option value="77">77</option>
										<option value="78">78</option>
										<option value="79">79</option>
										<option value="80">80</option>
										<option value="81">81</option>
										<option value="82">82</option>
										<option value="83">83</option>
										<option value="84">84</option>
										<option value="85">85</option>
										<option value="86">86</option>
										<option value="87">87</option>
										<option value="88">88</option>
										<option value="89">89</option>
										<option value="90">90</option>
										<option value="91">91</option>
										<option value="92">92</option>
										<option value="93">93</option>
										<option value="94">94</option>
										<option value="95">95</option>
										<option value="96">96</option>
										<option value="97">97</option>
										<option value="98">98</option>
										<option value="99">99</option>
										<option value="100">100</option>
										<option value="101">101</option>
										<option value="102">102</option>
										<option value="103">103</option>
										<option value="104">104</option>
										<option value="105">105</option>
										<option value="106">106</option>
										<option value="107">107</option>
										<option value="108">108</option>
										<option value="109">109</option>
										<option value="110">110</option>
										<option value="111">111</option>
										<option value="112">112</option>
										<option value="113">113</option>
										<option value="114">114</option>
										<option value="115">115</option>
										<option value="116">116</option>
										<option value="117">117</option>
										<option value="118">118</option>
										<option value="119">119</option>
										<option value="120">120</option>
										<option value="121">121</option>
										<option value="122">122</option>
										<option value="123">123</option>
										<option value="124">124</option>
										<option value="125">125</option>
										<option value="126">126</option>
										<option value="127">127</option>
										<option value="128">128</option>
										<option value="129">129</option>
										<option value="130">130</option>
										<option value="131">131</option>
										<option value="132">132</option>
										<option value="133">133</option>
										<option value="134">134</option>
										<option value="135">135</option>
										<option value="136">136</option>
										<option value="137">137</option>
										<option value="138">138</option>
										<option value="139">139</option>
										<option value="140">140</option>
										<option value="141">141</option>
										<option value="142">142</option>
										<option value="143">143</option>
										<option value="144">144</option>
										<option value="145">145</option>
										<option value="146">146</option>
										<option value="147">147</option>
										<option value="148">148</option>
										<option value="149">149</option>
										<option value="150">150</option>
										<option value="151">151</option>
										<option value="152">152</option>
										<option value="153">153</option>
										<option value="154">154</option>
										<option value="155">155</option>
										<option value="156">156</option>
										<option value="157">157</option>
										<option value="158">158</option>
										<option value="159">159</option>
										<option value="160">160</option>
										<option value="161">161</option>
										<option value="162">162</option>
										<option value="163">163</option>
										<option value="164">164</option>
										<option value="165">165</option>
										<option value="166">166</option>
										<option value="167">167</option>
										<option value="168">168</option>
										<option value="169">169</option>
										<option value="170">170</option>
										<option value="171">171</option>
										<option value="172">172</option>
										<option value="173">173</option>
										<option value="174">174</option>
										<option value="175">175</option>
										<option value="176">176</option>
										<option value="177">177</option>
										<option value="178">178</option>
										<option value="179">179</option>
										<option value="180">180</option>
										<option value="181">181</option>
										<option value="182">182</option>
										<option value="183">183</option>
										<option value="184">184</option>
										<option value="185">185</option>
										<option value="186">186</option>
										<option value="187">187</option>
										<option value="188">188</option>
										<option value="189">189</option>
										<option value="190">190</option>
										<option value="191">191</option>
										<option value="192">192</option>
										<option value="193">193</option>
										<option value="194">194</option>
										<option value="195">195</option>
										<option value="196">196</option>
										<option value="197">197</option>
										<option value="198">198</option>
										<option value="199">199</option>
										<option value="200">200</option>
										<option value="201">201</option>
										<option value="202">202</option>
										<option value="203">203</option>
										<option value="204">204</option>
										<option value="205">205</option>
										<option value="206">206</option>
										<option value="207">207</option>
										<option value="208">208</option>
										<option value="209">209</option>
										<option value="210">210</option>
										<option value="211">211</option>
										<option value="212">212</option>
										<option value="213">213</option>
										<option value="214">214</option>
										<option value="215">215</option>
										<option value="216">216</option>
										<option value="217">217</option>
										<option value="218">218</option>
										<option value="219">219</option>
										<option value="220">220</option>
										<option value="221">221</option>
										<option value="222">222</option>
										<option value="223">223</option>
										<option value="224">224</option>
										<option value="225">225</option>
										<option value="226">226</option>
										<option value="227">227</option>
										<option value="228">228</option>
										<option value="229">229</option>
										<option value="230">230</option>
										<option value="231">231</option>
										<option value="232">232</option>
										<option value="233">233</option>
										<option value="234">234</option>
										<option value="235">235</option>
										<option value="236">236</option>
										<option value="237">237</option>
										<option value="238">238</option>
										<option value="239">239</option>
										<option value="240">240</option>
										<option value="241">241</option>
										<option value="242">242</option>
										<option value="243">243</option>
										<option value="244">244</option>
										<option value="245">245</option>
										<option value="246">246</option>
										<option value="247">247</option>
										<option value="248">248</option>
										<option value="249">249</option>
										<option value="250">250</option>
										<option value="251">251</option>
										<option value="252">252</option>
										<option value="253">253</option>
										<option value="254">254</option>
										<option value="255">255</option>
										<option value="256">256</option>
										<option value="257">257</option>
										<option value="258">258</option>
										<option value="259">259</option>
										<option value="260">260</option>
										<option value="261">261</option>
										<option value="262">262</option>
										<option value="263">263</option>
										<option value="264">264</option>
										<option value="265">265</option>
										<option value="266">266</option>
										<option value="267">267</option>
										<option value="268">268</option>
										<option value="269">269</option>
										<option value="270">270</option>
										<option value="271">271</option>
										<option value="272">272</option>
										<option value="273">273</option>
										<option value="274">274</option>
										<option value="275">275</option>
										<option value="276">276</option>
										<option value="277">277</option>
										<option value="278">278</option>
										<option value="279">279</option>
										<option value="280">280</option>
										<option value="281">281</option>
										<option value="282">282</option>
										<option value="283">283</option>
										<option value="284">284</option>
										<option value="285">285</option>
										<option value="286">286</option>
										<option value="287">287</option>
										<option value="288">288</option>
										<option value="289">289</option>
										<option value="290">290</option>
										<option value="291">291</option>
										<option value="292">292</option>
										<option value="293">293</option>
										<option value="294">294</option>
										<option value="295">295</option>
										<option value="296">296</option>
										<option value="297">297</option>
										<option value="298">298</option>
										<option value="299">299</option>
										<option value="300">300</option>
										<option value="301">301</option>
										<option value="302">302</option>
										<option value="303">303</option>
										<option value="304">304</option>
										<option value="305">305</option>
										<option value="306">306</option>
										<option value="307">307</option>
										<option value="308">308</option>
										<option value="309">309</option>
										<option value="310">310</option>
										<option value="311">311</option>
										<option value="312">312</option>
										<option value="313">313</option>
										<option value="314">314</option>
										<option value="315">315</option>
										<option value="316">316</option>
										<option value="317">317</option>
										<option value="318">318</option>
										<option value="319">319</option>
										<option value="320">320</option>
										<option value="321">321</option>
										<option value="322">322</option>
										<option value="323">323</option>
										<option value="324">324</option>
										<option value="325">325</option>
										<option value="326">326</option>
										<option value="327">327</option>
										<option value="328">328</option>
										<option value="329">329</option>
										<option value="330">330</option>
										<option value="331">331</option>
										<option value="332">332</option>
										<option value="333">333</option>
										<option value="334">334</option>
										<option value="335">335</option>
										<option value="336">336</option>
										<option value="337">337</option>
										<option value="338">338</option>
										<option value="339">339</option>
										<option value="340">340</option>
										<option value="341">341</option>
										<option value="342">342</option>
										<option value="343">343</option>
										<option value="344">344</option>
										<option value="345">345</option>
										<option value="346">346</option>
										<option value="347">347</option>
										<option value="348">348</option>
										<option value="349">349</option>
										<option value="350">350</option>
										<option value="351">351</option>
										<option value="352">352</option>
										<option value="353">353</option>
										<option value="354">354</option>
										<option value="355">355</option>
										<option value="356">356</option>
										<option value="357">357</option>
										<option value="358">358</option>
										<option value="359">359</option>
										<option value="360">360</option>
										<option value="361">361</option>
										<option value="362">362</option>
										<option value="363">363</option>
										<option value="364">364</option>
										<option value="365">365</option></select>
								</div>
								<div class="control  flex-none ">

									<span class="">일 후</span>

								</div>
							</div>
							<div class="control-set whole-row">
								<div class="control  flex-none ">

									<span class="form-radio" data-cid="coll_pay_typeradio_2_0"><input
										type="radio" value="M" data-cid="coll_pay_typeradio_2_0"
										name="coll_pay_type_radio__A3"
										id="field-A3-coll_pay_type_radio-3"
										data-field-key="coll_pay_type_radio" aria-label="수금/지급예정일"><label
										for="field-A3-coll_pay_type_radio-3"
										data-cid="coll_pay_typeradio_2_0"></label></span>
								</div>
								<div class="control  flex-none ">

									<select data-field-key="coll_pay_typeselect_2_1"
										data-cid="coll_pay_typeselect_2_1"
										name="coll_pay_typeselect_2_1" aria-label="수금/지급예정일"
										data-date-month="true" id="field-A3-coll_pay_typeselect_2_1-4"><option
											value="0" selected="">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option></select>
								</div>
								<div class="control  flex-none ">

									<span class="">개월 후</span>

								</div>
								<div class="control  flex-none ">

									<select data-field-key="coll_pay_typeselect_2_3"
										data-cid="coll_pay_typeselect_2_3"
										name="coll_pay_typeselect_2_3" aria-label="수금/지급예정일"
										data-date-month="true" id="field-A3-coll_pay_typeselect_2_3-5"><option
											value="1" selected="">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">말일</option></select>
								</div>
								<div class="control  flex-none ">

									<span class="">일</span>

								</div>
							</div>
							<div class="control-set whole-row">
								<div class="control  flex-none ">

									<span class="form-radio" data-cid="coll_pay_typeradio_3_0"><input
										type="radio" value="W" data-cid="coll_pay_typeradio_3_0"
										name="coll_pay_type_radio__A3"
										id="field-A3-coll_pay_type_radio-6"
										data-field-key="coll_pay_type_radio" aria-label="수금/지급예정일"><label
										for="field-A3-coll_pay_type_radio-6"
										data-cid="coll_pay_typeradio_3_0"></label></span>
								</div>
								<div class="control  flex-none ">

									<select data-field-key="coll_pay_typeselect_3_1"
										data-cid="coll_pay_typeselect_3_1"
										name="coll_pay_typeselect_3_1" aria-label="수금/지급예정일"
										data-date-month="true" id="field-A3-coll_pay_typeselect_3_1-7"><option
											value="0" selected="">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
										<option value="32">32</option>
										<option value="33">33</option>
										<option value="34">34</option>
										<option value="35">35</option>
										<option value="36">36</option>
										<option value="37">37</option>
										<option value="38">38</option>
										<option value="39">39</option>
										<option value="40">40</option>
										<option value="41">41</option>
										<option value="42">42</option>
										<option value="43">43</option>
										<option value="44">44</option>
										<option value="45">45</option>
										<option value="46">46</option>
										<option value="47">47</option>
										<option value="48">48</option>
										<option value="49">49</option>
										<option value="50">50</option>
										<option value="51">51</option>
										<option value="52">52</option></select>
								</div>
								<div class="control  flex-none ">

									<span class="">주 후</span>

								</div>
								<div class="control  flex-none ">

									<select data-field-key="coll_pay_typeselect_3_3"
										data-cid="coll_pay_typeselect_3_3"
										name="coll_pay_typeselect_3_3" aria-label="수금/지급예정일"
										id="field-A3-coll_pay_typeselect_3_3-8"><option
											value="1" selected="">일</option>
										<option value="2">월</option>
										<option value="3">화</option>
										<option value="4">수</option>
										<option value="5">목</option>
										<option value="6">금</option>
										<option value="7">토</option></select>
								</div>
								<div class="control  flex-none ">

									<span class="">요일</span>

								</div>
							</div>
							<div class="control-set whole-row">
								<div class="control  flex-none ">

									<span class="form-radio" data-cid="coll_pay_typeradio_4_0"><input
										type="radio" value="N" data-cid="coll_pay_typeradio_4_0"
										name="coll_pay_type_radio__A3"
										id="field-A3-coll_pay_type_radio-9"
										data-field-key="coll_pay_type_radio" aria-label="수금/지급예정일"><label
										for="field-A3-coll_pay_type_radio-9"
										data-cid="coll_pay_typeradio_4_0">사용안함</label></span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="채권번호관리">
						<div class="reference-label">채권번호관리</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<select data-field-key="manage_bond_no"
										data-cid="manage_bond_no" name="manage_bond_no"
										aria-label="채권번호관리" id="field-A3-manage_bond_no-0"><option
											value="B" selected="">기본설정</option>
										<option value="M">필수입력</option>
										<option value="Y">선택입력</option>
										<option value="N">사용안함</option></select>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="채무번호관리">
						<div class="reference-label">채무번호관리</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<select data-field-key="manage_debit_no"
										data-cid="manage_debit_no" name="manage_debit_no"
										aria-label="채무번호관리" id="field-A3-manage_debit_no-0"><option
											value="B" selected="">기본설정</option>
										<option value="M">필수입력</option>
										<option value="Y">선택입력</option>
										<option value="N">사용안함</option></select>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="여신한도">
						<div class="reference-label">여신한도</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="cust_limit" placeholder="여신한도" value=""
										data-field-key="cust_limit" name="cust_limit"
										aria-label="여신한도" id="field-A3-cust_limit-0">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="출고조정률">
						<div class="reference-label">출고조정률</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="o_rate" placeholder="출고조정률" value=""
										data-field-key="o_rate" name="o_rate" aria-label="출고조정률"
										id="field-A3-o_rate-0"><span>%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="입고조정률">
						<div class="reference-label">입고조정률</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="i_rate" placeholder="입고조정률" value=""
										data-field-key="i_rate" name="i_rate" aria-label="입고조정률"
										id="field-A3-i_rate-0"><span>%</span>
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
										aria-label="영업단가그룹" id="field-A3-price_group-0"><input
										type="hidden" data-cid="price_group" value=""
										data-field-key="price_groupCode" name="price_groupCode"
										aria-label="영업단가그룹" id="field-A3-price_groupCode-1">
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
										aria-label="구매단가그룹" id="field-A3-price_group2-0"><input
										type="hidden" data-cid="price_group2" value=""
										data-field-key="price_group2Code" name="price_group2Code"
										aria-label="구매단가그룹" id="field-A3-price_group2Code-1">
								</div>
							</div>
						</div>
					</div>
					<div class="reference-row" data-reference-label="여신기간">
						<div class="reference-label">여신기간</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control text-right first-child last-child"
										data-cid="cust_limit_term" placeholder="여신기간" value=""
										data-field-key="cust_limit_term" name="cust_limit_term"
										aria-label="여신기간" id="field-A3-cust_limit_term-0"><span>일
										전</span>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section id="panel-A4" data-entry-panel="A4" role="tabpanel" hidden>
					<div class="reference-row" data-reference-label="6개의 추가항목생성가능">
						<div class="reference-label">6개의 추가항목생성가능</div>
						<div class="reference-control">
							<div class="control-set    ">
								<div class="control   ">

									<input type="text"
										class="form-control form-control first-child last-child"
										data-cid="cont1" placeholder="6개의 추가항목생성가능" value=""
										data-field-key="cont1" name="cont1" aria-label="6개의 추가항목생성가능"
										id="field-A4-cont1-0">
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
										id="field-A4-cont2-0">
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
										id="field-A4-cont3-0">
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
										id="field-A4-cont4-0">
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
										id="field-A4-cont5-0">
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
										id="field-A4-cont6-0">
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
										data-cid="no_cust_user1" placeholder="숫자형추가항목1" value=""
										data-field-key="no_cust_user1" name="no_cust_user1"
										aria-label="숫자형추가항목1" id="field-A4-no_cust_user1-0">
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
										data-cid="no_cust_user2" placeholder="숫자형추가항목2" value=""
										data-field-key="no_cust_user2" name="no_cust_user2"
										aria-label="숫자형추가항목2" id="field-A4-no_cust_user2-0">
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
										data-cid="no_cust_user3" placeholder="숫자형추가항목3" value=""
										data-field-key="no_cust_user3" name="no_cust_user3"
										aria-label="숫자형추가항목3" id="field-A4-no_cust_user3-0">
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
