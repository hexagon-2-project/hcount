package com.hexagon.hcount.domain.partner;

import lombok.Getter;

// 검색어와 페이징 조건
// 検索語とページ条件
@Getter
public class PartnerSearchCriteria {
	private final String keyword;
	private final int page;
	private final int amount;

	// 값이 이상하면 기본값 사용
	// 値がおかしい場合は基本値を使う
	public PartnerSearchCriteria(String keyword, Integer page, Integer amount) {
		this.keyword = keyword == null ? "" : keyword.trim();
		this.page = page == null || page < 1 ? 1 : page;
		this.amount = amount == null || amount < 1 || amount > 100 ? 20 : amount;
	}

	// Oracle 페이징 시작 번호
	// Oracleページングの開始番号
	public int getStartRow() {
		return (page - 1) * amount;
	}

	public int getEndRow() {
		return page * amount;
	}
}
