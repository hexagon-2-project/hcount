package com.hexagon.hcount.service.sale;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.sale.SaleMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SaleService {
	private final SaleMapper mapper;

}
