package com.bootlabs.springbootwebsocket.controller;

import com.bootlabs.springbootwebsocket.model.User;
import com.bootlabs.springbootwebsocket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class UserController {

    @Autowired
    UserService userService;


    @GetMapping("/user/{username}")
    public ResponseEntity<User> getUSerByName(@PathVariable("username") String username) {
        return ResponseEntity.ok().body(userService.getByUsername(username));
    }

    @GetMapping("/users")
    public ResponseEntity<List<User>> getAllUsers() {
        return ResponseEntity.ok().body(userService.getAll());
    }

}
