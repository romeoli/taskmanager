package com.test.service.impl;

import com.test.entity.Unit;
import com.test.repository.UnitRepository;
import com.test.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UnitServiceImpl implements UnitService {

    @Autowired
    private UnitRepository unitRepository;

    @Override
    public List<Unit> getAllUnits() {
        return unitRepository.findAll();
    }

    @Override
    public Unit getUnitById(int id) {
        return unitRepository.findUnitById(id);
    }
}
