package com.voronkely.controller;

import com.voronkely.entity.FicheForm6;
import com.voronkely.service.FicheForm6Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FicheForm6Controller {

    private final FicheForm6Service service;

    public FicheForm6Controller(FicheForm6Service service) {
        this.service = service;
    }

    @GetMapping("/fiche6")
    public String list(Model model) {
        model.addAttribute("items", service.findAll());
        return "fiche/fiche6-list";
    }

    @GetMapping("/fiche6/new")
    public String createForm(@RequestParam Long idMembre, Model model) {
        FicheForm6 fiche = new FicheForm6();
        fiche.setIdMembre(idMembre);
        model.addAttribute("fiche", fiche);
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche6");
        model.addAttribute("submitLabel", "Terminé");
        return "fiche/fiche-form6";
    }

    @GetMapping("/fiche6/edit")
    public String editForm(@RequestParam Long idMembre, Model model) {
        FicheForm6 fiche = service.findByIdMembre(idMembre).orElseGet(() -> {
            FicheForm6 newFiche = new FicheForm6();
            newFiche.setIdMembre(idMembre);
            return newFiche;
        });
        model.addAttribute("fiche", fiche);
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche6/edit");
        model.addAttribute("submitLabel", "Enregistrer");
        return "fiche/fiche-form6";
    }

    @PostMapping("/fiche6/edit")
    public String edit(@ModelAttribute FicheForm6 fiche) {
        service.save(fiche);
        return "redirect:/membres/" + fiche.getIdMembre() + "/fiche";
    }

    @PostMapping("/fiche6")
    public String create(@ModelAttribute FicheForm6 fiche) {
        service.save(fiche);
        return "redirect:/membres/" + fiche.getIdMembre() + "/fiche";
    }

    @GetMapping("/fiche6/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche6-view";
    }
}
