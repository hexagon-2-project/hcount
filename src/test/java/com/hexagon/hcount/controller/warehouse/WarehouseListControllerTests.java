package com.hexagon.hcount.controller.warehouse;

import static org.junit.Assert.assertEquals;
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
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.hexagon.hcount.domain.warehouse.WarehousePage;
import com.hexagon.hcount.domain.warehouse.WarehouseSearchCriteria;
import com.hexagon.hcount.domain.warehouse.WarehouseVO;
import com.hexagon.hcount.service.warehouse.WarehouseService;

@RunWith(MockitoJUnitRunner.class)
public class WarehouseListControllerTests {
	@Mock
	private WarehouseService service;

	private MockMvc mockMvc;

	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.standaloneSetup(new WarehouseListController(service)).build();
	}

	@Test
	public void listLoadsWarehousePage() throws Exception {
		WarehousePage page = new WarehousePage(Collections.<WarehouseVO>emptyList(),
				new WarehouseSearchCriteria("지호", 1, 20, true), 0);
		when(service.getWarehouses("지호", 1, 20, true)).thenReturn(page);

		mockMvc.perform(get("/basic/warehouse-list").param("q", "지호").param("page", "1")
				.param("includeInactive", "true"))
				.andExpect(status().isOk())
				.andExpect(view().name("basic/warehouse-list"))
				.andExpect(model().attribute("warehousePage", page))
				.andExpect(model().attribute("q", "지호"))
				.andExpect(model().attribute("includeInactive", true));
	}

	@Test
	public void registerRedirectsToList() throws Exception {
		mockMvc.perform(post("/basic/warehouse/register").param("warehouseCode", "HJ-WH-001")
				.param("warehouseName", "황가창고").param("warehouseType", "NORMAL").param("useYn", "N"))
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("/basic/warehouse-list"))
				.andExpect(flash().attribute("message", "창고가 등록되었습니다."));
		ArgumentCaptor<WarehouseVO> captor = ArgumentCaptor.forClass(WarehouseVO.class);
		verify(service).register(captor.capture());
		assertEquals("N", captor.getValue().getUseYn());
	}

	@Test
	public void toggleUseKeepsSearchPosition() throws Exception {
		when(service.toggleUse(10L)).thenReturn(true);
		mockMvc.perform(post("/basic/warehouse/toggle-use").param("warehouseId", "10")
				.param("q", "HJ-WH").param("page", "2").param("includeInactive", "true"))
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("/basic/warehouse-list?q=HJ-WH&page=2&includeInactive=true"))
				.andExpect(flash().attribute("message", "사용 상태가 변경되었습니다."));
		verify(service).toggleUse(10L);
	}
}
