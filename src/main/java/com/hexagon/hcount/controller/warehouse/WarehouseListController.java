package com.hexagon.hcount.controller.warehouse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.warehouse.WarehouseService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class WarehouseListController {
	private final WarehouseService service;

	@GetMapping("/basic/warehouse-list")
	public String page() {
		return "basic/warehouse-list";
	}
}
