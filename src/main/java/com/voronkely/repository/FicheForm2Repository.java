package com.voronkely.repository;

import com.voronkely.entity.FicheForm2;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FicheForm2Repository extends JpaRepository<FicheForm2, Long> {
}
