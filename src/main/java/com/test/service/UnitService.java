package com.test.service;

import com.test.entity.Unit;

import java.util.List;

public interface UnitService {

    List<Unit> getAllUnits();
    Unit getUnitById(int id);
}
