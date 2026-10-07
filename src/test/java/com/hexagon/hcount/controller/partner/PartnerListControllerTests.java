package com.hexagon.hcount.controller.partner;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Collections;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.hexagon.hcount.domain.partner.PartnerPage;
import com.hexagon.hcount.domain.partner.PartnerSearchCriteria;
import com.hexagon.hcount.domain.partner.PartnerVO;
import com.hexagon.hcount.service.partner.PartnerService;

// 실제 DB 없이 Controller 동작 확인
// 実際のDBなしでController動作を確認
@RunWith(MockitoJUnitRunner.class)
public class PartnerListControllerTests {
	@Mock
	private PartnerService service;

	private MockMvc mockMvc;

	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.standaloneSetup(new PartnerListController(service)).build();
	}

	@Test
	// 목록 화면 테스트
	// リスト画面テスト
	public void listLoadsPartnerPage() throws Exception {
		PartnerPage page = new PartnerPage(Collections.<PartnerVO>emptyList(), new PartnerSearchCriteria("지호", 1, 20, true), 0);
		when(service.getPartners("지호", 1, 20, true)).thenReturn(page);

		mockMvc.perform(get("/basic/partner-list").param("q", "지호").param("page", "1").param("includeInactive", "true"))
				.andExpect(status().isOk())
				.andExpect(view().name("basic/partner-list"))
				.andExpect(model().attribute("partnerPage", page))
				.andExpect(model().attribute("q", "지호"))
				.andExpect(model().attribute("includeInactive", true));
	}

	@Test
	// 등록 후 목록 이동 테스트
	// 登録後のリスト移動テスト
	public void registerRedirectsToList() throws Exception {
		mockMvc.perform(post("/basic/partner/register")
				.param("partnerCode", "HJ001").param("partnerName", "지호상사").param("partnerType", "SALES"))
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("/basic/partner-list"))
				.andExpect(flash().attribute("message", "거래처가 등록되었습니다."));
		verify(service).register(any(PartnerVO.class));
	}

	@Test
	// 사용상태 변경 후 검색 위치 확인
	// 使用状態変更後の検索位置を確認
	public void toggleUseKeepsSearchPosition() throws Exception {
		when(service.toggleUse(10L)).thenReturn(true);
		mockMvc.perform(post("/basic/partner/toggle-use")
				.param("partnerId", "10").param("q", "jiho").param("page", "2")
				.param("includeInactive", "true"))
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("/basic/partner-list?q=jiho&page=2&includeInactive=true"))
				.andExpect(flash().attribute("message", "사용 상태가 변경되었습니다."));
		verify(service).toggleUse(10L);
	}
}
