package com.voronkely.controller;

import com.voronkely.entity.Camp;
import com.voronkely.entity.CampInfo;
import com.voronkely.service.CampInfoService;
import com.voronkely.service.CampService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/camp")
public class CampController {

    private final CampService campService;
    private final CampInfoService campInfoService;

    public CampController(CampService campService, CampInfoService campInfoService) {
        this.campService = campService;
        this.campInfoService = campInfoService;
    }

    @GetMapping
    public String pageCamp(Model model) {
        model.addAttribute("camps", campService.findAll());
        return "camp/page-camp";
    }

    @GetMapping("/nouveau")
    public String nouveauCamp(Model model) {
        model.addAttribute("camp", new Camp());
        return "camp/camp-form";
    }

    @PostMapping
    public String enregistrerCamp(@RequestParam String titre,
            @RequestParam(required = false) String dateDebut,
            @RequestParam(required = false) String dateFin,
            @RequestParam(required = false) String lieu) {
        Camp camp = new Camp();
        camp.setTitre(titre);
        camp.setLieu(lieu);
        if (dateDebut != null && !dateDebut.isBlank()) {
            camp.setDateDebut(LocalDate.parse(dateDebut));
        }
        if (dateFin != null && !dateFin.isBlank()) {
            camp.setDateFin(LocalDate.parse(dateFin));
        }
        campService.save(camp);
        return "redirect:/camp";
    }

    @GetMapping("/{id}")
    public String gestionCampInfo(@PathVariable Long id, Model model) {
        var opt = campService.findById(id);
        if (opt.isEmpty()) {
            return "redirect:/camp";
        }
        Camp camp = opt.get();
        model.addAttribute("camp", camp);
        campInfoService.findByCampId(id).ifPresent(info -> model.addAttribute("campInfo", info));
        return "camp/gestion-camp-info";
    }

    @GetMapping("/{id}/info/nouveau")
    public String nouveauCampInfo(@PathVariable Long id, Model model) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        Camp camp = campOpt.get();
        model.addAttribute("camp", camp);
        CampInfo campInfo = campInfoService.findByCampId(id).orElse(new CampInfo());
        model.addAttribute("campInfo", campInfo);
        return "camp/camp-info-form";
    }

    @PostMapping("/{id}/info")
    public String saveCampInfo(@PathVariable Long id,
            @RequestParam(required = false) String sampana,
            @RequestParam(required = false) String faritany,
            @RequestParam(required = false) String faritra,
            @RequestParam(required = false) String fivondronana,
            @RequestParam(required = false) String andiany,
            @RequestParam(required = false) String tarigetra,
            @RequestParam(required = false) String teninAndriamanitra,
            @RequestParam(required = false) String objectif,
            @RequestParam(required = false) String fandraharahana,
            @RequestParam(required = false) String fitaovana,
            @RequestParam(required = false) String araPanahy,
            @RequestParam(required = false) String fientanana,
            @RequestParam(required = false) String fahasalamana,
            @RequestParam(required = false) String isaMpilasy,
            @RequestParam(required = false) String fitanterana,
            @RequestParam(required = false) String toeranaHiaingana,
            @RequestParam(required = false) String toeranaHiverenana) {
        var campOpt = campService.findById(id);
        if (campOpt.isEmpty()) {
            return "redirect:/camp";
        }
        Camp camp = campOpt.get();
        CampInfo info = campInfoService.findByCampId(id).orElse(new CampInfo());
        info.setCamp(camp);
        info.setSampana(sampana);
        info.setFaritany(faritany);
        info.setFaritra(faritra);
        info.setFivondronana(fivondronana);
        info.setAndiany(andiany);
        info.setTarigetra(tarigetra);
        info.setTeninAndriamanitra(teninAndriamanitra);
        info.setObjectif(objectif);
        info.setFandraharahana(fandraharahana);
        info.setFitaovana(fitaovana);
        info.setAraPanahy(araPanahy);
        info.setFientanana(fientanana);
        info.setFahasalamana(fahasalamana);
        if (isaMpilasy != null && !isaMpilasy.isBlank()) {
            try {
                info.setIsaMpilasy(Integer.valueOf(isaMpilasy));
            } catch (NumberFormatException e) {
                info.setIsaMpilasy(null);
            }
        } else {
            info.setIsaMpilasy(null);
        }
        info.setFitanterana(fitanterana);
        info.setToeranaHiaingana(toeranaHiaingana);
        info.setToeranaHiverenana(toeranaHiverenana);

        campInfoService.save(info);
        return "redirect:/camp/" + id;
    }
}
