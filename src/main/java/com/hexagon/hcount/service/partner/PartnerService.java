package com.hexagon.hcount.service.partner;

import com.hexagon.hcount.domain.partner.PartnerPage;
import com.hexagon.hcount.domain.partner.PartnerVO;

public interface PartnerService {
	PartnerPage getPartners(String keyword, Integer page, Integer amount, boolean includeInactive);

	PartnerPage getPartners(String keyword, Integer page, Integer amount, boolean includeInactive,
			String sortBy, String sortDirection);

	PartnerVO getPartner(Long partnerId);

	void register(PartnerVO partner);

	boolean modify(PartnerVO partner);

	boolean toggleUse(Long partnerId);

	boolean deletePartner(Long partnerId);
}
