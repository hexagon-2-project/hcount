package com.hexagon.hcount.controller.sale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.sale.PaymentService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class PaymentCompareController {
	private final PaymentService service;

	@GetMapping("/sale/payment-compare")
	public String page() {
		return "sale/payment-compare";
	}
}
