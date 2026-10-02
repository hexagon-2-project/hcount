package com.hexagon.hcount.controller.shipment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.shipment.ShipmentService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ShipmentInputController {
	private final ShipmentService service;

	@GetMapping("/shipment/shipment-input")
	public String page() {
		return "shipment/shipment-input";
	}
}
