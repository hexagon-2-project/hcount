package com.hexagon.hcount.domain.partner;

import java.util.Collections;
import java.util.List;

import lombok.Getter;

// 목록과 페이지 번호를 같이 담는다
// リストとページ番号を一緒に入れる
@Getter
public class PartnerPage {
	private final List<PartnerVO> partners;
	private final String keyword;
	private final int page;
	private final int amount;
	private final int totalCount;
	private final int totalPages;
	private final int startPage;
	private final int endPage;
	private final boolean previous;
	private final boolean next;

	// 전체 건수로 페이지 범위를 계산
	// 全体件数からページ範囲を計算
	public PartnerPage(List<PartnerVO> partners, PartnerSearchCriteria criteria, int totalCount) {
		this.partners = partners == null ? Collections.<PartnerVO>emptyList() : partners;
		this.keyword = criteria.getKeyword();
		this.page = criteria.getPage();
		this.amount = criteria.getAmount();
		this.totalCount = totalCount;
		this.totalPages = Math.max(1, (int) Math.ceil(totalCount / (double) amount));
		this.endPage = Math.min(totalPages, ((page - 1) / 10 + 1) * 10);
		this.startPage = Math.max(1, endPage - 9);
		this.previous = startPage > 1;
		this.next = endPage < totalPages;
	}
}
