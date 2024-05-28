package com.bootlabs.springbootwebsocket.service;

import com.bootlabs.springbootwebsocket.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

@Service
public class MessageService {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    public void sendMessage(Message message) {
        simpMessagingTemplate.convertAndSend("/topic/messages/" + message.getReceiverId(), message);
    }
}