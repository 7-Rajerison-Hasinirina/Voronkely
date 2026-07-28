package com.voronkely.controller;

import com.voronkely.entity.FichePresence;
import com.voronkely.entity.Membre;
import com.voronkely.service.FichePresenceService;
import com.voronkely.service.MembreService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.voronkely.service.FicheForm1Service;
import java.util.stream.Collectors;
import java.util.ArrayList;


@Controller
@RequestMapping("/presence")
public class FichePresenceController {

    private final FichePresenceService fichePresenceService;
    private final FicheForm1Service ficheForm1Service;
    private final MembreService membreService;

    public FichePresenceController(
            FichePresenceService fichePresenceService,
            FicheForm1Service ficheForm1Service,
            MembreService membreService
    ) {
        this.fichePresenceService = fichePresenceService;
        this.ficheForm1Service = ficheForm1Service;
        this.membreService = membreService;
    }


    @GetMapping("/liste")
    public String pagePresence(Model model) {

        List<Membre> membres = membreService.findAll();

        Map<Long, String> images = new HashMap<>();

        for (Membre membre : membres) {
            ficheForm1Service.findByIdMembre(membre.getId())
                    .ifPresent(fiche -> images.put(membre.getId(), fiche.getImage()));
        }

        model.addAttribute("membres", membres);
        model.addAttribute("images", images);
        model.addAttribute("date", LocalDate.now());

        return "presence/page-presence";
    }


        @PostMapping("/save")
        public String savePresence(
                @RequestParam List<Long> idMembre,
                @RequestParam List<Boolean> present,
                @RequestParam LocalDate datePresence
        ) {
                for (int i = 0; i < idMembre.size(); i++) {

                FichePresence fiche =
                        fichePresenceService.findByMembreAndDate(
                                idMembre.get(i),
                                datePresence
                        );
                if (fiche == null) {
                        fiche = new FichePresence();
                        fiche.setIdMembre(idMembre.get(i));
                        fiche.setDatePresence(datePresence);
                }
                fiche.setPresent(present.get(i));
                fichePresenceService.save(fiche);
                }
                return "redirect:/presence/liste";
        }



@GetMapping("/detail/{id}")
public String detailPresence(
        @PathVariable Long id,
        @RequestParam(required = false) LocalDate dateMin,
        @RequestParam(required = false) LocalDate dateMax,
        Model model
){

    Membre membre =
            membreService.findById(id)
            .orElseThrow();


    model.addAttribute("membre", membre);



    ficheForm1Service.findByIdMembre(id)
            .ifPresent(fiche1 ->
                    model.addAttribute("fiche1", fiche1)
            );



    // Historique complet du membre
    List<FichePresence> presences =
            fichePresenceService.findByMembre(id);



    // Filtre date début
    if(dateMin != null){

        presences = presences.stream()
                .filter(p ->
                        !p.getDatePresence().isBefore(dateMin)
                )
                .toList();

    }



    // Filtre date fin
    if(dateMax != null){

        presences = presences.stream()
                .filter(p ->
                        !p.getDatePresence().isAfter(dateMax)
                )
                .toList();

    }



    model.addAttribute("presences", presences);



    // Garder les valeurs dans les champs du formulaire
    model.addAttribute("dateMin", dateMin);
    model.addAttribute("dateMax", dateMax);




    // Nombre de présence par mois
    Map<Integer, Long> statsMois =
            presences.stream()
            .filter(FichePresence::getPresent)
            .collect(Collectors.groupingBy(
                    p -> p.getDatePresence()
                          .getMonthValue(),
                    Collectors.counting()
            ));




    List<String> moisLabels = new ArrayList<>();

    List<Long> nombrePresence = new ArrayList<>();



    String[] nomsMois = {

            "Janvier",
            "Février",
            "Mars",
            "Avril",
            "Mai",
            "Juin",
            "Juillet",
            "Août",
            "Septembre",
            "Octobre",
            "Novembre",
            "Décembre"

    };



    for(int i = 1; i <= 12; i++){

        moisLabels.add(nomsMois[i-1]);


        nombrePresence.add(
                statsMois.getOrDefault(i,0L)
        );

    }



    model.addAttribute(
            "moisLabels",
            moisLabels
    );


    model.addAttribute(
            "nombrePresence",
            nombrePresence
    );



    return "presence/detail-presence";
}
}