package com.voronkely.repository;


import com.voronkely.dto.HistoriqueVisiteDto;
import com.voronkely.entity.VisiteParent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
import com.voronkely.*;


public interface VisiteParentRepository
        extends JpaRepository<VisiteParent,Long>{


    List<VisiteParent> findByStatutOrderByDateVisiteAsc(
            String statut
    );



    @Query("""
        SELECT new com.voronkely.dto.HistoriqueVisiteDto(

        v.id,

        m.id,

        m.reference,

        m.nomPrenom,

        v.dateVisite,

        v.statut

        )

        FROM VisiteParent v

        JOIN Membre m
        ON m.id=v.idMembre

        WHERE

        (:reference IS NULL
        OR :reference=''
        OR LOWER(m.reference)
        LIKE LOWER(CONCAT('%',:reference,'%')))

        AND

        (:dateMin IS NULL
        OR v.dateVisite>=:dateMin)

        AND

        (:dateMax IS NULL
        OR v.dateVisite<=:dateMax)

        ORDER BY v.dateVisite DESC
        """)
        List<HistoriqueVisiteDto> historique(

                @Param("reference") String reference,

                @Param("dateMin") LocalDate dateMin,

                @Param("dateMax") LocalDate dateMax

        );
}