package com.voronkely.repository;

import com.voronkely.entity.MembreGrade;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MembreGradeRepository extends JpaRepository<MembreGrade, Long> {
    List<MembreGrade> findByMembreIdOrderByDateDesc(Long membreId);

    boolean existsByGradeId(Long gradeId);
}
