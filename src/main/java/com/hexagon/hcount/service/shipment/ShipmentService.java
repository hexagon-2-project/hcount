package com.hexagon.hcount.service.shipment;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.shipment.ShipmentMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ShipmentService {
	private final ShipmentMapper mapper;

}
