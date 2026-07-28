package com.voronkely.repository;

import com.voronkely.entity.FicheForm1;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FicheForm1Repository extends JpaRepository<FicheForm1, Long> {
    Optional<FicheForm1> findFirstByIdMembreOrderByIdDesc(Long idMembre);
}
