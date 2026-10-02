package com.hexagon.hcount.service.shiprequest;

import org.springframework.stereotype.Service;

import com.hexagon.hcount.mapper.shiprequest.ShipRequestMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ShipRequestService {
    private final ShipRequestMapper mapper;

}
