package com.voronkely.repository;

import com.voronkely.entity.Assurance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

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


}