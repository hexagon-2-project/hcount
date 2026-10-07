package com.hexagon.hcount.domain.order;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import lombok.Getter;
import lombok.Setter;

// 검색 조건과 페이지 번호 저장
// 検索条件とページ番号を保存する
@Getter
@Setter
public class OrderCriteria {
    private int pageNum = 1;
    private String startDate = "";
    private String endDate = "";
    private Long partnerId;
    private Long empId;
    private Long whId;
    private String status = "";
    private String ordNo = "";
    private String matchType = "exact";

    // 한 페이지에 10건씩 표시
    // 1ページに10件ずつ表示する
    public int getAmount() { return 10; }
    public long getOffset() { return ((long) pageNum - 1) * getAmount(); }
    public long getLimit() { return (long) pageNum * getAmount(); }

    public void normalize() {
        pageNum = Math.max(1, pageNum);
        startDate = trim(startDate);
        endDate = trim(endDate);
        status = trim(status);
        ordNo = trim(ordNo);
        matchType = trim(matchType);
    }

    // 검색 전에 날짜와 선택한 값 확인
    // 検索前に日付と選択した値を確認する
    public String validate() {
        try {
            LocalDate start = startDate.isEmpty() ? null : parseDate(startDate);
            LocalDate end = endDate.isEmpty() ? null : parseDate(endDate);
            if (start != null && end != null && start.isAfter(end)) {
                return "開始日は終了日以前の日付を指定してください。";
            }
        } catch (DateTimeParseException ex) {
            return "日付をyyyy-MM-dd形式の有効な日付で入力してください。";
        }
        if ((partnerId != null && partnerId <= 0) || (empId != null && empId <= 0)
                || (whId != null && whId <= 0)) {
            return "取引先・担当者・倉庫を一覧から選択してください。";
        }
        if (ordNo.length() > 40 || status.length() > 30) {
            return "受注番号または進行状態の入力が長すぎます。";
        }
        if (!"exact".equals(matchType) && !"contains".equals(matchType)) {
            return "受注番号の検索方法を選択してください。";
        }
        return null;
    }

    // %나 _가 있어도 입력한 문자 그대로 검색하기
    // %や_も入力した文字のまま検索する
    public String getEscapedOrdNo() {
        return ordNo.replace("\\", "\\\\").replace("%", "\\%").replace("_", "\\_");
    }

    private LocalDate parseDate(String value) {
        if (!value.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")) {
            throw new DateTimeParseException("Invalid date format", value, 0);
        }
        LocalDate date = LocalDate.parse(value);
        if (date.getYear() < 1) {
            throw new DateTimeParseException("Invalid year", value, 0);
        }
        return date;
    }

    private String trim(String value) { return value == null ? "" : value.trim(); }
}
