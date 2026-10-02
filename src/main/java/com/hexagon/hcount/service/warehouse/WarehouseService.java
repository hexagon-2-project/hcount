package com.hexagon.hcount.service.warehouse;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.warehouse.WarehouseMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WarehouseService {
	private final WarehouseMapper mapper;
}
