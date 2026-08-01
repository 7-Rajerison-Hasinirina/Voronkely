package com.voronkely.service;

import com.voronkely.entity.FicheTechniqueInfo;
import com.voronkely.repository.FicheTechniqueInfoRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class FicheTechniqueInfoService {

    private final FicheTechniqueInfoRepository repository;

    public FicheTechniqueInfoService(FicheTechniqueInfoRepository repository) {
        this.repository = repository;
    }

    public FicheTechniqueInfo save(FicheTechniqueInfo info) {
        return repository.save(info);
    }

    public Optional<FicheTechniqueInfo> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<FicheTechniqueInfo> findByFicheTechniqueId(Long ficheTechniqueId) {
        return repository.findByFicheTechniqueId(ficheTechniqueId);
    }

}
