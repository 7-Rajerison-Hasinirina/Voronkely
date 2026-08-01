package com.voronkely.controller;

import com.voronkely.entity.ActiviteFicheTechnique;
import com.voronkely.entity.FicheTechnique;
import com.voronkely.entity.FicheTechniqueInfo;
import com.voronkely.service.FicheTechniqueInfoService;
import com.voronkely.service.FicheTechniqueService;
import com.voronkely.repository.ActiviteFicheTechniqueRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/fiche-technique")
public class FicheTechniqueController {

    private final FicheTechniqueService ficheService;
    private final FicheTechniqueInfoService infoService;
    private final ActiviteFicheTechniqueRepository activiteRepo;
    private final com.voronkely.service.NumeroTrimestreService numeroTrimestreService;

    public FicheTechniqueController(FicheTechniqueService ficheService, FicheTechniqueInfoService infoService,
            ActiviteFicheTechniqueRepository activiteRepo,
            com.voronkely.service.NumeroTrimestreService numeroTrimestreService) {
        this.ficheService = ficheService;
        this.infoService = infoService;
        this.activiteRepo = activiteRepo;
        this.numeroTrimestreService = numeroTrimestreService;
    }

    @GetMapping
    public String pageFicheTechnique(Model model) {
        model.addAttribute("fiches", ficheService.findAll());
        return "fiche-technique/page-fiche-technique";
    }

    @GetMapping("/nouveau")
    public String nouveau(Model model) {
        FicheTechnique f = new FicheTechnique();
        model.addAttribute("ficheTechnique", f);
        model.addAttribute("numeroTrimestres", numeroTrimestreService.findAll());
        return "fiche-technique/fiche-technique-form";
    }

    @PostMapping
    public String enregistrer(@ModelAttribute FicheTechnique fiche) {
        if (fiche.getNumeroTrimestre() != null && fiche.getNumeroTrimestre().getId() != null) {
            var opt = numeroTrimestreService.findById(fiche.getNumeroTrimestre().getId());
            opt.ifPresent(fiche::setNumeroTrimestre);
        }

        ficheService.save(fiche);
        return "redirect:/fiche-technique";
    }

    @GetMapping("/{id}")
    public String gestionInfo(@PathVariable Long id, Model model) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        FicheTechnique fiche = opt.get();
        model.addAttribute("fiche", fiche);

        // load info (one) and activities
        // simple: attempt to find info by fiche id via repository search omitted ->
        // show empty
        model.addAttribute("info", null);

        List<ActiviteFicheTechnique> activites = activiteRepo.findByFicheTechniqueId(id);
        if (activites == null)
            activites = new ArrayList<>();
        model.addAttribute("activites", activites);

        return "fiche-technique/gestion-fiche-technique-info";
    }

    @PostMapping("/{id}/info")
    public String saveInfo(@PathVariable Long id, @RequestParam String faritra,
            @RequestParam(required = false) String tarigetra, @RequestParam(required = false) String filoha) {
        var opt = ficheService.findById(id);
        if (opt.isEmpty())
            return "redirect:/fiche-technique";

        FicheTechniqueInfo info = new FicheTechniqueInfo();
        info.setFicheTechnique(opt.get());
        info.setFaritra(faritra);
        info.setTarigetra(tarigetra);
        info.setFiloha(filoha);

        infoService.save(info);

        return "redirect:/fiche-technique/" + id;
    }

}
