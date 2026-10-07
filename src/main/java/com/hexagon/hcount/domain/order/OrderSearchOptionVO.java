package com.hexagon.hcount.domain.order;

import lombok.Data;

// 검색 목록에서 선택할 코드, 이름, ID
// 検索リストで選ぶコード、名前、ID
@Data
public class OrderSearchOptionVO {
    private Long id;
    private String code;
    private String name;
}
