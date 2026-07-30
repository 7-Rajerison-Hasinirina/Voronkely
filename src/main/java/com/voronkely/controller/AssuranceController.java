package com.voronkely.controller;

import com.voronkely.entity.Assurance;
import com.voronkely.entity.Membre;
import com.voronkely.repository.MembreRepository;
import com.voronkely.service.AssuranceService;
import com.voronkely.service.MembreService;
import com.voronkely.service.TypeAssuranceService;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/assurance")
public class AssuranceController {


    private final AssuranceService assuranceService;
    private final TypeAssuranceService typeAssuranceService;
    private final MembreService membreService;
    // private final MembreRepository membreRepository;



    public AssuranceController(
            AssuranceService assuranceService,
            TypeAssuranceService typeAssuranceService,
            MembreService membreService
    ) {
        this.assuranceService = assuranceService;
        this.typeAssuranceService = typeAssuranceService;
        this.membreService = membreService;
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