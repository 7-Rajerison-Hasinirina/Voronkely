package com.voronkely.controller;

import com.voronkely.entity.Galerie;
import com.voronkely.service.GalerieService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/galerie")
public class GalerieController {

    private final GalerieService galerieService;
    private final Path uploadDir;

    public GalerieController(GalerieService galerieService) {
        this.galerieService = galerieService;
        this.uploadDir = Paths.get("src/main/resources/static/images/galerie");
        try {
            Files.createDirectories(uploadDir);
        } catch (IOException e) {
            throw new RuntimeException("Impossible de créer le répertoire de téléchargement de la galerie.", e);
        }
    }

    @GetMapping
    public String viewGalerie(Model model) {
        List<Galerie> galeries = galerieService.getAllGaleries();
        model.addAttribute("galeries", galeries);
        return "galerie/page-galerie";
    }

    @GetMapping("/nouveau")
    public String createGalerieForm(Model model) {
        model.addAttribute("galerie", new Galerie());
        return "galerie/galerie-form";
    }

    @PostMapping("/save")
    public String saveGalerie(
            @ModelAttribute Galerie galerie,
            @RequestParam("imageFile") MultipartFile imageFile,
            RedirectAttributes redirectAttributes) {
        if (!imageFile.isEmpty()) {
            String originalFilename = imageFile.getOriginalFilename();
            String filename = UUID.randomUUID().toString() + "-" + originalFilename;
            try {
                Path destination = uploadDir.resolve(filename);
                imageFile.transferTo(destination);
                galerie.setImageName(filename);
            } catch (IOException e) {
                redirectAttributes.addFlashAttribute("errorMessage", "Erreur lors du téléchargement de l'image.");
                return "redirect:/galerie/nouveau";
            }
        }

        if (galerie.getDate() == null) {
            galerie.setDate(LocalDate.now());
        }
        galerieService.saveGalerie(galerie);
        redirectAttributes.addFlashAttribute("successMessage", "Galerie enregistrée avec succès.");
        return "redirect:/galerie";
    }

    @PostMapping("/supprimer/{id}")
    public String deleteGalerie(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        galerieService.deleteGalerie(id);
        redirectAttributes.addFlashAttribute("successMessage", "Entrée galerie supprimée.");
        return "redirect:/galerie";
    }
}
