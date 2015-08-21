package com.test.controller;

import com.test.entity.Task;
import com.test.entity.User;
import com.test.service.StatusService;
import com.test.service.TaskService;
import com.test.service.UnitService;
import com.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class TaskController {

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private UnitService unitService;

    @Autowired
    private StatusService statusService;

    @RequestMapping(value = "/newtask", method = RequestMethod.POST)
    public ModelAndView newTask(@RequestParam(value = "description") String description,
                                @RequestParam(value = "long_dscr", required = false) String longDescription,
                                @RequestParam(value = "unit", required = false) int unit,
                                @RequestParam(value = "deadline", required = false) String date) throws ParseException {

        Date deadline;
        if (date.equals("")) {
            deadline = new Date();
        } else {
            deadline = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        }

        Task task = new Task(description, longDescription, unitService.getUnitById(unit),
                deadline, getCurrentUser(), statusService.getStatusByName("waiting"));
        taskService.addTask(task);

        return new ModelAndView("tasks", "taskList",
                taskService.getTasksForUser(getCurrentUser()));
    }

    @RequestMapping(value = "/take_task")
    public ModelAndView takeTask(@RequestParam(value = "id") int id) {

        Task task = taskService.getTaskById(id);
        task.setPerformer(getCurrentUser());
        task.setStatus(statusService.getStatusByName("in work"));
        taskService.updateTask(task);

        return new ModelAndView("tasks", "taskList", taskService.getTasksForUser(getCurrentUser()));
    }

    @RequestMapping(value = "/reject_task")
    public ModelAndView rejectTask(@RequestParam(value = "id") int id) {

        Task task = taskService.getTaskById(id);
        task.setStatus(statusService.getStatusByName("rejected"));
        taskService.updateTask(task);

        return new ModelAndView("tasks", "taskList", taskService.getTasksForUser(getCurrentUser()));
    }

    @RequestMapping(value = "/complete_task")
    public ModelAndView completeTask(@RequestParam(value = "id") int id) {

        Task task = taskService.getTaskById(id);
        task.setStatus(statusService.getStatusByName("completed"));
        taskService.updateTask(task);

        return new ModelAndView("tasks", "taskList", taskService.getTasksForUser(getCurrentUser()));
    }

    public User getCurrentUser() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        return userService.getUser(userDetails.getUsername());
    }
}
