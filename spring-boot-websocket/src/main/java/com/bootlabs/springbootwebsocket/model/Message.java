package com.bootlabs.springbootwebsocket.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Message {

    private String time;

    private String message;

    private String receiverId;

    private String senderId;
}
