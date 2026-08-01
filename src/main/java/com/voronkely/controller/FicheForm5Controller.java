package com.voronkely.controller;

import com.voronkely.entity.FicheForm5;
import com.voronkely.service.FicheForm5Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

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
    public String createForm(@RequestParam Long idMembre, Model model) {
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche5");
        model.addAttribute("submitLabel", "Suivant");
        return "fiche/fiche-form5";
    }

    @GetMapping("/fiche5/edit")
    public String editForm(@RequestParam Long idMembre, Model model) {
        FicheForm5 fiche = service.findByIdMembre(idMembre).orElseGet(() -> {
            FicheForm5 newFiche = new FicheForm5();
            newFiche.setIdMembre(idMembre);
            return newFiche;
        });
        model.addAttribute("fiche", fiche);
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche5/edit");
        model.addAttribute("submitLabel", "Enregistrer");
        return "fiche/fiche-form5";
    }

    @PostMapping("/fiche5/edit")
    public String edit(FicheForm5 fiche) {
        service.save(fiche);
        return "redirect:/membres/" + fiche.getIdMembre() + "/fiche";
    }

    @PostMapping("/fiche5")
    public String create(@RequestParam Long idMembre,
            @RequestParam(required = false) List<String> anarana,
            @RequestParam(required = false) List<String> datyNanomezana,
            @RequestParam(required = false) List<String> talentaNomena) {
        int size = max(sizeOf(anarana), sizeOf(datyNanomezana), sizeOf(talentaNomena));
        for (int i = 0; i < size; i++) {
            String name = valueAt(anarana, i);
            String date = valueAt(datyNanomezana, i);
            String talent = valueAt(talentaNomena, i);
            if (isBlank(name) && isBlank(date) && isBlank(talent)) {
                continue;
            }
            FicheForm5 fiche = new FicheForm5();
            fiche.setIdMembre(idMembre);
            fiche.setAnarana(name);
            fiche.setDatyNanomezana(parseDate(date));
            fiche.setTalentaNomena(talent);
            service.save(fiche);
        }
        return "redirect:/fiche6/new?idMembre=" + idMembre;
    }

    @GetMapping("/fiche5/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche5-view";
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

    private LocalDate parseDate(String value) {
        return isBlank(value) ? null : LocalDate.parse(value);
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
