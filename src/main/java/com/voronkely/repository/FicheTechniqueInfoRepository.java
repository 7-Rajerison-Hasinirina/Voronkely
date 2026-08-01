package com.voronkely.repository;

import com.voronkely.entity.FicheTechniqueInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface FicheTechniqueInfoRepository extends JpaRepository<FicheTechniqueInfo, Long> {

    Optional<FicheTechniqueInfo> findByFicheTechniqueId(Long ficheTechniqueId);

}
