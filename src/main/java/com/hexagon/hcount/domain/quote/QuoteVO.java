package com.hexagon.hcount.domain.quote;

import java.util.List;

import lombok.Data;

@Data
public class QuoteVO {
    private Long quoteId;          // QUOTE_ID (PK)
    private String quoteNo;        // QUOTE_NO
    private String quoteDt;        // QUOTE_DT (예: 2026-10-28)
    private Long partnerId;        // PARTNER_ID
    private Long empId;            // EMP_ID
    private Long whId;             // WH_ID
    private String currCd;         // CURR_CD (통화)
    private Double exRate;         // EX_RATE (환율)
    private String trxTp;          // TRX_TP (거래유형)
    private String prjNm;          // PRJ_NM (프로젝트명)
    private String status;         // STATUS (진행상태)
    private Double supAmt;         // SUP_AMT (공급가액 합계)
    private Double taxAmt;         // TAX_AMT (부가세 합계)
    private Double totAmt;         // TOT_AMT (총합계)
    
    // 표(그리드)에 입력된 여러 품목들을 담을 리스트
    private List<QuoteDtlVO> lines;

}