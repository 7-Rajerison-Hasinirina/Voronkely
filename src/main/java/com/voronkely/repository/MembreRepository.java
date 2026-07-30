package com.voronkely.repository;

import com.voronkely.dto.MembreRechercheDto;
import com.voronkely.entity.Membre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface MembreRepository extends JpaRepository<Membre, Long> {

    /**
     * Recherche utilisée pour l'autocomplétion
     */
    @Query("""
        SELECT new com.voronkely.dto.MembreRechercheDto(
            m.id,
            m.reference,
            m.nomPrenom,
            f.image
        )
        FROM Membre m
        LEFT JOIN FicheForm1 f
            ON f.idMembre = m.id
        WHERE LOWER(m.nomPrenom) LIKE LOWER(CONCAT('%', :mot, '%'))
           OR LOWER(m.reference) LIKE LOWER(CONCAT('%', :mot, '%'))
        ORDER BY m.nomPrenom
    """)
    List<MembreRechercheDto> rechercheVisite(
            @Param("mot") String mot
    );

    /**
     * Recherche d'une référence exacte
     * (utilisée par le formulaire de création de visite)
     */
    @Query("""
        SELECT new com.voronkely.dto.MembreRechercheDto(
            m.id,
            m.reference,
            m.nomPrenom,
            f.image
        )
        FROM Membre m
        LEFT JOIN FicheForm1 f
            ON f.idMembre = m.id
        WHERE m.reference = :reference
    """)
    Optional<MembreRechercheDto> rechercheReference(
            @Param("reference") String reference
    );

    /**
     * Retourne l'entité Membre
     * (conservée pour d'autres traitements éventuels)
     */
    Optional<Membre> findByReference(String reference);

}