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

// 실제 DB 없이 Service 로직 확인
// 実際のDBなしでServiceロジックを確認
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
	// 검색어와 페이지 기본값 확인
	// 検索語とページ基本値を確認
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
	// 등록값 공백과 기본값 확인
	// 登録値の空白と基本値を確認
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
	}

	@Test(expected = IllegalArgumentException.class)
	// 중복 코드 차단 확인
	// 重複コードの遮断を確認
	public void registerRejectsDuplicateCode() {
		PartnerVO partner = partner("HJ001", "황가상사");
		when(mapper.selectPartnerByCode("HJ001")).thenReturn(new PartnerVO());
		service.register(partner);
	}

	@Test
	// 수정 결과 확인
	// 修正結果を確認
	public void modifyReturnsMapperResult() {
		PartnerVO partner = partner("HJ001", "지호상사");
		partner.setPartnerId(10L);
		when(mapper.updatePartner(partner)).thenReturn(1);
		assertTrue(service.modify(partner));
	}

	@Test
	// 사용상태 변경 확인
	// 使用状態の変更を確認
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

	private PartnerVO partner(String code, String name) {
		PartnerVO partner = new PartnerVO();
		partner.setPartnerCode(code);
		partner.setPartnerName(name);
		partner.setPartnerType("SALES");
		return partner;
	}
}
