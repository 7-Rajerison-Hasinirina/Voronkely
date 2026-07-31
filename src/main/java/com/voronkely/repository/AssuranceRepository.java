package com.voronkely.repository;

import com.voronkely.entity.Assurance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.voronkely.dto.HistoriqueAssuranceDto;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;


@Repository
public interface AssuranceRepository extends JpaRepository<Assurance, Long> {


    List<Assurance> findAllByOrderByDateDesc();


    List<Assurance> findByMembreIdOrderByDateDesc(Long membreId);


    List<Assurance> findByDateBetweenOrderByDateDesc(
            LocalDate dateMin,
            LocalDate dateMax
    );


    // @Query("""
    // SELECT new com.voronkely.dto.HistoriqueAssuranceDto(

    // t.id,
    // t.libelle,
    // COALESCE(SUM(a.montant),0)

    // )

    // FROM Assurance a

    // JOIN a.typeAssurance t

    // WHERE

    // (:dateMin IS NULL OR a.date>=:dateMin)

    // AND

    // (:dateMax IS NULL OR a.date<=:dateMax)

    // GROUP BY
    // t.id,
    // t.libelle

    // ORDER BY
    // t.libelle
    // """)
    // List<HistoriqueAssuranceDto> historique(

    //         @Param("dateMin") LocalDate dateMin,

    //         @Param("dateMax") LocalDate dateMax

    // );



@Query("""
SELECT new com.voronkely.dto.HistoriqueAssuranceDto(

t.id,
t.libelle,
SUM(a.montant)

)

FROM Assurance a

JOIN a.typeAssurance t

GROUP BY
t.id,
t.libelle

ORDER BY
t.libelle
""")
List<HistoriqueAssuranceDto> historique();



@Query("""
SELECT new com.voronkely.dto.HistoriqueAssuranceDto(

    t.id,
    t.libelle,
    COALESCE(SUM(a.montant),0)

)

FROM Assurance a

JOIN a.typeAssurance t
JOIN a.membre m

WHERE

(:reference IS NULL
OR :reference = ''
OR LOWER(m.reference) LIKE LOWER(CONCAT('%', :reference, '%')))

AND

(:dateMin IS NULL
OR a.date >= :dateMin)

AND

(:dateMax IS NULL
OR a.date <= :dateMax)

GROUP BY
t.id,
t.libelle

ORDER BY
t.libelle
""")
List<HistoriqueAssuranceDto> historique(

        @Param("reference") String reference,

        @Param("dateMin") LocalDate dateMin,

        @Param("dateMax") LocalDate dateMax

);


}