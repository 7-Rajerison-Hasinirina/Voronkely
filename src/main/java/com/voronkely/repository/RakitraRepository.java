package com.voronkely.repository;

import com.voronkely.entity.Rakitra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RakitraRepository extends JpaRepository<Rakitra, Long> {
    List<Rakitra> findAllByOrderByDateAjoutDesc();


    List<Rakitra> findByMontantRestantGreaterThanOrderByDateAjoutDesc(Double montant);


    @Query("""
            SELECT COALESCE(SUM(r.montantRestant),0)
            FROM Rakitra r
            """)
    Double montantGlobalRestant();

}