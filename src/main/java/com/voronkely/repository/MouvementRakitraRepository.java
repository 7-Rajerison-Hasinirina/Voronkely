package com.voronkely.repository;


import com.voronkely.entity.MouvementRakitra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface MouvementRakitraRepository 
        extends JpaRepository<MouvementRakitra,Long> {


    List<MouvementRakitra> findByRakitraId(Long idRakitra);



    @Query("""
            SELECT COALESCE(SUM(m.montantADeduire),0)
            FROM MouvementRakitra m
            WHERE m.rakitra.id = :id
            """)
    Double totalDeduit(Long id);


}