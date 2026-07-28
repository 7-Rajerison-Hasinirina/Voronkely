package com.voronkely.repository;

import com.voronkely.entity.FichePresence;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface FichePresenceRepository extends JpaRepository<FichePresence, Long> {
    List<FichePresence> findByDatePresence(LocalDate datePresence);
    List<FichePresence> findByIdMembre(Long idMembre);
    FichePresence findByIdMembreAndDatePresence(Long idMembre, LocalDate datePresence);

}