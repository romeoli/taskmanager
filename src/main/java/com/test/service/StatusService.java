package com.test.service;

import com.test.entity.Status;

import java.util.List;

public interface StatusService {

    Status getStatusByName(String name);
    List<Status> getAllStatuses();
}
