package com.voronkely.service;

import com.voronkely.entity.FicheTechnique;
import com.voronkely.repository.ActiviteFicheTechniqueRepository;
import com.voronkely.repository.FicheTechniqueInfoRepository;
import com.voronkely.repository.FicheTechniqueRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheTechniqueService {

    private final FicheTechniqueRepository repository;
    private final FicheTechniqueInfoRepository infoRepository;
    private final ActiviteFicheTechniqueRepository activiteRepository;

    public FicheTechniqueService(FicheTechniqueRepository repository,
            FicheTechniqueInfoRepository infoRepository,
            ActiviteFicheTechniqueRepository activiteRepository) {
        this.repository = repository;
        this.infoRepository = infoRepository;
        this.activiteRepository = activiteRepository;
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

    public void delete(Long id) {
        infoRepository.findByFicheTechniqueId(id).ifPresent(infoRepository::delete);
        activiteRepository.findByFicheTechniqueId(id).forEach(activiteRepository::delete);
        repository.deleteById(id);
    }

}
