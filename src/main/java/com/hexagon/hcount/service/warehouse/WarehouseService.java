package com.hexagon.hcount.service.warehouse;

import java.util.Locale;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hexagon.hcount.domain.warehouse.WarehousePage;
import com.hexagon.hcount.domain.warehouse.WarehouseSearchCriteria;
import com.hexagon.hcount.domain.warehouse.WarehouseVO;
import com.hexagon.hcount.mapper.warehouse.WarehouseMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WarehouseService {
	private final WarehouseMapper mapper;

	@Transactional(readOnly = true)
	// 목록과 전체 건수를 같은 검색 조건으로 조회한다
	// リストと全件数を同じ検索条件で照会する
	public WarehousePage getWarehouses(String keyword, Integer page, Integer amount, boolean includeInactive) {
		return getWarehouses(keyword, page, amount, includeInactive, "code", "asc");
	}

	@Transactional(readOnly = true)
	public WarehousePage getWarehouses(String keyword, Integer page, Integer amount, boolean includeInactive,
			String sortBy, String sortDirection) {
		WarehouseSearchCriteria criteria = new WarehouseSearchCriteria(keyword, page, amount, includeInactive,
				sortBy, sortDirection);
		return new WarehousePage(mapper.selectWarehouses(criteria), criteria, mapper.countWarehouses(criteria));
	}

	@Transactional(readOnly = true)
	public WarehouseVO getWarehouse(Long warehouseId) {
		return warehouseId == null ? null : mapper.selectWarehouse(warehouseId);
	}

	@Transactional
	// 입력값을 정리한 뒤 창고코드 중복 여부를 확인한다
	// 入力値を整理してから倉庫コードの重複を確認する
	public void register(WarehouseVO warehouse) {
		normalizeAndValidate(warehouse);
		if (mapper.selectWarehouseByCode(warehouse.getWarehouseCode()) != null) {
			throw new IllegalArgumentException("이미 사용 중인 창고코드입니다.");
		}
		if (mapper.insertWarehouse(warehouse) != 1) {
			throw new IllegalStateException("창고를 등록하지 못했습니다.");
		}
	}

	@Transactional
	public boolean modify(WarehouseVO warehouse) {
		if (warehouse == null || warehouse.getWarehouseId() == null) {
			throw new IllegalArgumentException("수정할 창고를 선택해 주세요.");
		}
		normalizeAndValidate(warehouse);
		return mapper.updateWarehouse(warehouse) == 1;
	}

	@Transactional
	public boolean toggleUse(Long warehouseId) {
		WarehouseVO warehouse = getWarehouse(warehouseId);
		if (warehouse == null) {
			return false;
		}
		String useYn = "Y".equalsIgnoreCase(warehouse.getUseYn()) ? "N" : "Y";
		return mapper.updateUseYn(warehouseId, useYn) == 1;
	}

	// 저장 전에 공백과 기본값을 정리한다
	// 保存前に空白と基本値を整理する
	private void normalizeAndValidate(WarehouseVO warehouse) {
		if (warehouse == null) {
			throw new IllegalArgumentException("창고 정보를 입력해 주세요.");
		}
		warehouse.setWarehouseCode(trim(warehouse.getWarehouseCode()));
		warehouse.setWarehouseName(trim(warehouse.getWarehouseName()));
		String type = trim(warehouse.getWarehouseType()).toUpperCase(Locale.ROOT);
		warehouse.setWarehouseType(type.isEmpty() ? "NORMAL" : type);
		String useYn = trim(warehouse.getUseYn()).toUpperCase(Locale.ROOT);
		warehouse.setUseYn("N".equals(useYn) ? "N" : "Y");
		if (warehouse.getWarehouseCode().isEmpty()) {
			throw new IllegalArgumentException("창고코드를 입력해 주세요.");
		}
		if (warehouse.getWarehouseName().isEmpty()) {
			throw new IllegalArgumentException("창고명을 입력해 주세요.");
		}
		if (!"NORMAL".equals(warehouse.getWarehouseType()) && !"FACTORY".equals(warehouse.getWarehouseType())
				&& !"OUTSIDE".equals(warehouse.getWarehouseType())) {
			throw new IllegalArgumentException("창고유형을 확인해 주세요.");
		}
	}

	private String trim(String value) {
		return value == null ? "" : value.trim();
	}
}
