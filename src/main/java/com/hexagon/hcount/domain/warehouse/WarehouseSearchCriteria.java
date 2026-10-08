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
	private final String sortBy;
	private final String sortDirection;

	public WarehouseSearchCriteria(String keyword, Integer page, Integer amount, boolean includeInactive) {
		this(keyword, page, amount, includeInactive, "code", "asc");
	}

	public WarehouseSearchCriteria(String keyword, Integer page, Integer amount, boolean includeInactive,
			String sortBy, String sortDirection) {
		this.keyword = keyword == null ? "" : keyword.trim();
		this.page = page == null || page < 1 ? 1 : page;
		this.amount = amount == null || amount < 1 || amount > 100 ? 20 : amount;
		this.includeInactive = includeInactive;
		this.sortBy = normalizeSortBy(sortBy);
		this.sortDirection = "desc".equalsIgnoreCase(sortDirection) ? "desc" : "asc";
	}

	// SQL에 정해진 컬럼만 전달해 임의의 정렬문이 들어가지 않게 한다
	// SQLには決められたカラムだけ渡して任意のソート文を防ぐ
	private String normalizeSortBy(String value) {
		if ("name".equals(value) || "type".equals(value) || "status".equals(value)) {
			return value;
		}
		return "code";
	}

	public int getStartRow() {
		return (page - 1) * amount;
	}

	public int getEndRow() {
		return page * amount;
	}
}
