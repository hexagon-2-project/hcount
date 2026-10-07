package com.hexagon.hcount.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.dao.DataAccessException;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import com.hexagon.hcount.domain.order.OrderCriteria;
import com.hexagon.hcount.domain.order.OrderPageDTO;

import com.hexagon.hcount.service.order.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 주문서 검색 결과를 화면에 전달
// 受注の検索結果を画面に渡す
@Controller
@AllArgsConstructor
@Slf4j
public class OrderListController {
	private final OrderService service;

	@GetMapping("/order/order-list")
	public String page(@ModelAttribute("cri") OrderCriteria cri, BindingResult binding,
			Model model, HttpServletResponse response) {
		cri.normalize();
		model.addAttribute("list", Collections.emptyList());
		model.addAttribute("pageMaker", new OrderPageDTO(new OrderCriteria(), 0));
		String validation = binding.hasErrors() ? "検索条件の形式を確認してください。" : cri.validate();
		if (validation != null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			model.addAttribute("searchError", validation);
		}
		try {
			model.addAttribute("partnerOptions", service.getPartnerOptions());
			model.addAttribute("empOptions", service.getEmpOptions());
			model.addAttribute("whOptions", service.getWhOptions());
			model.addAttribute("statusOptions", service.getStatusOptions());
			if (validation == null) {
				// 전체 건수를 먼저 구해서 페이지 계산하기
				// 全件数を先に取得してページを計算する
				model.addAttribute("pageMaker", new OrderPageDTO(cri, service.getTotal(cri)));
				model.addAttribute("list", service.getList(cri));
			}
		} catch (DataAccessException ex) {
			response.setStatus(HttpServletResponse.SC_SERVICE_UNAVAILABLE);
			model.addAttribute("dbError", "データを取得できませんでした。接続を確認して再検索してください。");
			model.addAttribute("list", Collections.emptyList());
			// 오류 종류만 로그에 남기기
			// エラーの種類だけログに残す
			log.warn("Order list query failed: {}", ex.getClass().getSimpleName());
		}
		return "order/order-list";
	}
}
