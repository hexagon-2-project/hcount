package com.hexagon.hcount.domain.warehouse;

import lombok.Getter;

// 검색어와 페이지 조건
// 検索語とページ条件
@Getter
public class WarehouseSearchCriteria {
	private final String keyword;
	private final int page;
	private final int amount;
	private final boolean includeInactive;

	public WarehouseSearchCriteria(String keyword, Integer page, Integer amount, boolean includeInactive) {
		this.keyword = keyword == null ? "" : keyword.trim();
		this.page = page == null || page < 1 ? 1 : page;
		this.amount = amount == null || amount < 1 || amount > 100 ? 20 : amount;
		this.includeInactive = includeInactive;
	}

	public int getStartRow() {
		return (page - 1) * amount;
	}

	public int getEndRow() {
		return page * amount;
	}
}
