package com.hexagon.hcount.domain.warehouse;

import java.util.Collections;
import java.util.List;

import lombok.Getter;

// 목록과 페이지 번호를 같이 담는다
// リストとページ番号を一緒に入れる
@Getter
public class WarehousePage {
	private final List<WarehouseVO> warehouses;
	private final String keyword;
	private final int page;
	private final int amount;
	private final int totalCount;
	private final int totalPages;
	private final int startPage;
	private final int endPage;
	private final boolean previous;
	private final boolean next;
	private final boolean includeInactive;

	public WarehousePage(List<WarehouseVO> warehouses, WarehouseSearchCriteria criteria, int totalCount) {
		this.warehouses = warehouses == null ? Collections.<WarehouseVO>emptyList() : warehouses;
		this.keyword = criteria.getKeyword();
		this.page = criteria.getPage();
		this.amount = criteria.getAmount();
		this.totalCount = totalCount;
		this.totalPages = Math.max(1, (int) Math.ceil(totalCount / (double) amount));
		this.endPage = Math.min(totalPages, ((page - 1) / 5 + 1) * 5);
		this.startPage = Math.max(1, endPage - 4);
		this.previous = startPage > 1;
		this.next = endPage < totalPages;
		this.includeInactive = criteria.isIncludeInactive();
	}
}
