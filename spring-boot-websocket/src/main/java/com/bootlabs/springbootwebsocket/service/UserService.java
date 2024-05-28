package com.bootlabs.springbootwebsocket.service;

import com.bootlabs.springbootwebsocket.model.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private static final List<User> users = new ArrayList<>();

    static {
        users.add(new User("66524aebb2a089ddf7e3aada", "carlos"));
        users.add(new User("66524af821434aec003b3542", "morrison"));
        users.add(new User("66524b07f63d941f7dcc16e4", "xavier"));
        users.add(new User("66524b0ce7d08abdc94a8a80", "mason"));
        users.add(new User("66524b0ce7d08abdc94a8a80", "ariel"));
        users.add(new User("66524b17f112ed142bf01050", "libby"));
        users.add(new User("66524b1b797741e8372ff8ab", "peter"));
    }


    public List<User> getAll() {
       return users;
    }

    public User getByUsername(String username) {
       return users.stream().filter(user -> user.getUsername().equals(username)).findFirst().orElseThrow(() -> new RuntimeException("Not found"));
    }
}
