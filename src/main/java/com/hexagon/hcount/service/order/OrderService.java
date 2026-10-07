package com.hexagon.hcount.service.order;

import com.hexagon.hcount.mapper.order.OrderMapper;
import com.hexagon.hcount.domain.order.OrderCriteria;
import com.hexagon.hcount.domain.order.OrderListVO;
import com.hexagon.hcount.domain.order.OrderSearchOptionVO;
import java.util.List;

import lombok.AllArgsConstructor;

import org.springframework.stereotype.Service;

// 주문서 목록과 검색에 필요한 데이터 가져오기
// 受注一覧と検索に必要なデータを取得する
@Service
@AllArgsConstructor
public class OrderService {
	private final OrderMapper mapper;
	public List<OrderListVO> getList(OrderCriteria cri) { return mapper.getListWithPaging(cri); }
	public long getTotal(OrderCriteria cri) { return mapper.getTotalCount(cri); }
	public List<OrderSearchOptionVO> getPartnerOptions() { return mapper.getPartnerOptions(); }
	public List<OrderSearchOptionVO> getEmpOptions() { return mapper.getEmpOptions(); }
	public List<OrderSearchOptionVO> getWhOptions() { return mapper.getWhOptions(); }
	public List<String> getStatusOptions() { return mapper.getStatusOptions(); }
}
