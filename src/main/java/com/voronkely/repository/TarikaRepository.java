package com.voronkely.repository;

import com.voronkely.entity.Tarika;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TarikaRepository extends JpaRepository<Tarika, Long> {

    List<Tarika> findAllByOrderByNomAsc();

}