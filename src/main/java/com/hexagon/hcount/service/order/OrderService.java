package com.hexagon.hcount.service.order;

import com.hexagon.hcount.mapper.order.OrderMapper;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OrderService {
	private final OrderMapper mapper;

}
