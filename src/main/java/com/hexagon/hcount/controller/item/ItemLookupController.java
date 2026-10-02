package com.hexagon.hcount.controller.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.hexagon.hcount.service.item.ItemService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class ItemLookupController {
	
	private final ItemService service;

}
