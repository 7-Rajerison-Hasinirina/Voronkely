package com.voronkely.repository;

import com.voronkely.entity.Adidy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AdidyRepository extends JpaRepository<Adidy, Long> {


    List<Adidy> findAllByOrderByDateAjoutDesc();



    List<Adidy> findByMontantRestantGreaterThanOrderByDateAjoutDesc(
            Double montant
    );



    List<Adidy> findByMembreIdOrderByDateAjoutDesc(
            Long idMembre
    );



    @Query("""
            SELECT COALESCE(SUM(a.montantRestant),0)
            FROM Adidy a
            """)
    Double montantGlobalRestant();


}