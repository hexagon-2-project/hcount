package com.hexagon.hcount.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.order.OrderService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class OrderReleaseController {
	private final OrderService service;

	@GetMapping("/order/order-release")
	public String page() {
		return "order/order-release";
	}
}
