package com.hexagon.hcount.mapper.partner;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hexagon.hcount.domain.partner.PartnerSearchCriteria;
import com.hexagon.hcount.domain.partner.PartnerVO;

// Java에서 Mapper XML을 호출한다
// JavaからMapper XMLを呼び出す
public interface PartnerMapper {
	// 목록 조회와 전체 건수 조회
	// リスト照会と全体件数照会
	List<PartnerVO> selectPartners(PartnerSearchCriteria criteria);

	int countPartners(PartnerSearchCriteria criteria);

	// 한 건 조회
	// 1件照会
	PartnerVO selectPartner(Long partnerId);

	PartnerVO selectPartnerByCode(String partnerCode);

	// 등록, 수정, 사용상태 변경
	// 登録、修正、使用状態変更
	int insertPartner(PartnerVO partner);

	int updatePartner(PartnerVO partner);

	int updateUseYn(@Param("partnerId") Long partnerId, @Param("useYn") String useYn);
}
