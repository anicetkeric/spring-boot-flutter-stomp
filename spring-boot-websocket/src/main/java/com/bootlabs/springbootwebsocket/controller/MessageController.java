package com.bootlabs.springbootwebsocket.controller;

import com.bootlabs.springbootwebsocket.model.Message;
import com.bootlabs.springbootwebsocket.service.MessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@CrossOrigin
public class MessageController {

    @Autowired
    MessageService messageService;

    @MessageMapping("/chat/message")
    public void sendMessage(Message message){
        log.info(String.valueOf(message));
        this.messageService.sendMessage(message);
    }

}
