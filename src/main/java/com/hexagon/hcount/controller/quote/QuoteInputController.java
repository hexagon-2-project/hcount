package com.hexagon.hcount.controller.quote;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hexagon.hcount.service.quote.QuoteService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class QuoteInputController {
	private final QuoteService service;

	@GetMapping("/quote/quote-input")
	public String page() {
		return "quote/quote-input";
	}
}
