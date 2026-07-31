package com.voronkely.repository;

import com.voronkely.entity.TypeAdidy;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TypeAdidyRepository extends JpaRepository<TypeAdidy, Long> {

    List<TypeAdidy> findAllByOrderByLibelleAsc();

    Optional<TypeAdidy> findByLibelle(String libelle);

}