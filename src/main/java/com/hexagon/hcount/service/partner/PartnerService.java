package com.hexagon.hcount.service.partner;

import com.hexagon.hcount.domain.partner.PartnerPage;
import com.hexagon.hcount.domain.partner.PartnerVO;

// Controller와 Mapper 사이에서 거래처 기능을 처리
// ControllerとMapperの間で取引先機能を処理
public interface PartnerService {
	PartnerPage getPartners(String keyword, Integer page, Integer amount);

	PartnerVO getPartner(Long partnerId);

	void register(PartnerVO partner);

	boolean modify(PartnerVO partner);

	boolean toggleUse(Long partnerId);
}
