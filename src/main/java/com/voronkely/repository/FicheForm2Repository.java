package com.voronkely.repository;

import com.voronkely.entity.FicheForm2;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FicheForm2Repository extends JpaRepository<FicheForm2, Long> {
    Optional<FicheForm2> findFirstByIdMembreOrderByIdDesc(Long idMembre);
    List<FicheForm2> findByIdMembreOrderByIdAsc(Long idMembre);
}
