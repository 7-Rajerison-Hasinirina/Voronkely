package com.voronkely.controller;

import com.voronkely.entity.TypeAssurance;
import com.voronkely.service.TypeAssuranceService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/type-assurance")
public class TypeAssuranceController {


    private final TypeAssuranceService typeAssuranceService;


    public TypeAssuranceController(
            TypeAssuranceService typeAssuranceService
    ){

        this.typeAssuranceService = typeAssuranceService;

    }





    @GetMapping
    public String page(Model model){


        model.addAttribute(
                "typesAssurance",
                typeAssuranceService.findAll()
        );


        return "assurance/type-assurance";

    }





    @GetMapping("/nouveau")
    public String nouveau(Model model){


        model.addAttribute(
                "typeAssurance",
                new TypeAssurance()
        );


        return "assurance/type-assurance-form";

    }





    @PostMapping
    public String enregistrer(
            @ModelAttribute TypeAssurance typeAssurance
    ){


        typeAssuranceService.save(
                typeAssurance
        );


        return "redirect:/type-assurance";

    }





    @GetMapping("/supprimer/{id}")
    public String supprimer(
            @PathVariable Long id
    ){


        typeAssuranceService.deleteById(id);


        return "redirect:/type-assurance";

    }

}