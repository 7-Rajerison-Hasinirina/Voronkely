package com.voronkely.repository;

import com.voronkely.entity.Adidy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface AdidyRepository extends JpaRepository<Adidy, Long> {

        List<Adidy> findAllByOrderByDateAjoutDesc();

        List<Adidy> findByMontantRestantGreaterThanOrderByDateAjoutDesc(
                        Double montant);

        List<Adidy> findByMembreIdOrderByDateAjoutDesc(
                        Long idMembre);

        @Query("""
                        SELECT COALESCE(SUM(a.montantRestant),0)
                        FROM Adidy a
                        """)
        Double montantGlobalRestant();

        @Query("""
                        SELECT COALESCE(SUM(a.montant),0)
                        FROM Adidy a
                        """)
        Double montantGlobal();

        @Query("""
                        select a from Adidy a
                        where
                        (:dateMin is null or a.dateAjout >= :dateMin)
                        and
                        (:dateMax is null or a.dateAjout <= :dateMax)
                        and
                        (:reference is null or a.membre.reference like concat('%', :reference, '%'))
                        order by a.dateAjout desc
                        """)
        List<Adidy> rechercher(
                        @Param("dateMin") LocalDate dateMin,
                        @Param("dateMax") LocalDate dateMax,
                        @Param("reference") String reference);

}