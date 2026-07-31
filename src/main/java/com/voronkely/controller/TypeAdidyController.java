package com.voronkely.controller;

import com.voronkely.entity.TypeAdidy;
import com.voronkely.service.TypeAdidyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/type-adidy")
public class TypeAdidyController {


    private final TypeAdidyService typeAdidyService;


    public TypeAdidyController(TypeAdidyService typeAdidyService) {

        this.typeAdidyService = typeAdidyService;

    }



    @GetMapping
    public String pageTypeAdidy(Model model) {

        model.addAttribute(
                "typesAdidy",
                typeAdidyService.findAll()
        );


        return "adidy/type-adidy/page-type-adidy";

    }




    @GetMapping("/nouveau")
    public String nouveau(Model model) {


        model.addAttribute(
                "typeAdidy",
                new TypeAdidy()
        );


        return "adidy/type-adidy/type-adidy-form";

    }





    @PostMapping
    public String enregistrer(
            @ModelAttribute TypeAdidy typeAdidy
    ){

        typeAdidyService.save(typeAdidy);


        return "redirect:/type-adidy";

    }






    @GetMapping("/supprimer/{id}")
    public String supprimer(
            @PathVariable Long id
    ){

        typeAdidyService.deleteById(id);


        return "redirect:/type-adidy";

    }


}