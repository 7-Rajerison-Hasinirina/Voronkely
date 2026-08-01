package com.voronkely.service;

import com.voronkely.entity.FicheTechnique;
import com.voronkely.repository.FicheTechniqueRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheTechniqueService {

    private final FicheTechniqueRepository repository;

    public FicheTechniqueService(FicheTechniqueRepository repository) {
        this.repository = repository;
    }

    public List<FicheTechnique> findAll() {
        return repository.findAll();
    }

    public FicheTechnique save(FicheTechnique fiche) {
        return repository.save(fiche);
    }

    public Optional<FicheTechnique> findById(Long id) {
        return repository.findById(id);
    }

}
