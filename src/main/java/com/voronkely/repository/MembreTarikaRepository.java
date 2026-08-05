package com.voronkely.repository;

import com.voronkely.entity.MembreTarika;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MembreTarikaRepository extends JpaRepository<MembreTarika, Long> {

    List<MembreTarika> findByTarikaId(Long idTarika);

    @Query("select mt from MembreTarika mt join mt.membre m where mt.tarika.id = :idTarika")
    List<MembreTarika> findByTarikaIdWithMembre(@Param("idTarika") Long idTarika);

    @Query("select mt from MembreTarika mt join fetch mt.membre join fetch mt.tarika where mt.membre.id = :idMembre")
    java.util.Optional<MembreTarika> findByMembreId(@Param("idMembre") Long idMembre);

    void deleteByTarikaId(Long idTarika);

}