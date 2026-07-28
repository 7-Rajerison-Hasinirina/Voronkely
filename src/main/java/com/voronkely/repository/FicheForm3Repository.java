package com.voronkely.repository;

import com.voronkely.entity.FicheForm3;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FicheForm3Repository extends JpaRepository<FicheForm3, Long> {
    Optional<FicheForm3> findFirstByIdMembreOrderByIdDesc(Long idMembre);
    List<FicheForm3> findByIdMembreOrderByIdAsc(Long idMembre);
}
