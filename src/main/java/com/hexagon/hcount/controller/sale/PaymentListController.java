package com.hexagon.hcount.controller.sale;

import com.hexagon.hcount.service.sale.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentListController {
    private final PaymentService service;

    @Autowired
    public PaymentListController(PaymentService service) {
        this.service = service;
    }


    @GetMapping("/sale/payment-list")
    public String page() {
        return "sale/payment-list";
    }
}
