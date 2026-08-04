package com.voronkely.controller;

import com.voronkely.entity.Assurance;
import com.voronkely.service.AdidyService;
import com.voronkely.service.AssuranceService;
import com.voronkely.service.MembreService;
import com.voronkely.service.TarikaService;
import com.voronkely.service.VisiteParentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private final MembreService membreService;
    private final AssuranceService assuranceService;
    private final AdidyService adidyService;
    private final TarikaService tarikaService;
    private final VisiteParentService visiteParentService;

    public DashboardController(
            MembreService membreService,
            AssuranceService assuranceService,
            AdidyService adidyService,
            TarikaService tarikaService,
            VisiteParentService visiteParentService) {
        this.membreService = membreService;
        this.assuranceService = assuranceService;
        this.adidyService = adidyService;
        this.tarikaService = tarikaService;
        this.visiteParentService = visiteParentService;
    }

    @GetMapping({ "/", "/dashboard" })
    public String dashboard(Model model) {
        long totalMembres = membreService.findAll().size();
        long visitesEnAttente = visiteParentService.findEnAttente().size();
        double montantAssurance = assuranceService.findAll().stream()
                .mapToDouble(Assurance::getMontant)
                .sum();
        double montantAdidy = adidyService.montantTotal();
        long nombreTarika = tarikaService.findAll().size();

        model.addAttribute("totalMembres", totalMembres);
        model.addAttribute("visitesEnAttente", visitesEnAttente);
        model.addAttribute("montantAssurance", montantAssurance);
        model.addAttribute("montantAdidy", montantAdidy);
        model.addAttribute("nombreTarika", nombreTarika);

        return "dashboard/dashboard";
    }
}
