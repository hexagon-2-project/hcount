package com.hexagon.hcount.service.partner;

import java.util.Locale;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hexagon.hcount.domain.partner.PartnerPage;
import com.hexagon.hcount.domain.partner.PartnerSearchCriteria;
import com.hexagon.hcount.domain.partner.PartnerVO;
import com.hexagon.hcount.mapper.partner.PartnerMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PartnerServiceImpl implements PartnerService {
	private final PartnerMapper mapper;

	@Override
	@Transactional(readOnly = true)
	// 검색 조건으로 목록 조회
	// 検索条件でリストを照会
	public PartnerPage getPartners(String keyword, Integer page, Integer amount, boolean includeInactive) {
		PartnerSearchCriteria criteria = new PartnerSearchCriteria(keyword, page, amount, includeInactive);
		return new PartnerPage(mapper.selectPartners(criteria), criteria, mapper.countPartners(criteria));
	}

	@Override
	@Transactional(readOnly = true)
	public PartnerVO getPartner(Long partnerId) {
		if (partnerId == null) {
			return null;
		}
		return mapper.selectPartner(partnerId);
	}

	@Override
	@Transactional
	// 중복 코드를 확인한 뒤 등록
	// コードの重複を確認してから登録
	public void register(PartnerVO partner) {
		normalizeAndValidate(partner);
		if (mapper.selectPartnerByCode(partner.getPartnerCode()) != null) {
			throw new IllegalArgumentException("이미 사용 중인 거래처코드입니다.");
		}
		if (mapper.insertPartner(partner) != 1) {
			throw new IllegalStateException("거래처를 등록하지 못했습니다.");
		}
	}

	@Override
	@Transactional
	public boolean modify(PartnerVO partner) {
		if (partner == null || partner.getPartnerId() == null) {
			throw new IllegalArgumentException("수정할 거래처를 선택해 주세요.");
		}
		normalizeAndValidate(partner);
		return mapper.updatePartner(partner) == 1;
	}

	@Override
	@Transactional
	public boolean toggleUse(Long partnerId) {
		PartnerVO partner = getPartner(partnerId);
		if (partner == null) {
			return false;
		}
		String nextUseYn = "Y".equalsIgnoreCase(partner.getUseYn()) ? "N" : "Y";
		return mapper.updateUseYn(partnerId, nextUseYn) == 1;
	}

	@Override
	@Transactional
	// 데이터는 남기고 삭제 여부만 변경한다
	// データは残して削除状態だけ変更する
	public boolean deletePartner(Long partnerId) {
		if (partnerId == null || getPartner(partnerId) == null) {
			return false;
		}
		return mapper.softDeletePartner(partnerId) == 1;
	}

	// 공백 정리하고 필수값 확인
	// 空白を整理して必須値を確認
	private void normalizeAndValidate(PartnerVO partner) {
		if (partner == null) {
			throw new IllegalArgumentException("거래처 정보를 입력해 주세요.");
		}
		partner.setPartnerCode(trim(partner.getPartnerCode()));
		partner.setPartnerName(trim(partner.getPartnerName()));
		partner.setPartnerType(upperOrDefault(partner.getPartnerType(), "SALES"));
		partner.setBizNo(trimToNull(partner.getBizNo()));
		partner.setCeoName(trimToNull(partner.getCeoName()));
		partner.setBizType(trimToNull(partner.getBizType()));
		partner.setBizItem(trimToNull(partner.getBizItem()));
		partner.setTel(trimToNull(partner.getTel()));
		partner.setFax(trimToNull(partner.getFax()));
		partner.setContactName(trimToNull(partner.getContactName()));
		partner.setEmail(trimToNull(partner.getEmail()));
		partner.setMobile(trimToNull(partner.getMobile()));
		partner.setZipCode1(trimToNull(partner.getZipCode1()));
		partner.setAddress1(trimToNull(partner.getAddress1()));
		partner.setZipCode2(trimToNull(partner.getZipCode2()));
		partner.setAddress2(trimToNull(partner.getAddress2()));
		partner.setSearchText(trimToNull(partner.getSearchText()));
		partner.setHomepage(trimToNull(partner.getHomepage()));
		partner.setCurrencyCode(upperOrDefault(partner.getCurrencyCode(), "KRW"));
		partner.setUseYn("N".equalsIgnoreCase(trim(partner.getUseYn())) ? "N" : "Y");
		partner.setDelYn("N");
		if (partner.getPartnerCode().isEmpty()) {
			throw new IllegalArgumentException("거래처코드를 입력해 주세요.");
		}
		if (partner.getPartnerName().isEmpty()) {
			throw new IllegalArgumentException("상호를 입력해 주세요.");
		}
		if (!"SALES".equals(partner.getPartnerType()) && !"PURCHASE".equals(partner.getPartnerType())
				&& !"BOTH".equals(partner.getPartnerType())) {
			throw new IllegalArgumentException("거래처구분을 확인해 주세요.");
		}
	}

	private String trim(String value) {
		return value == null ? "" : value.trim();
	}

	private String trimToNull(String value) {
		String trimmed = trim(value);
		return trimmed.isEmpty() ? null : trimmed;
	}

	private String upperOrDefault(String value, String defaultValue) {
		String trimmed = trim(value);
		return trimmed.isEmpty() ? defaultValue : trimmed.toUpperCase(Locale.ROOT);
	}
}
