package com.hexagon.hcount.domain.quote;

import lombok.Data;

@Data
public class QuoteDtlVO {
    private Long quoteDtlId;  // QUOTE_DTL_ID (PK)
    private Long quoteId;     // QUOTE_ID (FK)
    private Integer seqNo;    // SEQ_NO (순번)
    private Long itemId;      // ITEM_ID (품목 ID)
    private Double qty;       // QTY (수량)
    private Double unitPrice; // UNIT_PRICE (단가)
    private Double supAmt;    // SUP_AMT (공급가액)
    private Double taxAmt;    // TAX_AMT (부가세)
    private Double totAmt;    // TOT_AMT (합계금액)
    private String memo;      // MEMO (적요 - 화면의 '새로운 항목 추가')


}