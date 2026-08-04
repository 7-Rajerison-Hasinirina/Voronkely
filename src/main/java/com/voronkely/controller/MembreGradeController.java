package com.voronkely.controller;

import com.voronkely.entity.Grade;
import com.voronkely.entity.Membre;
import com.voronkely.entity.MembreGrade;
import com.voronkely.service.GradeService;
import com.voronkely.service.MembreGradeService;
import com.voronkely.service.MembreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/membres")
public class MembreGradeController {

    private final MembreGradeService membreGradeService;
    private final MembreService membreService;
    private final GradeService gradeService;

    public MembreGradeController(MembreGradeService membreGradeService,
            MembreService membreService,
            GradeService gradeService) {
        this.membreGradeService = membreGradeService;
        this.membreService = membreService;
        this.gradeService = gradeService;
    }

    @GetMapping("/{id}/grades")
    public String pageGrades(@PathVariable Long id, Model model) {
        membreService.findById(id).ifPresent(membre -> model.addAttribute("membre", membre));
        model.addAttribute("gradesMembre", membreGradeService.findByMembreId(id));
        return "membre/membre-grade";
    }

    @GetMapping("/{id}/grades/nouveau")
    public String nouveauGrade(@PathVariable Long id, Model model) {
        membreService.findById(id).ifPresent(membre -> model.addAttribute("membre", membre));
        model.addAttribute("grades", gradeService.getAllGrades());
        model.addAttribute("membreGrade", new MembreGrade());
        return "membre/membre-grade-form";
    }

    @PostMapping("/{id}/grades")
    public String enregistrerGrade(@PathVariable Long id,
            @RequestParam(required = false) String date,
            @RequestParam Long idGrade) {
        Membre membre = membreService.findById(id).orElse(null);
        Grade grade = gradeService.getGradeById(idGrade).orElse(null);
        if (membre == null || grade == null) {
            return "redirect:/membres";
        }

        MembreGrade membreGrade = new MembreGrade();
        membreGrade.setMembre(membre);
        membreGrade.setGrade(grade);
        membreGrade.setDate(date != null && !date.isBlank() ? LocalDate.parse(date) : LocalDate.now());
        membreGradeService.save(membreGrade);

        return "redirect:/membres/" + id + "/grades";
    }
}
