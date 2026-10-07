package com.hexagon.hcount.service.warehouse;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Arrays;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import com.hexagon.hcount.domain.warehouse.WarehousePage;
import com.hexagon.hcount.domain.warehouse.WarehouseSearchCriteria;
import com.hexagon.hcount.domain.warehouse.WarehouseVO;
import com.hexagon.hcount.mapper.warehouse.WarehouseMapper;

@RunWith(MockitoJUnitRunner.class)
public class WarehouseServiceTests {
	@Mock
	private WarehouseMapper mapper;

	private WarehouseService service;

	@Before
	public void setUp() {
		service = new WarehouseService(mapper);
	}

	@Test
	public void getWarehousesNormalizesSearchAndBuildsPage() {
		WarehouseVO warehouse = warehouse("HJ-WH-001", "황가창고");
		when(mapper.selectWarehouses(any(WarehouseSearchCriteria.class))).thenReturn(Arrays.asList(warehouse));
		when(mapper.countWarehouses(any(WarehouseSearchCriteria.class))).thenReturn(60);

		WarehousePage result = service.getWarehouses("  지호  ", 0, 500, true);

		assertEquals("지호", result.getKeyword());
		assertEquals(1, result.getPage());
		assertEquals(20, result.getAmount());
		assertEquals(60, result.getTotalCount());
		assertEquals(3, result.getEndPage());
		assertTrue(result.isIncludeInactive());
	}

	@Test
	public void registerTrimsValuesAndUsesDefaultType() {
		WarehouseVO warehouse = warehouse(" HJ-WH-001 ", " 지호창고 ");
		warehouse.setWarehouseType(null);
		when(mapper.selectWarehouseByCode("HJ-WH-001")).thenReturn(null);
		when(mapper.insertWarehouse(any(WarehouseVO.class))).thenReturn(1);

		service.register(warehouse);

		ArgumentCaptor<WarehouseVO> captor = ArgumentCaptor.forClass(WarehouseVO.class);
		verify(mapper).insertWarehouse(captor.capture());
		assertEquals("HJ-WH-001", captor.getValue().getWarehouseCode());
		assertEquals("지호창고", captor.getValue().getWarehouseName());
		assertEquals("NORMAL", captor.getValue().getWarehouseType());
		assertEquals("Y", captor.getValue().getUseYn());
	}

	@Test
	public void registerKeepsInactiveStatus() {
		WarehouseVO warehouse = warehouse("HJ-WH-002", "황지호창고");
		warehouse.setUseYn("N");
		when(mapper.selectWarehouseByCode("HJ-WH-002")).thenReturn(null);
		when(mapper.insertWarehouse(any(WarehouseVO.class))).thenReturn(1);

		service.register(warehouse);

		ArgumentCaptor<WarehouseVO> captor = ArgumentCaptor.forClass(WarehouseVO.class);
		verify(mapper).insertWarehouse(captor.capture());
		assertEquals("N", captor.getValue().getUseYn());
	}

	@Test(expected = IllegalArgumentException.class)
	public void registerRejectsDuplicateCode() {
		WarehouseVO warehouse = warehouse("HJ-WH-001", "황가창고");
		when(mapper.selectWarehouseByCode("HJ-WH-001")).thenReturn(new WarehouseVO());
		service.register(warehouse);
	}

	@Test
	public void modifyReturnsMapperResult() {
		WarehouseVO warehouse = warehouse("HJ-WH-001", "지호창고");
		warehouse.setWarehouseId(10L);
		when(mapper.updateWarehouse(warehouse)).thenReturn(1);
		assertTrue(service.modify(warehouse));
	}

	@Test
	public void toggleUseChangesYToNAndReturnsFalseWhenMissing() {
		WarehouseVO active = warehouse("HJ-WH-001", "황가창고");
		active.setWarehouseId(10L);
		active.setUseYn("Y");
		when(mapper.selectWarehouse(10L)).thenReturn(active);
		when(mapper.updateUseYn(10L, "N")).thenReturn(1);

		assertTrue(service.toggleUse(10L));
		verify(mapper).updateUseYn(10L, "N");
		when(mapper.selectWarehouse(99L)).thenReturn(null);
		assertFalse(service.toggleUse(99L));
	}

	private WarehouseVO warehouse(String code, String name) {
		WarehouseVO warehouse = new WarehouseVO();
		warehouse.setWarehouseCode(code);
		warehouse.setWarehouseName(name);
		warehouse.setWarehouseType("NORMAL");
		return warehouse;
	}
}
