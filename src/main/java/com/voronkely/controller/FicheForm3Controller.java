package com.voronkely.controller;

import com.voronkely.entity.FicheForm3;
import com.voronkely.service.FicheForm3Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    public String createForm(@RequestParam Long idMembre, Model model) {
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche3");
        model.addAttribute("submitLabel", "Suivant");
        return "fiche/fiche-form3";
    }

    @GetMapping("/fiche3/edit")
    public String editForm(@RequestParam Long idMembre, Model model) {
        FicheForm3 fiche = service.findByIdMembre(idMembre).orElseGet(() -> {
            FicheForm3 newFiche = new FicheForm3();
            newFiche.setIdMembre(idMembre);
            return newFiche;
        });
        model.addAttribute("fiche", fiche);
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche3/edit");
        model.addAttribute("submitLabel", "Enregistrer");
        return "fiche/fiche-form3";
    }

    @PostMapping("/fiche3/edit")
    public String edit(FicheForm3 fiche) {
        service.save(fiche);
        return "redirect:/membres/" + fiche.getIdMembre() + "/fiche";
    }

    @PostMapping("/fiche3")
    public String create(@RequestParam Long idMembre,
            @RequestParam(required = false) List<String> toetraMahafinaritra,
            @RequestParam(required = false) List<String> toetraManahirana,
            @RequestParam(required = false) List<String> zavatraTiana,
            @RequestParam(required = false) List<String> zavatraTsyTiana) {
        int size = max(sizeOf(toetraMahafinaritra), sizeOf(toetraManahirana), sizeOf(zavatraTiana),
                sizeOf(zavatraTsyTiana));
        for (int i = 0; i < size; i++) {
            String mahafinaritra = valueAt(toetraMahafinaritra, i);
            String manahirana = valueAt(toetraManahirana, i);
            String tiana = valueAt(zavatraTiana, i);
            String tsyTiana = valueAt(zavatraTsyTiana, i);
            if (isBlank(mahafinaritra) && isBlank(manahirana) && isBlank(tiana) && isBlank(tsyTiana)) {
                continue;
            }
            FicheForm3 fiche = new FicheForm3();
            fiche.setIdMembre(idMembre);
            fiche.setToetraMahafinaritra(mahafinaritra);
            fiche.setToetraManahirana(manahirana);
            fiche.setZavatraTiana(tiana);
            fiche.setZavatraTsyTiana(tsyTiana);
            service.save(fiche);
        }
        return "redirect:/fiche4/new?idMembre=" + idMembre;
    }

    @GetMapping("/fiche3/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche3-view";
    }

    private int max(int... values) {
        int result = 0;
        for (int value : values) {
            result = Math.max(result, value);
        }
        return result;
    }

    private int sizeOf(List<String> values) {
        return values == null ? 0 : values.size();
    }

    private String valueAt(List<String> values, int index) {
        return values != null && index < values.size() ? values.get(index) : null;
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
