package com.voronkely.controller;

import com.voronkely.entity.Membre;
import com.voronkely.service.MembreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MembreController {

    private final MembreService membreService;

    public MembreController(MembreService membreService) {
        this.membreService = membreService;
    }

    @GetMapping("/membres")
    public String listMembres(Model model) {
        model.addAttribute("membres", membreService.findAll());
        return "membre/liste-membre";
    }

    @GetMapping("/membres/new")
    public String showCreateForm(Model model) {
        model.addAttribute("membre", new Membre());
        return "membre/membre-form";
    }

    @PostMapping("/membres")
    public String createMembre(@ModelAttribute Membre membre) {
        membreService.save(membre);
        return "redirect:/membres";
    }

    @GetMapping("/membres/{id}")
    public String viewMembre(@PathVariable Long id, Model model) {
        membreService.findById(id).ifPresent(membre -> model.addAttribute("membre", membre));
        return "membre/view";
    }
}
