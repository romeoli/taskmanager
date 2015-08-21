package com.test.service.impl;

import com.test.entity.User;
import com.test.repository.UserRepository;
import com.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User getUser(String name) {
        return userRepository.findByUsername(name);
    }

    @Override
    public void addUser(User user) {
        userRepository.saveAndFlush(user);
    }
}
