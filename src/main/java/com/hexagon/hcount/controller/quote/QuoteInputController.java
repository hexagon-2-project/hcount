package com.hexagon.hcount.controller.quote;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hexagon.hcount.domain.quote.QuoteVO;
import com.hexagon.hcount.service.quote.QuoteService;

@Controller
public class QuoteInputController {

    @Autowired
    private QuoteService quoteService;

    // 화면 띄우기
    @GetMapping("/quote/quote-input")
    public String page() {
        return "quote/quote-input";
    }

    // 저장 처리하기
    @PostMapping("/quote/quote-input/save")
    @ResponseBody
    public ResponseEntity<String> saveQuote(@RequestBody QuoteVO quoteVO) {
        try {
            quoteService.saveQuote(quoteVO);
            return ResponseEntity.ok("success");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body("fail");
        }
    }
    
 // 현준님 작업이 끝나기 전까지 임시로 쓸 더미데이터 (Dummy API)
    @GetMapping("/quote/dummy-items")
    @ResponseBody
    public List<Map<String, Object>> lookupDummyItems(String q) {
        List<Map<String, Object>> items = new java.util.ArrayList<>();
        
        Map<String, Object> item1 = new java.util.HashMap<>();
        item1.put("itemId", 1L);     // DB에 들어있다는 더미데이터의 ID값
        item1.put("code", "ITM001");
        item1.put("name", "더미 품목 1 (테스트용)");
        items.add(item1);

        Map<String, Object> item2 = new java.util.HashMap<>();
        item2.put("itemId", 2L);
        item2.put("code", "ITM002");
        item2.put("name", "더미 품목 2 (테스트용)");
        items.add(item2);

        return items;
    }
}