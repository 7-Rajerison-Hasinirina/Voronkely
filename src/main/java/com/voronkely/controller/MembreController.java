package com.voronkely.controller;

import com.voronkely.entity.Membre;
import com.voronkely.service.FicheForm1Service;
import com.voronkely.service.FicheForm2Service;
import com.voronkely.service.FicheForm3Service;
import com.voronkely.service.FicheForm4Service;
import com.voronkely.service.FicheForm5Service;
import com.voronkely.service.FicheForm6Service;
import com.voronkely.service.MembreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MembreController {

    private final MembreService membreService;
    private final FicheForm1Service ficheForm1Service;
    private final FicheForm2Service ficheForm2Service;
    private final FicheForm3Service ficheForm3Service;
    private final FicheForm4Service ficheForm4Service;
    private final FicheForm5Service ficheForm5Service;
    private final FicheForm6Service ficheForm6Service;

    public MembreController(MembreService membreService,
                            FicheForm1Service ficheForm1Service,
                            FicheForm2Service ficheForm2Service,
                            FicheForm3Service ficheForm3Service,
                            FicheForm4Service ficheForm4Service,
                            FicheForm5Service ficheForm5Service,
                            FicheForm6Service ficheForm6Service) {
        this.membreService = membreService;
        this.ficheForm1Service = ficheForm1Service;
        this.ficheForm2Service = ficheForm2Service;
        this.ficheForm3Service = ficheForm3Service;
        this.ficheForm4Service = ficheForm4Service;
        this.ficheForm5Service = ficheForm5Service;
        this.ficheForm6Service = ficheForm6Service;
    }

    @GetMapping("/membres")
    public String listMembres(Model model) {
        model.addAttribute("membres", membreService.findAll());
        return "membre/liste-membre";
    }

    @GetMapping("/membres/new")
    public String showCreateForm(Model model) {
        model.addAttribute("membre", new Membre());
        return "membre/membre-form";
    }

    @PostMapping("/membres")
    public String createMembre(@ModelAttribute Membre membre) {
        membreService.save(membre);
        return "redirect:/membres";
    }

    @GetMapping("/membres/{id}")
    public String viewMembre(@PathVariable Long id, Model model) {
        membreService.findById(id).ifPresent(membre -> model.addAttribute("membre", membre));
        return "membre/view";
    }

    @GetMapping("/membres/{id}/fiche")
    public String ficheMembre(@PathVariable Long id, Model model) {
        membreService.findById(id).ifPresent(membre -> model.addAttribute("membre", membre));
        ficheForm1Service.findByIdMembre(id).ifPresent(fiche -> model.addAttribute("fiche1", fiche));
        model.addAttribute("fiche2List", ficheForm2Service.findAllByIdMembre(id));
        model.addAttribute("fiche3List", ficheForm3Service.findAllByIdMembre(id));
        model.addAttribute("fiche4List", ficheForm4Service.findAllByIdMembre(id));
        model.addAttribute("fiche5List", ficheForm5Service.findAllByIdMembre(id));
        model.addAttribute("fiche6List", ficheForm6Service.findAllByIdMembre(id));
        return "membre/fiche-membre";
    }
}
