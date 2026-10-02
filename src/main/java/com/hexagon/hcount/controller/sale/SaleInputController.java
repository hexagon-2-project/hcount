package com.hexagon.hcount.controller.sale;

import com.hexagon.hcount.service.sale.SaleService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SaleInputController {
    private final SaleService service;

    @Autowired
    public SaleInputController(SaleService service) {
        this.service = service;
    }


    @GetMapping("/sale/sale-input")
    public String page() {
        return "sale/sale-input";
    }
}
