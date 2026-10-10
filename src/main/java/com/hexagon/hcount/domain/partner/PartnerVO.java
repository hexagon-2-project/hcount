package com.hexagon.hcount.domain.partner;

import java.util.Date;

import lombok.Data;

@Data
public class PartnerVO {
	// 기본 정보
	// 基本情報
	private Long partnerId;
	private String partnerCode;
	private String partnerName;
	private String partnerType;
	private String bizNo;
	private String ceoName;
	private String bizType;
	private String bizItem;
	// 연락처와 주소
	// 連絡先と住所
	private String tel;
	private String fax;
	private String contactName;
	private String email;
	private String mobile;
	private String zipCode1;
	private String address1;
	private String zipCode2;
	private String address2;
	private String searchText;
	private String homepage;
	// 관리 정보
	// 管理情報
	private Long employeeId;
	private String currencyCode;
	private String useYn;
	private String delYn;
	private Date registeredAt;
	private Date modifiedAt;
}
