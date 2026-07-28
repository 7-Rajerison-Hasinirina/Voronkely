package com.voronkely.controller;

import com.voronkely.entity.FicheForm2;
import com.voronkely.service.FicheForm2Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    public String createForm(@RequestParam Long idMembre, Model model) {
        model.addAttribute("idMembre", idMembre);
        return "fiche/fiche-form2";
    }

    @PostMapping("/fiche2")
    public String create(@RequestParam Long idMembre,
                         @RequestParam(required = false) List<String> aretinaMpahazo,
                         @RequestParam(required = false) List<String> fanafodyFampiasa) {
        int size = Math.max(sizeOf(aretinaMpahazo), sizeOf(fanafodyFampiasa));
        for (int i = 0; i < size; i++) {
            String aretina = valueAt(aretinaMpahazo, i);
            String fanafody = valueAt(fanafodyFampiasa, i);
            if (isBlank(aretina) && isBlank(fanafody)) {
                continue;
            }
            FicheForm2 fiche = new FicheForm2();
            fiche.setIdMembre(idMembre);
            fiche.setAretinaMpahazo(aretina);
            fiche.setFanafodyFampiasa(fanafody);
            service.save(fiche);
        }
        return "redirect:/fiche3/new?idMembre=" + idMembre;
    }

    @GetMapping("/fiche2/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche2-view";
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
