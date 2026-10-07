<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>견적서입력</title>
<jsp:include page="../common/styles.jsp" />
</head>
<body>
	<div class="erp-app">
		<jsp:include page="../common/brand-header.jsp" />
		<div class="app-body">
			<jsp:include page="../common/sidebar.jsp"><jsp:param
					name="activePage" value="quote/quote-input" /></jsp:include>
			<main class="workspace">
				<header class="screen-titlebar">
					<h1>견적서입력</h1>
				</header>
				<section class="screen-content simple-page input-page">
					<div id="entrySection" class="reference-dialog document-dialog inline-entry" aria-labelledby="entryTitle">
						<form id="entryForm" novalidate>
							<h2 id="entryTitle">견적서입력</h2>
							<div class="reference-fields">
								<div class="reference-row" data-reference-label="일자-No.">
									<div class="reference-label">일자-No.</div>
									<div class="reference-control">
										<div class="control-set">
											<div class="control">
												<div class="wrapper-datepicker">
													<div class="wrapper-datepicker">
														<select data-field-key="dateYear" data-cid="year" name="dateYear" aria-label="일자-No." data-date-year="true" id="field-main-dateYear-0">
															<option value="====">====</option>
															<option value="2027">2027</option>
															<option value="2026" selected="">2026</option>
															<option value="2025">2025</option>
															<option value="2024">2024</option>
															<option value="직접입력">직접입력</option>
														</select><span>&nbsp;/</span>&nbsp;
														<select data-field-key="dateMonth" data-cid="month" name="dateMonth" aria-label="일자-No." data-date-month="true" id="field-main-dateMonth-1">
															<option value="==">==</option>
															<option value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10" selected="">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
														</select>&nbsp;<span>/&nbsp;</span>
														<input id="field-main-dateDay-2" autocomplete="off" class="form-control textbox-inline" placeholder="" value="28" data-field-key="dateDay" name="dateDay" aria-label="일자-No.">&nbsp;
														<div class="btn-datepicker-toggle" role="button" tabindex="0" data-calendar="true" aria-label="일자-No. 달력">▦</div>
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
												<input id="field-main-partner-0" autocomplete="off" class="form-control noneEvent form-control-code first-child" placeholder="거래처" value="" data-field-key="partner" name="partner" aria-label="거래처">
												<button id="_search_icon" class="btn btn-default btn btn-default btn-code-search" type="button" data-lookup="partner" aria-label="거래처 검색">⌕</button>
												<input id="field-main-partner_1-1" autocomplete="off" class="form-control last-child" placeholder="거래처" value="" data-field-key="partner_1" name="partner_1" aria-label="거래처">
											</div>
										</div>
									</div>
								</div>
								<div class="reference-row" data-reference-label="담당자">
									<div class="reference-label">담당자</div>
									<div class="reference-control">
										<div class="control-set">
											<div class="control">
												<input id="field-main-staff-0" autocomplete="off" class="form-control noneEvent form-control-code first-child" placeholder="담당자" value="" data-field-key="staff" name="staff" aria-label="담당자">
												<button id="_search_icon" class="btn btn-default btn btn-default btn-code-search" type="button" data-lookup="staff" aria-label="담당자 검색">⌕</button>
												<input id="field-main-staff_1-1" autocomplete="off" class="form-control last-child" placeholder="담당자" value="" data-field-key="staff_1" name="staff_1" aria-label="담당자">
											</div>
										</div>
									</div>
								</div>
								<div class="reference-row" data-reference-label="출하창고">
									<div class="reference-label">출하창고</div>
									<div class="reference-control">
										<div class="control-set">
											<div class="control">
												<input id="field-main-warehouse-0" autocomplete="off" class="form-control noneEvent form-control-code first-child" placeholder="출하창고" value="100" data-field-key="warehouse" name="warehouse" aria-label="출하창고">
												<button id="100_search_icon" class="btn btn-default btn btn-default btn-code-search" type="button" data-lookup="warehouse" aria-label="출하창고 검색">⌕</button>
												<input id="field-main-warehouse_1-1" autocomplete="off" class="form-control last-child" placeholder="출하창고" value="본사창고" data-field-key="warehouse_1" name="warehouse_1" aria-label="출하창고">
											</div>
										</div>
									</div>
								</div>
								<div class="reference-row" data-reference-label="거래유형">
									<div class="reference-label">거래유형</div>
									<div class="reference-control">
										<div class="control-set">
											<div class="control">
												<select data-field-key="trx_type_quotationXmaster" data-cid="trx_type_quotationXmaster" name="trx_type_quotationXmaster" aria-label="거래유형" id="field-main-trx_type_quotationXmaster-0">
													<option value="부가세율 적용" selected="">부가세율 적용</option>
													<option value="부가세율 미적용">부가세율 미적용</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="reference-row" data-reference-label="통화">
									<div class="reference-label">통화</div>
									<div class="reference-control">
										<ul class="wrapper-form-sub form-sub-horizontal">
											<li class="folding-title"><div class="form">
													<div class="control-set">
														<div class="control">
															<select data-field-key="foreign_currency_quotationXmaster" data-cid="foreign_currency_quotationXmaster" name="foreign_currency_quotationXmaster" aria-label="통화" id="field-main-foreign_currency_quotationXmaster-0">
																<option value="KRW" selected="">내자(KRW)</option>
																<option value="USD">달러 [100]</option>
																<option value="JPY">엔화 [400]</option>
																<option value="CNY">위안 [300]</option>
																<option value="EUR">유로 [200]</option>
															</select>
														</div>
													</div>
												</div></li>
										</ul>
									</div>
								</div>
								<div class="reference-row" data-reference-label="프로젝트">
									<div class="reference-label">프로젝트</div>
									<div class="reference-control">
										<div class="control-set">
											<div class="control">
												<input id="field-main-project-0" autocomplete="off" class="form-control noneEvent form-control-code first-child" placeholder="프로젝트" value="" data-field-key="project" name="project" aria-label="프로젝트">
												<button id="_search_icon" class="btn btn-default btn btn-default btn-code-search" type="button" data-lookup="project" aria-label="프로젝트 검색">⌕</button>
												<input id="field-main-project_1-1" autocomplete="off" class="form-control last-child" placeholder="프로젝트" value="" data-field-key="project_1" name="project_1" aria-label="프로젝트">
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
												<th>합계</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td class="item-code-cell"><div class="item-code-picker"><input name="lines.0.품목코드" data-field-key="lines.0.품목코드" aria-label="품목코드 1행" readonly><button type="button" class="item-search-button" data-item-lookup aria-label="품목검색 1행">품목검색</button></div><input type="hidden" name="lines.0.itemId" data-field-key="lines.0.itemId"></td>
												<td><input name="lines.0.품목명" data-field-key="lines.0.품목명" aria-label="품목명 1행" readonly></td>
												<td><input name="lines.0.규격" data-field-key="lines.0.규격" aria-label="규격 1행"></td>
												<td><input name="lines.0.수량" data-field-key="lines.0.수량" aria-label="수량 1행" inputmode="decimal"></td>
												<td><input name="lines.0.단가" data-field-key="lines.0.단가" aria-label="단가 1행" inputmode="decimal"></td>
												<td><input name="lines.0.공급가액" data-field-key="lines.0.공급가액" aria-label="공급가액 1행" inputmode="decimal"></td>
												<td><input name="lines.0.부가세" data-field-key="lines.0.부가세" aria-label="부가세 1행" inputmode="decimal"></td>
												<td><input name="lines.0.새로운 항목 추가" data-field-key="lines.0.새로운 항목 추가" aria-label="새로운 항목 추가 1행"></td>
												<td><input name="lines.0.합계" data-field-key="lines.0.합계" aria-label="합계 1행" inputmode="decimal"></td>
											</tr>
											<tr>
												<td>2</td>
												<td class="item-code-cell"><div class="item-code-picker"><input name="lines.1.품목코드" data-field-key="lines.1.품목코드" aria-label="품목코드 2행" readonly><button type="button" class="item-search-button" data-item-lookup aria-label="품목검색 2행">품목검색</button></div><input type="hidden" name="lines.1.itemId" data-field-key="lines.1.itemId"></td>
												<td><input name="lines.1.품목명" data-field-key="lines.1.품목명" aria-label="품목명 2행" readonly></td>
												<td><input name="lines.1.규격" data-field-key="lines.1.규격" aria-label="규격 2행"></td>
												<td><input name="lines.1.수량" data-field-key="lines.1.수량" aria-label="수량 2행" inputmode="decimal"></td>
												<td><input name="lines.1.단가" data-field-key="lines.1.단가" aria-label="단가 2행" inputmode="decimal"></td>
												<td><input name="lines.1.공급가액" data-field-key="lines.1.공급가액" aria-label="공급가액 2행" inputmode="decimal"></td>
												<td><input name="lines.1.부가세" data-field-key="lines.1.부가세" aria-label="부가세 2행" inputmode="decimal"></td>
												<td><input name="lines.1.새로운 항목 추가" data-field-key="lines.1.새로운 항목 추가" aria-label="새로운 항목 추가 2행"></td>
												<td><input name="lines.1.합계" data-field-key="lines.1.합계" aria-label="합계 2행" inputmode="decimal"></td>
											</tr>
											<tr>
												<td>3</td>
												<td class="item-code-cell"><div class="item-code-picker"><input name="lines.2.품목코드" data-field-key="lines.2.품목코드" aria-label="품목코드 3행" readonly><button type="button" class="item-search-button" data-item-lookup aria-label="품목검색 3행">품목검색</button></div><input type="hidden" name="lines.2.itemId" data-field-key="lines.2.itemId"></td>
												<td><input name="lines.2.품목명" data-field-key="lines.2.품목명" aria-label="품목명 3행" readonly></td>
												<td><input name="lines.2.규격" data-field-key="lines.2.규격" aria-label="규격 3행"></td>
												<td><input name="lines.2.수량" data-field-key="lines.2.수량" aria-label="수량 3행" inputmode="decimal"></td>
												<td><input name="lines.2.단가" data-field-key="lines.2.단가" aria-label="단가 3행" inputmode="decimal"></td>
												<td><input name="lines.2.공급가액" data-field-key="lines.2.공급가액" aria-label="공급가액 3행" inputmode="decimal"></td>
												<td><input name="lines.2.부가세" data-field-key="lines.2.부가세" aria-label="부가세 3행" inputmode="decimal"></td>
												<td><input name="lines.2.새로운 항목 추가" data-field-key="lines.2.새로운 항목 추가" aria-label="새로운 항목 추가 3행"></td>
												<td><input name="lines.2.합계" data-field-key="lines.2.합계" aria-label="합계 3행" inputmode="decimal"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<button type="button" class="tool-button" data-add-line>행 추가</button>
							</div>
							<p class="entry-error" role="alert"></p>
							<div class="simple-dialog-actions">
								<button type="submit" class="primary-button">저장(F8)</button>
								<button type="reset">다시 작성</button>
							</div>
						</form>
					</div>
				</section>
			</main>
		</div>
	</div>

	<!-- 품목 검색 모달 -->
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
	  const entryForm = document.querySelector("#entryForm");

	  // 1. 진짜 저장 로직 (Ajax Fetch) - 400 에러 원천 차단 적용 완료
	  entryForm.addEventListener("submit", async function (event) {
	    event.preventDefault();
	    
	    const formData = new FormData(entryForm);
	    const quoteDt = formData.get("dateYear") + "-" + formData.get("dateMonth") + "-" + formData.get("dateDay");

	    // [핵심 수정 1] 스프링(Long)에 맞춰 빈칸이면 null, 값이 있으면 무조건 숫자로 강제 변환
	    const quoteVO = {
	        quoteDt: quoteDt,
	        partnerId: formData.get("partner") ? Number(formData.get("partner")) : null,
	        empId: formData.get("staff") ? Number(formData.get("staff")) : null,
	        whId: formData.get("warehouse") ? Number(formData.get("warehouse")) : null,
	        trxTp: formData.get("trx_type_quotationXmaster"),
	        currCd: formData.get("foreign_currency_quotationXmaster"),
	        prjNm: formData.get("project_1"),
	        supAmt: 0, // 헤더 합계를 위한 변수 초기화
	        taxAmt: 0,
	        totAmt: 0,
	        lines: [] 
	    };

	    const tbody = document.querySelector(".reference-lines tbody");
	    const rows = tbody.querySelectorAll("tr");

	    rows.forEach(function(row, index) {
	        const itemIdVal = row.querySelector('input[name="lines.' + index + '.itemId"]').value;
	        
	        if (itemIdVal && itemIdVal.trim() !== "") {
	            // [핵심 수정 2] itemId에 문자가 섞여 들어오면 억지로라도 숫자로 변환 (에러 방지)
	            let itemIdNum = Number(itemIdVal);
	            if (isNaN(itemIdNum)) {
	                itemIdNum = 1; // 변환 실패 시 기본값 1 세팅
	            }

	            let qty = Number(row.querySelector('input[name="lines.' + index + '.수량"]').value) || 0;
	            let unitPrice = Number(row.querySelector('input[name="lines.' + index + '.단가"]').value) || 0;
	            
	            // [핵심 수정 3] 공급가액, 부가세, 합계를 비워두더라도 자바스크립트가 자동으로 계산해서 채워줌
	            let supAmt = Number(row.querySelector('input[name="lines.' + index + '.공급가액"]').value) || (qty * unitPrice);
	            let taxAmt = Number(row.querySelector('input[name="lines.' + index + '.부가세"]').value) || Math.floor(supAmt * 0.1);
	            let totAmt = Number(row.querySelector('input[name="lines.' + index + '.합계"]').value) || (supAmt + taxAmt);

	            // 계산된 금액을 헤더(상단) 총합계에 누적 반영
	            quoteVO.supAmt += supAmt;
	            quoteVO.taxAmt += taxAmt;
	            quoteVO.totAmt += totAmt;

	            quoteVO.lines.push({
	                itemId: itemIdNum,
	                qty: qty,
	                unitPrice: unitPrice,
	                supAmt: supAmt,
	                taxAmt: taxAmt,
	                totAmt: totAmt,
	                memo: row.querySelector('input[name="lines.' + index + '.새로운 항목 추가"]').value || ""
	            });
	        }
	    });

	    if (quoteVO.lines.length === 0) {
	        alert("품목을 하나 이상 선택해주세요.");
	        return;
	    }

	    console.log("서버로 전송되는 정제된 데이터:", JSON.stringify(quoteVO));

	    try {
	        const response = await fetch('${pageContext.request.contextPath}/quote/quote-input/save', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json',
	                'Accept': 'application/json'
	            },
	            body: JSON.stringify(quoteVO)
	        });

	        if (response.ok) {
	            alert("견적서가 성공적으로 저장되었습니다!");
	            entryForm.reset();
	        } else {
	            const errText = await response.text();
	            console.error("서버 응답 에러:", errText);
	            alert("저장에 실패했습니다. (콘솔 로그를 확인해주세요)");
	        }
	    } catch (error) {
	        console.error("Save Error:", error);
	        alert("서버 통신 중 오류가 발생했습니다.");
	    }
	  });

	  // F8 단축키로 저장
	  document.addEventListener("keydown", function (event) {
	    if (event.key === "F8" && !document.querySelector("dialog[open]")) {
	      event.preventDefault();
	      entryForm.requestSubmit();
	    }
	  });

	  // 품목 검색 모달 로직
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
	    	const url = "${pageContext.request.contextPath}/quote/dummy-items?q=" + encodeURIComponent(itemLookupKeyword.value.trim());	      
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

	  // 그리드 행 추가
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