package com.voronkely.repository;

import com.voronkely.entity.CampInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CampInfoRepository extends JpaRepository<CampInfo, Long> {
    Optional<CampInfo> findByCampId(Long campId);
}
