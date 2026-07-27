package com.voronkely.controller;

import com.voronkely.entity.FicheForm1;
import com.voronkely.service.FicheForm1Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FicheForm1Controller {

    private final FicheForm1Service service;

    public FicheForm1Controller(FicheForm1Service service) {
        this.service = service;
    }

    @GetMapping("/fiche1")
    public String list(Model model) {
        model.addAttribute("items", service.findAll());
        return "fiche/fiche1-list";
    }

    @GetMapping("/fiche1/new")
    public String createForm(Model model) {
        model.addAttribute("fiche", new FicheForm1());
        return "fiche/fiche1-form";
    }

    @PostMapping("/fiche1")
    public String create(@ModelAttribute FicheForm1 fiche) {
        service.save(fiche);
        return "redirect:/fiche1";
    }

    @GetMapping("/fiche1/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche1-view";
    }
}
