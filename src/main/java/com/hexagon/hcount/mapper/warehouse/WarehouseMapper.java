package com.hexagon.hcount.mapper.warehouse;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hexagon.hcount.domain.warehouse.WarehouseSearchCriteria;
import com.hexagon.hcount.domain.warehouse.WarehouseVO;

// Java에서 창고 SQL을 호출한다
// Javaから倉庫SQLを呼び出す
public interface WarehouseMapper {
	List<WarehouseVO> selectWarehouses(WarehouseSearchCriteria criteria);

	int countWarehouses(WarehouseSearchCriteria criteria);

	WarehouseVO selectWarehouse(Long warehouseId);

	WarehouseVO selectWarehouseByCode(String warehouseCode);

	int insertWarehouse(WarehouseVO warehouse);

	int updateWarehouse(WarehouseVO warehouse);

	int updateUseYn(@Param("warehouseId") Long warehouseId, @Param("useYn") String useYn);
}
