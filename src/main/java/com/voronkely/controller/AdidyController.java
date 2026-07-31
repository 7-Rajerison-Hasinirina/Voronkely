package com.voronkely.controller;

import com.voronkely.dto.MembreRechercheDto;
import com.voronkely.entity.Adidy;
import com.voronkely.entity.Membre;
import com.voronkely.entity.TypeAdidy;
import com.voronkely.service.AdidyService;
import com.voronkely.service.MembreService;
import com.voronkely.service.TypeAdidyService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/adidy")
public class AdidyController {


    private final AdidyService adidyService;
    private final MembreService membreService;
    private final TypeAdidyService typeAdidyService;



    public AdidyController(
            AdidyService adidyService,
            MembreService membreService,
            TypeAdidyService typeAdidyService
    ) {

        this.adidyService = adidyService;
        this.membreService = membreService;
        this.typeAdidyService = typeAdidyService;

    }





    @GetMapping
    public String pageAdidy(Model model) {


        model.addAttribute(
                "adidys",
                adidyService.findAll()
        );


        model.addAttribute(
                "montantGlobal",
                adidyService.montantGlobalRestant()
        );


        return "adidy/page-adidy";

    }







    @GetMapping("/nouveau")
    public String nouveau(Model model) {


        Adidy adidy = new Adidy();


        adidy.setDateAjout(LocalDate.now());

        adidy.setMontant(0.0);

        adidy.setMontantRestant(0.0);



        model.addAttribute(
                "adidy",
                adidy
        );



        model.addAttribute(
                "typesAdidy",
                typeAdidyService.findAll()
        );



        return "adidy/adidy-form";

    }







    @PostMapping
    public String enregistrer(
            @ModelAttribute Adidy adidy,
            @RequestParam("referenceMembre") String referenceMembre,
            @RequestParam("idTypeAdidy") Long idTypeAdidy
    ) {



        Membre membre = membreService
                .findByReference(referenceMembre)
                .orElseThrow(
                        () -> new RuntimeException("Membre introuvable")
                );



        TypeAdidy typeAdidy = typeAdidyService
                .findById(idTypeAdidy)
                .orElseThrow(
                        () -> new RuntimeException("Type adidy introuvable")
                );



        adidy.setMembre(membre);

        adidy.setTypeAdidy(typeAdidy);



        adidy.setMontantRestant(
                adidy.getMontant()
        );



        adidyService.save(adidy);



        return "redirect:/adidy";

    }








    @GetMapping("/recherche-membre")
    @ResponseBody
    public List<MembreRechercheDto> rechercheMembre(
            @RequestParam String reference
    ) {


        return membreService.rechercheVisite(reference);

    }







    @GetMapping("/{id}")
    public String detail(
            @PathVariable Long id
    ) {


        return "redirect:/mouvement-adidy/" + id;

    }


}