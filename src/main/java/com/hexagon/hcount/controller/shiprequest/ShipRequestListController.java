package com.hexagon.hcount.controller.shiprequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.shiprequest.ShipRequestService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ShipRequestListController {
	private final ShipRequestService service;

	@GetMapping("/shiprequest/list")
	public String page() {
		return "dispatch/dispatch-list";
	}
}
