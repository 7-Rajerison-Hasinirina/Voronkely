package com.voronkely.controller;

import com.voronkely.entity.FicheForm3;
import com.voronkely.service.FicheForm3Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FicheForm3Controller {

    private final FicheForm3Service service;

    public FicheForm3Controller(FicheForm3Service service) {
        this.service = service;
    }

    @GetMapping("/fiche3")
    public String list(Model model) {
        model.addAttribute("items", service.findAll());
        return "fiche/fiche3-list";
    }

    @GetMapping("/fiche3/new")
    public String createForm(Model model) {
        model.addAttribute("fiche", new FicheForm3());
        return "fiche/fiche3-form";
    }

    @PostMapping("/fiche3")
    public String create(@ModelAttribute FicheForm3 fiche) {
        service.save(fiche);
        return "redirect:/fiche3";
    }

    @GetMapping("/fiche3/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche3-view";
    }
}
