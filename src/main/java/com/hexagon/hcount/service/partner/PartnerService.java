package com.hexagon.hcount.service.partner;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.partner.PartnerMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PartnerService {
	private final PartnerMapper mapper;

}
