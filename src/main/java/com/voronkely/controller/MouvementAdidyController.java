package com.voronkely.controller;

import com.voronkely.entity.Adidy;
import com.voronkely.entity.MouvementAdidy;
import com.voronkely.service.AdidyService;
import com.voronkely.service.MouvementAdidyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/mouvement-adidy")
public class MouvementAdidyController {


    private final MouvementAdidyService mouvementAdidyService;

    private final AdidyService adidyService;




    public MouvementAdidyController(
            MouvementAdidyService mouvementAdidyService,
            AdidyService adidyService
    ) {

        this.mouvementAdidyService = mouvementAdidyService;
        this.adidyService = adidyService;

    }





    @GetMapping("/{id}")
    public String pageMouvement(
            @PathVariable Long id,
            Model model
    ) {


        Adidy adidy = adidyService
                .findById(id)
                .orElseThrow();



        model.addAttribute(
                "adidy",
                adidy
        );



        model.addAttribute(
                "mouvements",
                mouvementAdidyService.findAllByAdidy(id)
        );



        return "adidy/mouvement-adidy";

    }




        @PostMapping
        public String enregistrer(
                @RequestParam Long idAdidy,
                @ModelAttribute MouvementAdidy mouvementAdidy
        ) {


        Adidy adidy = adidyService
                .findById(idAdidy)
                .orElseThrow();



        mouvementAdidy.setAdidy(adidy);


        mouvementAdidy.setDateMouvement(
                LocalDate.now()
        );



        mouvementAdidyService.save(
                mouvementAdidy
        );



        if (mouvementAdidy.getTypeMouvement().equals("SORTIE")) {


                adidy.setMontantRestant(
                        adidy.getMontantRestant()
                        -
                        mouvementAdidy.getMontant()
                );


        }
        else {


                adidy.setMontantRestant(
                        adidy.getMontantRestant()
                        +
                        mouvementAdidy.getMontant()
                );


        }



        adidyService.save(adidy);



        return "redirect:/mouvement-adidy/" + idAdidy;

        }

}