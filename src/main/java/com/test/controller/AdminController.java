package com.test.controller;

import com.test.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UnitService unitService;

    @RequestMapping("/units")
    public ModelAndView unitManageent() {
        return new ModelAndView("admin", "itemsList", unitService.getAllUnits());
    }
}
