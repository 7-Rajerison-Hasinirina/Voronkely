package com.voronkely.controller;

import com.voronkely.entity.FicheForm1;
import com.voronkely.service.FicheForm1Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class FicheForm1Controller {

    private final FicheForm1Service service;

    public FicheForm1Controller(FicheForm1Service service) {
        this.service = service;
    }

    @GetMapping("/fiche1")
    public String list(Model model) {
        model.addAttribute("items", service.findAll());
        return "fiche/fiche1-list";
    }

    @GetMapping("/fiche1/new")
    public String createForm(@RequestParam(required = false) Long idMembre, Model model) {
        FicheForm1 fiche = new FicheForm1();
        fiche.setIdMembre(idMembre);
        model.addAttribute("fiche", fiche);
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche1");
        model.addAttribute("submitLabel", "Suivant");
        return "fiche/fiche-form1";
    }

    @GetMapping("/fiche1/edit")
    public String editForm(@RequestParam Long idMembre, Model model) {
        FicheForm1 fiche = service.findByIdMembre(idMembre).orElseGet(() -> {
            FicheForm1 newFiche = new FicheForm1();
            newFiche.setIdMembre(idMembre);
            return newFiche;
        });
        model.addAttribute("fiche", fiche);
        model.addAttribute("idMembre", idMembre);
        model.addAttribute("formAction", "/fiche1/edit");
        model.addAttribute("submitLabel", "Enregistrer");
        return "fiche/fiche-form1";
    }

    @PostMapping("/fiche1/edit")
    public String edit(@ModelAttribute FicheForm1 fiche,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) throws IOException {
        if (imageFile != null && !imageFile.isEmpty()) {
            String filename = Paths.get(imageFile.getOriginalFilename()).getFileName().toString();
            Path imagesDirectory = Paths.get("src/main/resources/static/images");
            Files.createDirectories(imagesDirectory);
            imageFile.transferTo(imagesDirectory.resolve(filename));
            fiche.setImage(filename);
        }
        service.save(fiche);
        return "redirect:/membres/" + fiche.getIdMembre() + "/fiche";
    }

    @PostMapping("/fiche1")
    public String create(@ModelAttribute FicheForm1 fiche,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) throws IOException {
        if (imageFile != null && !imageFile.isEmpty()) {
            String filename = Paths.get(imageFile.getOriginalFilename()).getFileName().toString();
            Path imagesDirectory = Paths.get("src/main/resources/static/images");
            Files.createDirectories(imagesDirectory);
            imageFile.transferTo(imagesDirectory.resolve(filename));
            fiche.setImage(filename);
        }
        service.save(fiche);
        return "redirect:/fiche2/new?idMembre=" + fiche.getIdMembre();
    }

    @GetMapping("/fiche1/{id}")
    public String view(@PathVariable Long id, Model model) {
        service.findById(id).ifPresent(f -> model.addAttribute("fiche", f));
        return "fiche/fiche1-view";
    }
}
