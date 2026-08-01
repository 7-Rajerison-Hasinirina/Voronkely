package com.voronkely.repository;

import com.voronkely.entity.RoleTarika;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleTarikaRepository extends JpaRepository<RoleTarika, Long> {

    List<RoleTarika> findAllByOrderByRoleAsc();

}