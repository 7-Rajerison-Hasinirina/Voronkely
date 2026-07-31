package com.voronkely.repository;

import com.voronkely.entity.MouvementAdidy;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MouvementAdidyRepository extends JpaRepository<MouvementAdidy, Long> {


    List<MouvementAdidy> findByAdidyIdOrderByDateMouvementDesc(Long idAdidy);


}