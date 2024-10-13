package com.bootlabs.springbootwebsocket.service;

import com.bootlabs.springbootwebsocket.model.GateInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;

@Slf4j
@RequiredArgsConstructor
@Service
public class GateService {

    private final SimpMessagingTemplate simpMessagingTemplate;

    public void updateGateInfo(GateInfo gateInfo) {
        // TODO update in DB
        simpMessagingTemplate.convertAndSend(MessageFormat.format("/topic/gate-info/{0}", gateInfo.getGateId()), gateInfo);
    }
}