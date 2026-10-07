package com.hexagon.hcount.controller.partner;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hexagon.hcount.domain.partner.PartnerPage;
import com.hexagon.hcount.domain.partner.PartnerVO;
import com.hexagon.hcount.service.partner.PartnerService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class PartnerListController {
	private final PartnerService service;

	@GetMapping("/basic/partner-list")
	// 거래처 목록 화면 열기
	// 取引先リスト画面を開く
	public String page(@RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "editId", required = false) Long editId,
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive, Model model) {
		PartnerPage partnerPage = service.getPartners(keyword, page, 20, includeInactive);
		model.addAttribute("partnerPage", partnerPage);
		model.addAttribute("q", partnerPage.getKeyword());
		model.addAttribute("includeInactive", partnerPage.isIncludeInactive());
		model.addAttribute("openNew", "new".equals(mode));
		if (editId != null) {
			PartnerVO editingPartner = service.getPartner(editId);
			if (editingPartner != null) {
				model.addAttribute("editingPartner", editingPartner);
			}
		}
		return "basic/partner-list";
	}

	@PostMapping("/basic/partner/register")
	// 신규 거래처 저장
	// 新しい取引先を保存
	public String register(@ModelAttribute PartnerVO partner, @RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive,
			RedirectAttributes redirectAttributes) {
		try {
			service.register(partner);
			redirectAttributes.addFlashAttribute("message", "거래처가 등록되었습니다.");
		} catch (IllegalArgumentException | IllegalStateException exception) {
			redirectAttributes.addFlashAttribute("error", exception.getMessage());
		}
		addListParameters(redirectAttributes, keyword, page, includeInactive);
		return "redirect:/basic/partner-list";
	}

	@PostMapping("/basic/partner/update")
	// 선택한 거래처 수정
	// 選択した取引先を修正
	public String update(@ModelAttribute PartnerVO partner, @RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive,
			RedirectAttributes redirectAttributes) {
		try {
			if (service.modify(partner)) {
				redirectAttributes.addFlashAttribute("message", "거래처가 수정되었습니다.");
			} else {
				redirectAttributes.addFlashAttribute("error", "수정할 거래처를 찾지 못했습니다.");
			}
		} catch (IllegalArgumentException exception) {
			redirectAttributes.addFlashAttribute("error", exception.getMessage());
		}
		addListParameters(redirectAttributes, keyword, page, includeInactive);
		return "redirect:/basic/partner-list";
	}

	@PostMapping("/basic/partner/toggle-use")
	// 사용중단 또는 재사용 처리
	// 使用停止または再使用を処理
	public String toggleUse(@RequestParam("partnerId") Long partnerId,
			@RequestParam(value = "q", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "includeInactive", defaultValue = "false") boolean includeInactive,
			RedirectAttributes redirectAttributes) {
		if (service.toggleUse(partnerId)) {
			redirectAttributes.addFlashAttribute("message", "사용 상태가 변경되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("error", "변경할 거래처를 찾지 못했습니다.");
		}
		addListParameters(redirectAttributes, keyword, page, includeInactive);
		return "redirect:/basic/partner-list";
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
