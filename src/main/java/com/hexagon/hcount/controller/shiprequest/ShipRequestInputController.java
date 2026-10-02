package com.hexagon.hcount.controller.shiprequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.shiprequest.ShipRequestService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ShipRequestInputController {
	private final ShipRequestService service;

	@GetMapping("/shiprequest/input")
	public String page() {
		return "dispatch/dispatch-input";
	}
}
