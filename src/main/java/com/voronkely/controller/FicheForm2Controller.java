package com.voronkely.controller;

import com.voronkely.entity.FicheForm2;
import com.voronkely.service.FicheForm2Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FicheForm2Controller {

    private final FicheForm2Service service;

    public FicheForm2Controller(FicheForm2Service service) {
        this.service = service;
    }

    @GetMapping("/fiche2")
    public String list(Model model) {
        model.addAttribute("items", service.findAll());
        return "fiche/fiche2-list";
    }

    @GetMapping("/fiche2/new")
    public String createForm(Model model) {
        model.addAttribute("fiche", new FicheForm2());
        return "fiche/fiche2-form";
    }

    @PostMapping("/fiche2")
    public String create(@ModelAttribute FicheForm2 fiche) {
        service.save(fiche);
        return "redirect:/fiche2";
    }

    @GetMapping("/fiche2/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche2-view";
    }
}
