package com.hexagon.hcount.domain.order;

import lombok.Getter;

// 화면에 보여줄 페이지 번호 계산
// 画面に表示するページ番号を計算する
@Getter
public class OrderPageDTO {
    private final long total;
    private final int realEnd;
    private final int startPage;
    private final int endPage;
    private final boolean prev;
    private final boolean next;
    private final OrderCriteria cri;

    public OrderPageDTO(OrderCriteria cri, long total) {
        this.cri = cri;
        this.total = total;
        // 데이터가 없어도 1페이지로 표시
        // データがなくても1ページと表示する
        // 마지막 페이지를 넘으면 마지막 페이지로 이동
        // 最終ページを超えた場合は最終ページに移動する
        realEnd = (int) Math.max(1, (total + cri.getAmount() - 1) / cri.getAmount());
        cri.setPageNum(Math.min(Math.max(1, cri.getPageNum()), realEnd));
        startPage = ((cri.getPageNum() - 1) / 10) * 10 + 1;
        endPage = Math.min(startPage + 9, realEnd);
        prev = startPage > 1;
        next = endPage < realEnd;
    }
}
