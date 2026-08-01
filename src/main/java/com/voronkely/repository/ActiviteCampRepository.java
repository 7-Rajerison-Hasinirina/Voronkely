package com.voronkely.repository;

import com.voronkely.entity.ActiviteCamp;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActiviteCampRepository extends JpaRepository<ActiviteCamp, Long> {
    List<ActiviteCamp> findByCampId(Long campId);

    List<ActiviteCamp> findByCampIdAndTypeMouvement(Long campId, String typeMouvement);
}
