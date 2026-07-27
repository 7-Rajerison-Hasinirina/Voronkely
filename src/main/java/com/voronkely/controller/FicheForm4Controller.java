package com.voronkely.controller;

import com.voronkely.entity.FicheForm4;
import com.voronkely.service.FicheForm4Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FicheForm4Controller {

    private final FicheForm4Service service;

    public FicheForm4Controller(FicheForm4Service service) {
        this.service = service;
    }

    @GetMapping("/fiche4")
    public String list(Model model) {
        model.addAttribute("items", service.findAll());
        return "fiche/fiche4-list";
    }

    @GetMapping("/fiche4/new")
    public String createForm(Model model) {
        model.addAttribute("fiche", new FicheForm4());
        return "fiche/fiche4-form";
    }

    @PostMapping("/fiche4")
    public String create(@ModelAttribute FicheForm4 fiche) {
        service.save(fiche);
        return "redirect:/fiche4";
    }

    @GetMapping("/fiche4/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche4-view";
    }
}
