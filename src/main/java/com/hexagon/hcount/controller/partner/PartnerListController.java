package com.hexagon.hcount.controller.partner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.partner.PartnerService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class PartnerListController {
	private final PartnerService service;

	@GetMapping("/basic/partner-list")
	public String page() {
		return "basic/partner-list";
	}
}
