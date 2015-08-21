package com.test.repository;

import com.test.entity.Status;
import com.test.entity.Task;
import com.test.entity.Unit;
import com.test.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface TaskRepository extends JpaRepository<Task, Integer> {

    List<Task> findByPerformerLike(User user);
    List<Task> findByPerformerUnitLike(Unit unit);
    List<Task> findByPerformerLikeAndStatusLike(User user, Status status);
}
