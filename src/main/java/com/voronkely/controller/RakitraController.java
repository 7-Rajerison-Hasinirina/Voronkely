package com.voronkely.controller;

import com.voronkely.entity.Rakitra;
import com.voronkely.service.RakitraService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/rakitra")
public class RakitraController {

    private final RakitraService rakitraService;

    public RakitraController(RakitraService rakitraService) {
        this.rakitraService = rakitraService;
    }

    @GetMapping
    public String pageRakitra(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateMin,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateMax,
            Model model) {

        model.addAttribute(
                "rakitras",
                rakitraService.findByDateRange(dateMin, dateMax));

        model.addAttribute(
                "montantGlobal",
                rakitraService.montantGlobalRestant());

        model.addAttribute("dateMin", dateMin);
        model.addAttribute("dateMax", dateMax);

        return "rakitra/page-rakitra";
    }

    @GetMapping("/nouveau")
    public String nouveau(Model model) {

        Rakitra rakitra = new Rakitra();

        rakitra.setDateAjout(LocalDate.now());

        rakitra.setMontant(0.0);

        rakitra.setMontantRestant(0.0);

        model.addAttribute(
                "rakitra",
                rakitra);

        return "rakitra/rakitra-form";
    }

    @PostMapping
    public String creer(
            @ModelAttribute Rakitra rakitra) {

        // Au départ le restant est égal au montant
        rakitra.setMontantRestant(
                rakitra.getMontant());

        rakitraService.save(rakitra);

        return "redirect:/rakitra";
    }

    @GetMapping("/{id}")
    public String detail(
            @PathVariable Long id,
            Model model) {

        return "redirect:/mouvement-rakitra/" + id;

    }

}