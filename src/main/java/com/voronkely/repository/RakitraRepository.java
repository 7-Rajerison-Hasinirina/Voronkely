package com.voronkely.repository;

import com.voronkely.entity.Rakitra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface RakitraRepository extends JpaRepository<Rakitra, Long> {
    List<Rakitra> findAllByOrderByDateAjoutDesc();

    List<Rakitra> findByDateAjoutGreaterThanEqualOrderByDateAjoutDesc(LocalDate dateMin);

    List<Rakitra> findByDateAjoutLessThanEqualOrderByDateAjoutDesc(LocalDate dateMax);

    List<Rakitra> findByDateAjoutBetweenOrderByDateAjoutDesc(LocalDate dateMin, LocalDate dateMax);

    List<Rakitra> findByMontantRestantGreaterThanOrderByDateAjoutDesc(Double montant);

    @Query("""
            SELECT COALESCE(SUM(r.montantRestant),0)
            FROM Rakitra r
            """)
    Double montantGlobalRestant();

}