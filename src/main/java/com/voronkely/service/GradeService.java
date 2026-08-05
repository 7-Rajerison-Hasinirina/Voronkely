package com.voronkely.service;

import com.voronkely.entity.Grade;
import com.voronkely.repository.GradeRepository;
import com.voronkely.service.MembreGradeService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GradeService {

    private final GradeRepository gradeRepository;
    private final MembreGradeService membreGradeService;

    public GradeService(GradeRepository gradeRepository, MembreGradeService membreGradeService) {
        this.gradeRepository = gradeRepository;
        this.membreGradeService = membreGradeService;
    }

    public List<Grade> getAllGrades() {
        return gradeRepository.findAllByOrderByIdDesc();
    }

    public Optional<Grade> getGradeById(Long id) {
        return gradeRepository.findById(id);
    }

    public Grade saveGrade(Grade grade) {
        return gradeRepository.save(grade);
    }

    public void deleteGrade(Long id) {
        if (membreGradeService.existsByGradeId(id)) {
            throw new IllegalStateException("Impossible de supprimer ce grade car il est attribué à un membre.");
        }
        gradeRepository.deleteById(id);
    }
}
