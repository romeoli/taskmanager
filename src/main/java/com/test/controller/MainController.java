package com.test.controller;

import com.test.entity.User;
import com.test.service.StatusService;
import com.test.service.TaskService;
import com.test.service.UnitService;
import com.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private UnitService unitService;

    @Autowired
    private StatusService statusService;

    @RequestMapping("/")
    public ModelAndView start() {
        return new ModelAndView("login");
    }

    @RequestMapping("/admin")
    public String admin(Model model) {
        return "admin";
    }

    @RequestMapping(value = "/tasks")
    public ModelAndView taskListForCurrentUser(@RequestParam(value = "status", required = false) String status) {
        ModelAndView modelAndView = new ModelAndView("tasks");
        modelAndView.addObject("taskList", taskService.getTasksForUserAndStatus(getCurrentUser(),
                statusService.getStatusByName(status == null ? "in work" : status)));
        modelAndView.addObject("statusList", statusService.getAllStatuses());
        modelAndView.addObject("currentUser", getCurrentUser());
        return modelAndView;
    }

    @RequestMapping(value = "/unit_tasks")
    public ModelAndView taskListForCurrentUnit() {
        ModelAndView modelAndView = new ModelAndView("tasks");
        modelAndView.addObject("taskList", taskService.getTasksForUnit(getCurrentUser().getUnit()));
        modelAndView.addObject("statusList", statusService.getAllStatuses());
        modelAndView.addObject("currentUser", getCurrentUser());
        return modelAndView;
    }

    @RequestMapping(value = "/addtask")
    public ModelAndView addNewTaskPage() {
        return new ModelAndView("addtask", "unitList", unitService.getAllUnits());
    }

    @RequestMapping(value = "/task")
    public ModelAndView taskPage(@RequestParam(value = "id") int id) {
        ModelAndView modelAndView = new ModelAndView("task");
        modelAndView.addObject("taskItem", taskService.getTaskById(id));
        modelAndView.addObject("currentUser", getCurrentUser());
        return modelAndView;
    }





    public User getCurrentUser() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        return userService.getUser(userDetails.getUsername());
    }
}
