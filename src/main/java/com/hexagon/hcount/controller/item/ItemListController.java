package com.hexagon.hcount.controller.item;

import com.hexagon.hcount.service.item.ItemService;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@AllArgsConstructor
public class ItemListController {

	private final ItemService service;

    @GetMapping("/basic/item-list")
    public String page() {
        return "basic/item-list";
    }
}
