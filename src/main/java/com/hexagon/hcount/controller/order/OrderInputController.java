package com.hexagon.hcount.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.order.OrderService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class OrderInputController {
	private final OrderService service;

	@GetMapping("/order/order-input")
	public String page() {
		return "order/order-input";
	}
}
