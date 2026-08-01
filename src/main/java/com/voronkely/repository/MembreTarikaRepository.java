package com.voronkely.repository;

import com.voronkely.entity.MembreTarika;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MembreTarikaRepository extends JpaRepository<MembreTarika, Long> {


    List<MembreTarika> findByTarikaId(Long idTarika);


}