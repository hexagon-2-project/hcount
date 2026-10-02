package com.hexagon.hcount.service.quote;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.quote.QuoteMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class QuoteService {
	private final QuoteMapper mapper;

}
