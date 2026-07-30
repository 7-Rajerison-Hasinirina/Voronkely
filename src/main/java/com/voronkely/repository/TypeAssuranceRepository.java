package com.voronkely.repository;

import com.voronkely.entity.TypeAssurance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface TypeAssuranceRepository extends JpaRepository<TypeAssurance, Long> {


    List<TypeAssurance> findAllByOrderByLibelleAsc();


}