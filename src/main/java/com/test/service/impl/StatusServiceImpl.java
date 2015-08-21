package com.test.service.impl;

import com.test.entity.Status;
import com.test.repository.StatusRepository;
import com.test.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatusServiceImpl implements StatusService {

    @Autowired
    private StatusRepository statusRepository;

    @Override
    public Status getStatusByName(String name) {
        return statusRepository.findByStatus(name);
    }

    @Override
    public List<Status> getAllStatuses() {
        return statusRepository.findAll();
    }
}
