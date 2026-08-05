package com.voronkely.controller;

import com.voronkely.entity.Membre;
import com.voronkely.entity.MembreTarika;
import com.voronkely.entity.RoleTarika;
import com.voronkely.entity.Tarika;
import com.voronkely.service.MembreTarikaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/membre-tarika")
public class MembreTarikaSaveController {

    private final MembreTarikaService membreTarikaService;

    public MembreTarikaSaveController(MembreTarikaService membreTarikaService) {
        this.membreTarikaService = membreTarikaService;
    }

    @PostMapping("/save")
    public String save(
            @RequestParam Long idTarika,
            @RequestParam(required = false) List<String> idMembre,
            @RequestParam(required = false) List<String> idRoleTarika,
            RedirectAttributes redirectAttributes) {

        if (idMembre == null || idRoleTarika == null) {
            return "redirect:/membre-tarika/" + idTarika;
        }

        int size = Math.min(idMembre.size(), idRoleTarika.size());
        List<String> duplicateMessages = new ArrayList<>();
        boolean savedAny = false;

        for (int i = 0; i < size; i++) {

            String membreStr = idMembre.get(i);
            String roleStr = idRoleTarika.get(i);

            if (membreStr == null || membreStr.trim().isEmpty())
                continue;
            if (roleStr == null || roleStr.trim().isEmpty())
                continue;

            Long idM = null;
            Long idR = null;
            try {
                idM = Long.valueOf(membreStr);
                idR = Long.valueOf(roleStr);
            } catch (NumberFormatException ex) {
                continue;
            }

            var existing = membreTarikaService.findByMembreId(idM);
            if (existing.isPresent()) {
                var mt = existing.get();
                String membreLabel = mt.getMembre() != null ? mt.getMembre().getReference() : "Ce membre";
                String tarikaLabel = mt.getTarika() != null ? mt.getTarika().getNom() : "un autre tarika";
                duplicateMessages.add(membreLabel + " est déjà dans le tarika " + tarikaLabel + ".");
                continue;
            }

            MembreTarika membreTarika = new MembreTarika();

            Tarika tarika = new Tarika();
            tarika.setId(idTarika);

            Membre membre = new Membre();
            membre.setId(idM);

            RoleTarika role = new RoleTarika();
            role.setId(idR);

            membreTarika.setTarika(tarika);
            membreTarika.setMembre(membre);
            membreTarika.setRoleTarika(role);
            membreTarika.setDate(LocalDate.now());

            membreTarikaService.save(membreTarika);
            savedAny = true;
        }

        if (savedAny) {
            redirectAttributes.addFlashAttribute("successMessage", "Membre(s) ajouté(s) avec succès.");
        }
        if (!duplicateMessages.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", String.join(" ", duplicateMessages));
        }

        return "redirect:/membre-tarika/" + idTarika;
    }

}
