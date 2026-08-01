package com.voronkely.controller;

import com.voronkely.dto.MembreRechercheDto;
import com.voronkely.entity.Membre;
import com.voronkely.entity.MembreTarika;
import com.voronkely.entity.RoleTarika;
import com.voronkely.entity.Tarika;
import com.voronkely.service.MembreService;
import com.voronkely.service.MembreTarikaService;
import com.voronkely.service.RoleTarikaService;
import com.voronkely.service.TarikaService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/membre-tarika")
public class MembreTarikaController {

        private final MembreTarikaService membreTarikaService;

        private final TarikaService tarikaService;

        private final RoleTarikaService roleTarikaService;

        private final MembreService membreService;

        public MembreTarikaController(
                        MembreTarikaService membreTarikaService,
                        TarikaService tarikaService,
                        RoleTarikaService roleTarikaService,
                        MembreService membreService) {

                this.membreTarikaService = membreTarikaService;
                this.tarikaService = tarikaService;
                this.roleTarikaService = roleTarikaService;
                this.membreService = membreService;

        }

        @GetMapping("/recherche")
        @ResponseBody
        public MembreRechercheDto rechercherMembre(
                        @RequestParam String reference) {

                return membreService
                                .rechercheReferenceAvecImage(reference);

        }

        @GetMapping("/{idTarika}")
        public String pageMembreTarika(
                        @PathVariable Long idTarika,
                        Model model) {

                Tarika tarika = tarikaService.findById(idTarika)
                                .orElseThrow();

                model.addAttribute(
                                "tarika",
                                tarika);

                model.addAttribute(
                                "membresTarika",
                                membreTarikaService.findByTarika(idTarika));

                model.addAttribute(
                                "membresTarikaDto",
                                membreTarikaService.findDtoByTarika(idTarika));

                return "tarika/page-membre-tarika";

        }

        @GetMapping("/{idTarika}/nouveau")
        public String nouveau(
                        @PathVariable Long idTarika,
                        Model model) {

                model.addAttribute(
                                "idTarika",
                                idTarika);

                model.addAttribute(
                                "roles",
                                roleTarikaService.findAll());

                return "tarika/membre-tarika-form";

        }

        @PostMapping
        public String enregistrer(
                        @RequestParam Long idTarika,
                        @RequestParam List<Long> idMembre,
                        @RequestParam List<Long> idRoleTarika) {

                for (int i = 0; i < idMembre.size(); i++) {

                        MembreTarika membreTarika = new MembreTarika();

                        Tarika tarika = new Tarika();

                        tarika.setId(idTarika);

                        Membre membre = new Membre();

                        membre.setId(
                                        idMembre.get(i));

                        RoleTarika role = new RoleTarika();

                        role.setId(
                                        idRoleTarika.get(i));

                        membreTarika.setTarika(tarika);

                        membreTarika.setMembre(membre);

                        membreTarika.setRoleTarika(role);

                        membreTarika.setDate(
                                        LocalDate.now());

                        membreTarikaService.save(
                                        membreTarika);

                }

                return "redirect:/membre-tarika/" + idTarika;

        }

}