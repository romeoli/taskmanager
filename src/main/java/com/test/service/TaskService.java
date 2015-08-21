package com.test.service;

import com.test.entity.Status;
import com.test.entity.Task;
import com.test.entity.Unit;
import com.test.entity.User;

import java.util.List;

public interface TaskService {

    List<Task> getAllTasks();
    List<Task> getTasksForUser(User user);
    List<Task> getTasksForUnit(Unit unit);
    List<Task> getTasksForUserAndStatus(User user, Status status);
    Task getTaskById(int id);
    void addTask(Task task);
    void updateTask(Task task);

}
