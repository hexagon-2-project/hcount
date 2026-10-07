package com.hexagon.hcount.controller.warehouse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hexagon.hcount.domain.warehouse.WarehousePage;
import com.hexagon.hcount.domain.warehouse.WarehouseVO;
import com.hexagon.hcount.service.warehouse.WarehouseService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class WarehouseListController {
	private final WarehouseService service;

	@GetMapping("/basic/warehouse-list")
	// 목록과 등록·수정 창에 필요한 데이터를 같이 준비한다
	// リストと登録・修正画面に必要なデータを一緒に準備する
	public String page(@RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "editId", required = false) Long editId,
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive, Model model) {
		WarehousePage warehousePage = service.getWarehouses(keyword, page, 20, includeInactive);
		model.addAttribute("warehousePage", warehousePage);
		model.addAttribute("q", warehousePage.getKeyword());
		model.addAttribute("includeInactive", warehousePage.isIncludeInactive());
		model.addAttribute("openNew", "new".equals(mode));
		if (editId != null) {
			WarehouseVO editingWarehouse = service.getWarehouse(editId);
			if (editingWarehouse != null) {
				model.addAttribute("editingWarehouse", editingWarehouse);
			}
		}
		return "basic/warehouse-list";
	}

	@PostMapping("/basic/warehouse/register")
	public String register(@ModelAttribute WarehouseVO warehouse,
			@RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive,
			RedirectAttributes redirectAttributes) {
		try {
			service.register(warehouse);
			redirectAttributes.addFlashAttribute("message", "창고가 등록되었습니다.");
		} catch (IllegalArgumentException | IllegalStateException exception) {
			redirectAttributes.addFlashAttribute("error", exception.getMessage());
		}
		addListParameters(redirectAttributes, keyword, page, includeInactive);
		return "redirect:/basic/warehouse-list";
	}

	@PostMapping("/basic/warehouse/update")
	public String update(@ModelAttribute WarehouseVO warehouse,
			@RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive,
			RedirectAttributes redirectAttributes) {
		try {
			if (service.modify(warehouse)) {
				redirectAttributes.addFlashAttribute("message", "창고가 수정되었습니다.");
			} else {
				redirectAttributes.addFlashAttribute("error", "수정할 창고를 찾지 못했습니다.");
			}
		} catch (IllegalArgumentException exception) {
			redirectAttributes.addFlashAttribute("error", exception.getMessage());
		}
		addListParameters(redirectAttributes, keyword, page, includeInactive);
		return "redirect:/basic/warehouse-list";
	}

	@PostMapping("/basic/warehouse/toggle-use")
	public String toggleUse(@RequestParam("warehouseId") Long warehouseId,
			@RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive,
			RedirectAttributes redirectAttributes) {
		if (service.toggleUse(warehouseId)) {
			redirectAttributes.addFlashAttribute("message", "사용 상태가 변경되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("error", "변경할 창고를 찾지 못했습니다.");
		}
		addListParameters(redirectAttributes, keyword, page, includeInactive);
		return "redirect:/basic/warehouse-list";
	}

	// 처리 후에도 검색 위치 유지
	// 処理後も検索位置を維持
	private void addListParameters(RedirectAttributes redirectAttributes, String keyword, Integer page,
			boolean includeInactive) {
		if (keyword != null && !keyword.trim().isEmpty()) {
			redirectAttributes.addAttribute("q", keyword.trim());
		}
		if (page != null && page > 1) {
			redirectAttributes.addAttribute("page", page);
		}
		if (includeInactive) {
			redirectAttributes.addAttribute("includeInactive", true);
		}
	}
}
