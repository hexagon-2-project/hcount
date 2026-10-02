package com.hexagon.hcount.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hexagon.hcount.service.partner.PartnerService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
    
	private final PartnerService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "basic/partner-list";
	}

}
