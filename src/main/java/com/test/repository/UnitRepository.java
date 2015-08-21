package com.test.repository;

import com.test.entity.Unit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UnitRepository extends JpaRepository<Unit, Integer> {
    Unit findUnitById(int id);
}
