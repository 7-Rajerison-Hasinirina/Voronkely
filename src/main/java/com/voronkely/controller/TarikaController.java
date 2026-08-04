package com.voronkely.controller;

import com.voronkely.entity.Tarika;
import com.voronkely.service.TarikaService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.time.LocalDate;

@Controller
@RequestMapping("/tarika")
public class TarikaController {

    private final TarikaService tarikaService;

    public TarikaController(TarikaService tarikaService) {

        this.tarikaService = tarikaService;

    }

    @GetMapping
    public String pageTarika(Model model) {

        model.addAttribute(
                "tarikas",
                tarikaService.findAll());

        return "tarika/page-tarika";

    }

    @GetMapping("/nouveau")
    public String nouveau(Model model) {

        Tarika tarika = new Tarika();

        tarika.setDateCreation(LocalDate.now());

        model.addAttribute(
                "tarika",
                tarika);

        return "tarika/tarika-form";

    }

    @PostMapping
    public String enregistrer(
            @ModelAttribute Tarika tarika,
            @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

        if (!imageFile.isEmpty()) {

            String nomImage = imageFile.getOriginalFilename();

            tarika.setImage(nomImage);

            Path dossier = Paths.get(
                    "src/main/webapp/images");

            if (!Files.exists(dossier)) {

                Files.createDirectories(dossier);

            }

            Path fichier = dossier.resolve(nomImage);

            Files.write(
                    fichier,
                    imageFile.getBytes());

        }

        tarikaService.save(tarika);

        return "redirect:/tarika";
    }

    @GetMapping("/{id}/supprimer")
    public String supprimerGet(@PathVariable Long id) {
        tarikaService.delete(id);
        return "redirect:/tarika";
    }

    @PostMapping("/{id}/supprimer")
    public String supprimer(@PathVariable Long id) {
        tarikaService.delete(id);
        return "redirect:/tarika";
    }

}