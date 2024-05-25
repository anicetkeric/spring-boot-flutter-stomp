package com.bootlabs.springbootwebsocket.service;

import com.bootlabs.springbootwebsocket.dto.MessageDTO;
import com.bootlabs.springbootwebsocket.dto.MessageGroupDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

@Service
public class MessageService {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    private static final List<Integer> groupIds = List.of(1, 2, 3);


    public void sendMessage(String to, MessageDTO message) {
        simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
    }


    public void sendMessageGroup(Integer to, MessageGroupDTO message) {
        message.setGroupId(to);
        simpMessagingTemplate.convertAndSend("/topic/messages/group/" + to, message);
    }

    public void sendMessage(String message) {
        this.simpMessagingTemplate.convertAndSend("/topic",  message);
    }


    @Scheduled(fixedDelay = 10000)  //10s
    public void sendMessageGroup() {

        Random rand = new Random();
        var groupId =  groupIds.get(rand.nextInt(groupIds.size()));

        var message = new MessageGroupDTO();
        message.setGroupId(groupId);
        message.setMessage("Hello group "+ groupId);
        message.setFromLogin(groupId);

        System.out.println("groupID - " + groupId);
        System.out.println("Fixed delay task - " + LocalDateTime.now());

        simpMessagingTemplate.convertAndSend("/topic/messages/group/" + groupId, message);
    }



}