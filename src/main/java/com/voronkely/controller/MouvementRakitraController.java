package com.voronkely.controller;


import com.voronkely.entity.MouvementRakitra;
import com.voronkely.entity.Rakitra;
import com.voronkely.service.MouvementRakitraService;
import com.voronkely.service.RakitraService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;


@Controller
@RequestMapping("/mouvement-rakitra")
public class MouvementRakitraController {


    private final MouvementRakitraService mouvementService;

    private final RakitraService rakitraService;



    public MouvementRakitraController(
            MouvementRakitraService mouvementService,
            RakitraService rakitraService
    ){

        this.mouvementService = mouvementService;
        this.rakitraService = rakitraService;

    }





    @GetMapping
    public String index(){

        return "redirect:/rakitra";

    }






    @GetMapping("/{id}")
    public String page(
            @PathVariable Long id,
            Model model
    ){


        Rakitra rakitra = rakitraService
                .findById(id)
                .orElseThrow();



        model.addAttribute(
                "rakitra",
                rakitra
        );



        model.addAttribute(
                "mouvements",
                mouvementService.findByRakitra(id)
        );



        return "rakitra/mouvement-rakitra";

    }







    @PostMapping
    public String enregistrer(

            @RequestParam Long idRakitra,

            @RequestParam Double montantADeduire,

            @RequestParam String motifUtilisation,

            @RequestParam String typeMouvement

    ){


        Rakitra rakitra = rakitraService
                .findById(idRakitra)
                .orElseThrow();




        MouvementRakitra mouvement =
                new MouvementRakitra();



        mouvement.setRakitra(
                rakitra
        );


        mouvement.setMontantADeduire(
                montantADeduire
        );


        mouvement.setMotifUtilisation(
                motifUtilisation
        );


        mouvement.setTypeMouvement(
                typeMouvement
        );


        mouvement.setDateMouvement(
                LocalDate.now()
        );



        mouvementService.save(
                mouvement
        );





        Double totalDeduit =
                mouvementService.totalDeduit(idRakitra);




        rakitra.setMontantRestant(
                rakitra.getMontant() - totalDeduit
        );



        rakitraService.save(
                rakitra
        );




        return "redirect:/mouvement-rakitra/" + idRakitra;

    }


}