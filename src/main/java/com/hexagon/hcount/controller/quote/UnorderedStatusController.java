package com.hexagon.hcount.controller.quote;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.quote.QuoteService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UnorderedStatusController {
	private final QuoteService service;

	@GetMapping("/quote/unordered-status")
	public String page() {
		return "quote/unordered-status";
	}
}
