package com.hexagon.hcount.controller.sale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.sale.SaleService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class SaleInputIIController {
	private final SaleService service;

	@GetMapping("/sale/sale-input-ii")
	public String page() {
		return "sale/sale-input-ii";
	}
}
