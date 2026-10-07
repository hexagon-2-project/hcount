package com.hexagon.hcount.service.partner;

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

import com.hexagon.hcount.domain.partner.PartnerPage;
import com.hexagon.hcount.domain.partner.PartnerSearchCriteria;
import com.hexagon.hcount.domain.partner.PartnerVO;
import com.hexagon.hcount.mapper.partner.PartnerMapper;

@RunWith(MockitoJUnitRunner.class)
public class PartnerServiceTests {
	@Mock
	private PartnerMapper mapper;

	private PartnerServiceImpl service;

	@Before
	public void setUp() {
		service = new PartnerServiceImpl(mapper);
	}

	@Test
	public void getPartnersNormalizesSearchAndBuildsPage() {
		PartnerVO partner = partner("HJ001", "황가상사");
		when(mapper.selectPartners(any(PartnerSearchCriteria.class))).thenReturn(Arrays.asList(partner));
		when(mapper.countPartners(any(PartnerSearchCriteria.class))).thenReturn(120);

		PartnerPage result = service.getPartners("  황가  ", 0, 500, true);

		assertEquals("황가", result.getKeyword());
		assertEquals(1, result.getPage());
		assertEquals(20, result.getAmount());
		assertEquals(120, result.getTotalCount());
		assertEquals(5, result.getEndPage());
		assertTrue(result.isIncludeInactive());
	}

	@Test
	public void registerTrimsValuesAndUsesDefaults() {
		PartnerVO partner = partner(" HJ001 ", " 황가상사 ");
		partner.setPartnerType(null);
		partner.setCurrencyCode(null);
		when(mapper.selectPartnerByCode("HJ001")).thenReturn(null);
		when(mapper.insertPartner(any(PartnerVO.class))).thenReturn(1);

		service.register(partner);

		ArgumentCaptor<PartnerVO> captor = ArgumentCaptor.forClass(PartnerVO.class);
		verify(mapper).insertPartner(captor.capture());
		assertEquals("HJ001", captor.getValue().getPartnerCode());
		assertEquals("황가상사", captor.getValue().getPartnerName());
		assertEquals("SALES", captor.getValue().getPartnerType());
		assertEquals("KRW", captor.getValue().getCurrencyCode());
		assertEquals("Y", captor.getValue().getUseYn());
		assertEquals("N", captor.getValue().getDelYn());
	}

	@Test
	public void registerKeepsInactiveStatus() {
		PartnerVO partner = partner("HJ002", "황지호상사");
		partner.setUseYn("N");
		when(mapper.selectPartnerByCode("HJ002")).thenReturn(null);
		when(mapper.insertPartner(any(PartnerVO.class))).thenReturn(1);

		service.register(partner);

		ArgumentCaptor<PartnerVO> captor = ArgumentCaptor.forClass(PartnerVO.class);
		verify(mapper).insertPartner(captor.capture());
		assertEquals("N", captor.getValue().getUseYn());
	}

	@Test(expected = IllegalArgumentException.class)
	public void registerRejectsDuplicateCode() {
		PartnerVO partner = partner("HJ001", "황가상사");
		when(mapper.selectPartnerByCode("HJ001")).thenReturn(new PartnerVO());
		service.register(partner);
	}

	@Test
	public void modifyReturnsMapperResult() {
		PartnerVO partner = partner("HJ001", "지호상사");
		partner.setPartnerId(10L);
		when(mapper.updatePartner(partner)).thenReturn(1);
		assertTrue(service.modify(partner));
	}

	@Test
	public void toggleUseChangesYToNAndReturnsFalseWhenMissing() {
		PartnerVO active = partner("HJ001", "황가상사");
		active.setPartnerId(10L);
		active.setUseYn("Y");
		when(mapper.selectPartner(10L)).thenReturn(active);
		when(mapper.updateUseYn(10L, "N")).thenReturn(1);
		assertTrue(service.toggleUse(10L));
		verify(mapper).updateUseYn(10L, "N");

		when(mapper.selectPartner(99L)).thenReturn(null);
		assertFalse(service.toggleUse(99L));
	}

	@Test
	public void deletePartnerChangesOnlyDeleteStatus() {
		PartnerVO partner = partner("HJ003", "지호상사");
		partner.setPartnerId(10L);
		when(mapper.selectPartner(10L)).thenReturn(partner);
		when(mapper.softDeletePartner(10L)).thenReturn(1);

		assertTrue(service.deletePartner(10L));
		verify(mapper).softDeletePartner(10L);
		when(mapper.selectPartner(99L)).thenReturn(null);
		assertFalse(service.deletePartner(99L));
	}

	private PartnerVO partner(String code, String name) {
		PartnerVO partner = new PartnerVO();
		partner.setPartnerCode(code);
		partner.setPartnerName(name);
		partner.setPartnerType("SALES");
		return partner;
	}
}
