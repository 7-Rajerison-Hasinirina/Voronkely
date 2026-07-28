package com.voronkely.repository;

import com.voronkely.entity.FicheForm6;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FicheForm6Repository extends JpaRepository<FicheForm6, Long> {
    Optional<FicheForm6> findFirstByIdMembreOrderByIdDesc(Long idMembre);
    List<FicheForm6> findByIdMembreOrderByIdAsc(Long idMembre);
}
