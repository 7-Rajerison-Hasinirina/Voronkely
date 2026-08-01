package com.voronkely.repository;

import com.voronkely.entity.ActiviteFicheTechnique;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActiviteFicheTechniqueRepository extends JpaRepository<ActiviteFicheTechnique, Long> {
    List<ActiviteFicheTechnique> findByFicheTechniqueId(Long ficheId);
}
