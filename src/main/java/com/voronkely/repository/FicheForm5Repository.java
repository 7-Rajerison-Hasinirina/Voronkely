package com.voronkely.repository;

import com.voronkely.entity.FicheForm5;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FicheForm5Repository extends JpaRepository<FicheForm5, Long> {
    Optional<FicheForm5> findFirstByIdMembreOrderByIdDesc(Long idMembre);
    List<FicheForm5> findByIdMembreOrderByIdAsc(Long idMembre);
}
