package com.voronkely.controller;

import com.voronkely.entity.Grade;
import com.voronkely.service.GradeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/grade")
public class GradeController {

    private final GradeService gradeService;
    private final Path uploadDir;

    public GradeController(GradeService gradeService) {
        this.gradeService = gradeService;
        this.uploadDir = Paths.get("src/main/resources/static/images/grade");
        try {
            Files.createDirectories(uploadDir);
        } catch (IOException e) {
            throw new RuntimeException("Impossible de créer le répertoire de téléchargement de grade.", e);
        }
    }

    @GetMapping
    public String viewGrade(Model model) {
        List<Grade> grades = gradeService.getAllGrades();
        model.addAttribute("grades", grades);
        return "grade/page-grade";
    }

    @GetMapping("/nouveau")
    public String createGradeForm(Model model) {
        model.addAttribute("grade", new Grade());
        return "grade/grade-form";
    }

    @PostMapping("/save")
    public String saveGrade(
            @RequestParam("grade") String gradeValue,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            RedirectAttributes redirectAttributes) {
        Grade grade = new Grade();
        grade.setGrade(gradeValue);

        if (imageFile != null && !imageFile.isEmpty()) {
            String originalFilename = imageFile.getOriginalFilename();
            String filename = UUID.randomUUID().toString() + "-" + originalFilename;
            try {
                Path destination = uploadDir.resolve(filename);
                imageFile.transferTo(destination);
                grade.setImageName(filename);
            } catch (IOException e) {
                redirectAttributes.addFlashAttribute("errorMessage", "Erreur lors du téléchargement de l'image.");
                return "redirect:/grade/nouveau";
            }
        }

        gradeService.saveGrade(grade);
        redirectAttributes.addFlashAttribute("successMessage", "Grade enregistré avec succès.");
        return "redirect:/grade";
    }

    @PostMapping("/supprimer/{id}")
    public String deleteGrade(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        gradeService.deleteGrade(id);
        redirectAttributes.addFlashAttribute("successMessage", "Grade supprimé avec succès.");
        return "redirect:/grade";
    }
}
