package com.voronkely.repository;

import com.voronkely.entity.FicheForm4;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FicheForm4Repository extends JpaRepository<FicheForm4, Long> {
    Optional<FicheForm4> findFirstByIdMembreOrderByIdDesc(Long idMembre);
    List<FicheForm4> findByIdMembreOrderByIdAsc(Long idMembre);
}
