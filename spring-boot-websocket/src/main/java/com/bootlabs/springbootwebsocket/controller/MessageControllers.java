package com.bootlabs.springbootwebsocket.controller;

import com.bootlabs.springbootwebsocket.dto.MessageDTO;
import com.bootlabs.springbootwebsocket.dto.MessageGroupDTO;
import com.bootlabs.springbootwebsocket.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class MessageControllers {

    @Autowired
    MessageService messageService;


    @MessageMapping("/chat/{to}")
    public void sendMessagePersonal(@DestinationVariable String to, MessageDTO message) {

        messageService.sendMessage(to,message);

    }

    @MessageMapping("/chat/group/{to}")
    public void sendMessageToGroup(@DestinationVariable Integer to, MessageGroupDTO message) {
        messageService.sendMessageGroup(to,message);

    }
    @MessageMapping("/chat/message")
    public void sendMessage(String message){
        System.out.println(message);
        this.messageService.sendMessage(message);
    }

}
