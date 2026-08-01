package com.voronkely.controller;

import com.voronkely.entity.RoleTarika;
import com.voronkely.service.RoleTarikaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/role-tarika")
public class RoleTarikaController {

    private final RoleTarikaService roleTarikaService;

    public RoleTarikaController(RoleTarikaService roleTarikaService) {
        this.roleTarikaService = roleTarikaService;
    }

    @GetMapping
    public String page(Model model) {

        model.addAttribute(
                "roles",
                roleTarikaService.findAll()
        );

        return "role-tarika/page-role-tarika";
    }

    @GetMapping("/nouveau")
    public String nouveau(Model model) {

        model.addAttribute(
                "roleTarika",
                new RoleTarika()
        );

        return "role-tarika/role-tarika-form";
    }

    @PostMapping
    public String enregistrer(
            @ModelAttribute RoleTarika roleTarika
    ) {

        roleTarikaService.save(roleTarika);

        return "redirect:/role-tarika";
    }

}