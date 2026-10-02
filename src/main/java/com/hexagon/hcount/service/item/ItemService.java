package com.hexagon.hcount.service.item;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.item.ItemMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ItemService {
	private final ItemMapper mapper;

}
