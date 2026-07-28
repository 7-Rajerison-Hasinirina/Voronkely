package com.voronkely.controller;

import com.voronkely.entity.FicheForm4;
import com.voronkely.service.FicheForm4Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    public String createForm(@RequestParam Long idMembre, Model model) {
        model.addAttribute("idMembre", idMembre);
        return "fiche/fiche-form4";
    }

    @PostMapping("/fiche4")
    public String create(@RequestParam Long idMembre,
                         @RequestParam(required = false) List<String> taona,
                         @RequestParam(required = false) List<String> sekoly,
                         @RequestParam(required = false) List<String> kilasy,
                         @RequestParam(required = false) List<String> taranjaManavanana,
                         @RequestParam(required = false) List<String> taranjaManahirana) {
        int size = max(sizeOf(taona), sizeOf(sekoly), sizeOf(kilasy), sizeOf(taranjaManavanana), sizeOf(taranjaManahirana));
        for (int i = 0; i < size; i++) {
            String year = valueAt(taona, i);
            String school = valueAt(sekoly, i);
            String className = valueAt(kilasy, i);
            String strongSubject = valueAt(taranjaManavanana, i);
            String hardSubject = valueAt(taranjaManahirana, i);
            if (isBlank(year) && isBlank(school) && isBlank(className) && isBlank(strongSubject) && isBlank(hardSubject)) {
                continue;
            }
            FicheForm4 fiche = new FicheForm4();
            fiche.setIdMembre(idMembre);
            fiche.setTaona(parseInteger(year));
            fiche.setSekoly(school);
            fiche.setKilasy(className);
            fiche.setTaranjaManavanana(strongSubject);
            fiche.setTaranjaManahirana(hardSubject);
            service.save(fiche);
        }
        return "redirect:/fiche5/new?idMembre=" + idMembre;
    }

    @GetMapping("/fiche4/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche4-view";
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

    private Integer parseInteger(String value) {
        return isBlank(value) ? null : Integer.valueOf(value);
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
