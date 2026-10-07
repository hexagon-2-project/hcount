package com.hexagon.hcount.mapper.partner;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hexagon.hcount.domain.partner.PartnerSearchCriteria;
import com.hexagon.hcount.domain.partner.PartnerVO;

public interface PartnerMapper {
	List<PartnerVO> selectPartners(PartnerSearchCriteria criteria);

	int countPartners(PartnerSearchCriteria criteria);

	PartnerVO selectPartner(Long partnerId);

	PartnerVO selectPartnerByCode(String partnerCode);

	int insertPartner(PartnerVO partner);

	int updatePartner(PartnerVO partner);

	int updateUseYn(@Param("partnerId") Long partnerId, @Param("useYn") String useYn);

	int softDeletePartner(@Param("partnerId") Long partnerId);
}
