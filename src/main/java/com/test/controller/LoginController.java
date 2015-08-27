package com.test.controller;

import com.test.entity.User;
import com.test.service.UnitService;
import com.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController {

    @Autowired
    private UnitService unitService;

    @Autowired
    private UserService userService;

    @Autowired
    private ShaPasswordEncoder shaPasswordEncoder;

    @RequestMapping("/login")
    public String login(Model model) {
        return "login";
    }

    @RequestMapping("/register")
    public ModelAndView registerPage() {
        return new ModelAndView("register", "unitList", unitService.getAllUnits());
    }

    @RequestMapping("/adduser")
    public ModelAndView addUser(@RequestParam(value = "unit") int id,
                                @RequestParam(value = "name") String name,
                                @RequestParam(value = "pass") String pass) {


        User user = new User(name, shaPasswordEncoder.encodePassword(pass, null), unitService.getUnitById(id));
        userService.addUser(user);

        return new ModelAndView("login");
    }
}
