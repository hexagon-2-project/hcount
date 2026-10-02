package com.hexagon.hcount.service.sale;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.sale.PaymentMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PaymentService {
	private final PaymentMapper mapper;

}
