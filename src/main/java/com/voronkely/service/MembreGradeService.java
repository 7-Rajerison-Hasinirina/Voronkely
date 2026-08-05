package com.voronkely.service;

import com.voronkely.entity.MembreGrade;
import com.voronkely.repository.MembreGradeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MembreGradeService {

    private final MembreGradeRepository repository;

    public MembreGradeService(MembreGradeRepository repository) {
        this.repository = repository;
    }

    public List<MembreGrade> findByMembreId(Long membreId) {
        return repository.findByMembreIdOrderByDateDesc(membreId);
    }

    public MembreGrade save(MembreGrade membreGrade) {
        return repository.save(membreGrade);
    }

    public boolean existsByGradeId(Long gradeId) {
        return repository.existsByGradeId(gradeId);
    }
}
