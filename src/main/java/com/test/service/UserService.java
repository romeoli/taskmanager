package com.test.service;

import com.test.entity.User;

public interface UserService {

    User getUser(String name);
    void addUser(User user);
}
