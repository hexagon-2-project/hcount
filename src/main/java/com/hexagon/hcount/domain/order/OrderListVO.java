package com.hexagon.hcount.domain.order;

import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

// 주문서 목록에 보여줄 값
// 受注一覧に表示する値
@Data
public class OrderListVO {
    private Long ordId;
    private String ordNo;
    private Date ordDt;
    private Date dueDt;
    private Long partnerId;
    private String partnerCd;
    private String partnerNm;
    private Long empId;
    private Long whId;
    private String itemSummary;
    private int detailCount;
    private BigDecimal totAmt;
    private String currCd;
    private String status;
}
