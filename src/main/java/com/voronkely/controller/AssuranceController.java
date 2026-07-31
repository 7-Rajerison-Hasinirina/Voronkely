package com.voronkely.controller;

import com.voronkely.dto.MembreRechercheDto;
import com.voronkely.entity.*;
import com.voronkely.dto.*;
import com.voronkely.repository.MembreRepository;
import com.voronkely.service.AssuranceService;
import com.voronkely.service.MembreService;
import com.voronkely.service.TypeAssuranceService;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import com.voronkely.dto.HistoriqueAssuranceDto;

@Controller
@RequestMapping("/assurance")
public class AssuranceController {


    private final AssuranceService assuranceService;
    private final TypeAssuranceService typeAssuranceService;
    private final MembreService membreService;
    // private final MembreRepository membreRepository;

        @GetMapping("/historique")
        public String historique(

                @RequestParam(required = false) String reference,

                @RequestParam(required = false)
                @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
                LocalDate dateMin,

                @RequestParam(required = false)
                @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
                LocalDate dateMax,

                Model model){

        List<Assurance> assurances;

        if(dateMin != null && dateMax != null){

                assurances = assuranceService.findByDateBetween(
                        dateMin,
                        dateMax);

                if(reference != null && !reference.isBlank()){

                assurances = assurances.stream()
                        .filter(a -> a.getMembre().getReference()
                                .toLowerCase()
                                .contains(reference.toLowerCase()))
                        .toList();
                }

        }else{

                assurances = assuranceService.findAll();

                if(reference != null && !reference.isBlank()){

                assurances = assurances.stream()
                        .filter(a -> a.getMembre().getReference()
                                .toLowerCase()
                                .contains(reference.toLowerCase()))
                        .toList();
                }
        }

        List<HistoriqueAssuranceDto> totaux =
                assuranceService.historique(
                        reference,
                        dateMin,
                        dateMax);

        model.addAttribute("assurances", assurances);
        model.addAttribute("totaux", totaux);

        model.addAttribute("reference", reference);
        model.addAttribute("dateMin", dateMin);
        model.addAttribute("dateMax", dateMax);

        return "assurance/historique-assurance";
        }
                        


    public AssuranceController(
            AssuranceService assuranceService,
            TypeAssuranceService typeAssuranceService,
            MembreService membreService
    ) {
        this.assuranceService = assuranceService;
        this.typeAssuranceService = typeAssuranceService;
        this.membreService = membreService;
    }



    @GetMapping("/recherche")
        @ResponseBody
        public MembreRechercheDto recherche(
                @RequestParam String reference){

        return membreService
                .rechercheReference(reference)
                .orElse(null);

        }



    @GetMapping
    public String pageAssurance(Model model){

        model.addAttribute(
                "assurances",
                assuranceService.findAll()
        );

        return "assurance/page-assurance";
    }




    @GetMapping("/nouveau")
    public String nouveau(Model model){

        model.addAttribute(
                "assurance",
                new Assurance()
        );


        model.addAttribute(
                "typesAssurance",
                typeAssuranceService.findAll()
        );


        return "assurance/assurance-form";
    }




    @PostMapping
    public String enregistrer(
            @RequestParam Long idMembre,
            @RequestParam Long idTypeAssurance,
            @ModelAttribute Assurance assurance
    ){


        Membre membre =
                membreService.findById(idMembre)
                .orElseThrow();



        assurance.setMembre(membre);



        assurance.setTypeAssurance(
                typeAssuranceService
                .findById(idTypeAssurance)
                .orElseThrow()
        );



        assuranceService.save(assurance);



        return "redirect:/assurance";

    }




    @GetMapping("/supprimer/{id}")
    public String supprimer(
            @PathVariable Long id
    ){

        assuranceService.deleteById(id);


        return "redirect:/assurance";
    }

}