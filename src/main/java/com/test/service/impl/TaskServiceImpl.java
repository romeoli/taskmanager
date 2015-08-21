package com.test.service.impl;

import com.test.entity.Status;
import com.test.entity.Task;
import com.test.entity.Unit;
import com.test.entity.User;
import com.test.repository.TaskRepository;
import com.test.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService{

    @Autowired
    private TaskRepository taskRepository;

    @Override
    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    @Override
    public List<Task> getTasksForUser(User user) {
        return taskRepository.findByPerformerLike(user);
    }

    @Override
    public List<Task> getTasksForUnit(Unit unit) {
        return taskRepository.findByPerformerUnitLike(unit);
    }

    @Override
    public List<Task> getTasksForUserAndStatus(User user, Status status) {
        return taskRepository.findByPerformerLikeAndStatusLike(user, status);
    }

    @Override
    public Task getTaskById(int id) {
        return taskRepository.findOne(id);
    }

    @Override
    public void addTask(Task task) {
        taskRepository.saveAndFlush(task);
    }

    @Override
    public void updateTask(Task task) {
        taskRepository.saveAndFlush(task);
    }

}
