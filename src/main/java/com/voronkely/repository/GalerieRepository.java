package com.voronkely.repository;

import com.voronkely.entity.Galerie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GalerieRepository extends JpaRepository<Galerie, Long> {

    List<Galerie> findAllByOrderByDateDesc();
}
