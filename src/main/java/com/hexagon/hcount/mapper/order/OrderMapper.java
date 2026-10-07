package com.hexagon.hcount.mapper.order;

import java.util.List;
import com.hexagon.hcount.domain.order.OrderCriteria;
import com.hexagon.hcount.domain.order.OrderListVO;
import com.hexagon.hcount.domain.order.OrderSearchOptionVO;

// 주문서 조회에 필요한 메서드
// 受注照会に使うメソッド
public interface OrderMapper {
    List<OrderListVO> getListWithPaging(OrderCriteria cri);
    long getTotalCount(OrderCriteria cri);
    List<OrderSearchOptionVO> getPartnerOptions();
    List<OrderSearchOptionVO> getEmpOptions();
    List<OrderSearchOptionVO> getWhOptions();
    List<String> getStatusOptions();
}
