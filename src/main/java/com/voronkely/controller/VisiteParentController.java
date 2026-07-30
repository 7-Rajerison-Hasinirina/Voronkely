package com.voronkely.controller;

import com.voronkely.dto.MembreRechercheDto;
import com.voronkely.entity.FicheForm1;
import com.voronkely.entity.Membre;
import com.voronkely.entity.VisiteParent;
import com.voronkely.service.FicheForm1Service;
import com.voronkely.service.MembreService;
import com.voronkely.service.VisiteParentService;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.voronkely.dto.*;

@Controller
@RequestMapping("/visite")
public class VisiteParentController {

    private final VisiteParentService visiteParentService;
    private final MembreService membreService;
    private final FicheForm1Service ficheForm1Service;

    public VisiteParentController(
            VisiteParentService visiteParentService,
            MembreService membreService,
            FicheForm1Service ficheForm1Service) {

        this.visiteParentService = visiteParentService;
        this.membreService = membreService;
        this.ficheForm1Service = ficheForm1Service;
    }

    /**
     * Formulaire de création
     */
    @GetMapping("/nouveau")
    public String nouveau(Model model) {

        VisiteParent visite = new VisiteParent();
        visite.setDateVisite(LocalDate.now());
        visite.setStatut("En attente");

        model.addAttribute("visite", visite);

        return "visite/visite-form";
    }

    /**
     * Création d'une visite
     */
    @PostMapping
    public String creer(
            @ModelAttribute VisiteParent visite) {

        visiteParentService.save(visite);

        return "redirect:/visite/visite-parent";
    }

    /**
     * Liste des visites en attente
     */
    @GetMapping("/visite-parent")
    public String pageVisiteParent(Model model) {

        List<VisiteParent> visites = visiteParentService.findEnAttente();

        Map<Long, Membre> membres = new HashMap<>();
        Map<Long, FicheForm1> fiches = new HashMap<>();

        for (VisiteParent visite : visites) {

            if (visite == null || visite.getIdMembre() == null) {
                continue;
            }

            membreService.findById(visite.getIdMembre())
                    .ifPresent(membre ->
                            membres.put(visite.getIdMembre(), membre));

            ficheForm1Service.findByIdMembre(visite.getIdMembre())
                    .ifPresent(fiche ->
                            fiches.put(visite.getIdMembre(), fiche));
        }

        model.addAttribute("visites", visites);
        model.addAttribute("membres", membres);
        model.addAttribute("fiches", fiches);

        return "visite/visite-parent";
    }

    /**
     * Recherche AJAX par référence
     */
    @GetMapping("/recherche")
    @ResponseBody
    public MembreRechercheDto recherche(
            @RequestParam String reference){

        return membreService
                .rechercheReference(reference)
                .orElse(null);

    }

    @PostMapping("/{id}/terminer")
    public String terminer(
            @PathVariable Long id){

        visiteParentService.terminer(id);

        return "redirect:/visite/visite-parent";

    }


    @GetMapping("/historique")
    public String historique(

            @RequestParam(required = false) String reference,

            @RequestParam(required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
            LocalDate dateMin,

            @RequestParam(required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
            LocalDate dateMax,

            Model model) {

        List<HistoriqueVisiteDto> historiques =
                visiteParentService.historique(
                        reference,
                        dateMin,
                        dateMax);

        model.addAttribute("historiques", historiques);

        model.addAttribute("reference", reference);
        model.addAttribute("dateMin", dateMin);
        model.addAttribute("dateMax", dateMax);

        return "visite/historique-visite";
    }
}