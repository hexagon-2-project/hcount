package com.hexagon.hcount.domain.warehouse;

import java.util.Date;

import lombok.Data;

// 창고 정보를 담는 객체
// 倉庫情報を入れるオブジェクト
@Data
public class WarehouseVO {
	private Long warehouseId;
	private String warehouseCode;
	private String warehouseName;
	private String warehouseType;
	private String useYn;
	private Date registeredAt;
	private Date modifiedAt;
}
