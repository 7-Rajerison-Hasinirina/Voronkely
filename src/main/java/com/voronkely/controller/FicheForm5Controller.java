package com.voronkely.controller;

import com.voronkely.entity.FicheForm5;
import com.voronkely.service.FicheForm5Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FicheForm5Controller {

    private final FicheForm5Service service;

    public FicheForm5Controller(FicheForm5Service service) {
        this.service = service;
    }

    @GetMapping("/fiche5")
    public String list(Model model) {
        model.addAttribute("items", service.findAll());
        return "fiche/fiche5-list";
    }

    @GetMapping("/fiche5/new")
    public String createForm(Model model) {
        model.addAttribute("fiche", new FicheForm5());
        return "fiche/fiche5-form";
    }

    @PostMapping("/fiche5")
    public String create(@ModelAttribute FicheForm5 fiche) {
        service.save(fiche);
        return "redirect:/fiche5";
    }

    @GetMapping("/fiche5/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche5-view";
    }
}
