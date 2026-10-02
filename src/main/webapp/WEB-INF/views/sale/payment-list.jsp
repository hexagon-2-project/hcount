<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>결제내역조회</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="sale/payment-list" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>결제내역조회</h1>
				</header>
				<section class="screen-content simple-page">
					
					<form class="simple-search" method="get"
						action="${pageContext.request.contextPath}/sale/payment-list">
						<input type="search" name="q" id="searchInput"
							placeholder="검색어 입력" aria-label="결제내역조회 검색">
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
						<button type="button" data-list-action="integration">입금보고서작성</button>
						<button type="button" id="newButton">신규(F2)</button>
						<button type="button" data-list-action="export">Excel</button>
						<button type="button" data-list-action="more">오천건이상조회</button>
					</div>
				</section>
			</main>
		</div>
		<dialog id="entryDialog" class="simple-dialog reference-dialog document-dialog"
			aria-labelledby="entryTitle">
		<form id="entryForm" novalidate>
			<h2 id="entryTitle">결제</h2>
			<div class="reference-fields">
				<div class="reference-row" data-reference-label="사업자">
					<div class="reference-label">사업자</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<select data-field-key="business" data-cid="business"
									name="business" aria-label="사업자" id="field-main-business-0"><option
										value="2201234567" selected="">(주)가장많이쓰는ERP</option></select>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="VAN">
					<div class="reference-label">VAN</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<select data-field-key="vanType" data-cid="vanType"
									name="vanType" aria-label="VAN" id="field-main-vanType-0"><option
										value="1">KOCES</option>
									<option value="2" selected="">KICC</option>
									<option value="3">KIS</option></select>
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="결제방법">
					<div class="reference-label">결제방법</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control">

								<span class="form-radio" data-cid="payMethod"><input
									type="radio" value="CARD" data-cid="payMethod"
									name="payMethod__main" id="field-main-payMethod-0" checked=""
									data-field-key="payMethod" aria-label="결제방법"><label
									for="field-main-payMethod-0" data-cid="payMethod">신용결제</label></span><span
									class="form-radio" data-cid="payMethod"><input
									type="radio" value="CASH" data-cid="payMethod"
									name="payMethod__main" id="field-main-payMethod-1"
									data-field-key="payMethod" aria-label="결제방법"><label
									for="field-main-payMethod-1" data-cid="payMethod">현금결제</label></span><span
									class="form-radio" data-cid="payMethod"><input
									type="radio" value="PAY" data-cid="payMethod"
									name="payMethod__main" id="field-main-payMethod-2"
									data-field-key="payMethod" aria-label="결제방법"><label
									for="field-main-payMethod-2" data-cid="payMethod">간편결제</label></span>
							</div>
						</div>
						<div class="control-set">
							<div class="control-set">
								<div class="control  flex-none ">

									<div>
										<span ,="" class="label label-default label-light "
											addon-cid="addon-installment">할부</span>
									</div>
									<span class="form-radio" data-cid="installment"><input
										type="radio" value="0" data-cid="installment"
										name="installment__main" id="field-main-installment-3"
										checked="" data-field-key="installment" aria-label="결제방법"><label
										for="field-main-installment-3" data-cid="installment">일시불</label></span><span
										class="form-radio" data-cid="installment"><input
										type="radio" value="1" data-cid="installment"
										name="installment__main" id="field-main-installment-4"
										data-field-key="installment" aria-label="결제방법"><label
										for="field-main-installment-4" data-cid="installment">할부</label></span>
								</div>
								<div class="control   hidden">

									<input type="text"
										class="form-control [object Object] text-right first-child last-child"
										data-cid="installmentPeriod" placeholder="할부" value=""
										data-field-key="installmentPeriod" name="installmentPeriod"
										aria-label="할부" id="field-main-installmentPeriod-5">
								</div>
							</div>
						</div>
						<div class="control-set  hidden">
							<div class="control   hidden">

								<div>
									<span ,="" class="label label-default label-light "
										addon-cid="addon-receiptType">영수증구분</span>
								</div>
								<select data-field-key="receiptType" data-cid="receiptType"
									name="receiptType" aria-label="결제방법"
									id="field-main-receiptType-6"><option value="0"
										selected="">소비자 소득공제</option>
									<option value="1">사업자 지출증빙</option>
									<option value="2">자진발급</option>
									<option value="3">간이영수증</option></select>
							</div>
						</div>
						<div class="control-set  hidden">
							<div class="control   hidden">

								<div>
									<span ,="" class="label label-default label-light "
										addon-cid="addon-paymentBarcode">간편결제 식별번호</span>
								</div>
								<input type="text"
									class="form-control form-control first-child last-child"
									data-cid="paymentBarcode" placeholder="간편결제 식별번호" value=""
									data-field-key="paymentBarcode" name="paymentBarcode"
									aria-label="간편결제 식별번호" id="field-main-paymentBarcode-7">
							</div>
						</div>
						<div class="control-set  hidden">
							<div class="control   hidden">

								<div>
									<span ,="" class="label label-default label-light "
										addon-cid="addon-idNum">식별번호</span>
								</div>
								<input type="text"
									class="form-control form-control first-child last-child"
									data-cid="idNum" placeholder="식별번호" value=""
									data-field-key="idNum" name="idNum" aria-label="식별번호"
									id="field-main-idNum-8">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="영수증 출력여부">
					<div class="reference-label">영수증 출력여부</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<span class="form-radio" data-cid="receipt_print"><input
									type="radio" value="Y" data-cid="receipt_print"
									name="receipt_print__main" id="field-main-receipt_print-0"
									checked="" data-field-key="receipt_print" aria-label="영수증 출력여부"><label
									for="field-main-receipt_print-0" data-cid="receipt_print">출력</label></span><span
									class="form-radio" data-cid="receipt_print"><input
									type="radio" value="N" data-cid="receipt_print"
									name="receipt_print__main" id="field-main-receipt_print-1"
									data-field-key="receipt_print" aria-label="영수증 출력여부"><label
									for="field-main-receipt_print-1" data-cid="receipt_print">미출력</label></span>
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
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="부가세율">
					<div class="reference-label">부가세율</div>
					<div class="reference-control">
						<div class="control-set">
							<div class="control   ">

								<input type="text"
									class="form-control form-control text-right first-child last-child"
									data-cid="vatRate" placeholder="부가세율" value="10"
									data-field-key="vat" name="vat" aria-label="부가세율"
									id="field-main-vat-0">
							</div>
							<div class="control  flex-none ">

								<span class="">%</span>

							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="결제금액">
					<div class="reference-label">결제금액</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<input type="text"
									class="form-control form-control text-right first-child last-child"
									data-cid="payAmt" placeholder="결제금액" value="0"
									data-field-key="amount" name="amount" aria-label="결제금액"
									id="field-main-amount-0">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="공급가액">
					<div class="reference-label">공급가액</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<input type="text"
									class="form-control form-control text-right first-child last-child"
									data-cid="supplyAmt" placeholder="공급가액" value="0"
									data-field-key="supply" name="supply" aria-label="공급가액"
									id="field-main-supply-0">
							</div>
						</div>
					</div>
				</div>
				<div class="reference-row" data-reference-label="부가세">
					<div class="reference-label">부가세</div>
					<div class="reference-control">
						<div class="control-set    ">
							<div class="control   ">

								<input type="text"
									class="form-control form-control text-right first-child last-child"
									data-cid="vatAmt" placeholder="부가세" value="0"
									data-field-key="tax" name="tax" aria-label="부가세"
									id="field-main-tax-0">
							</div>
						</div>
					</div>
				</div>
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
