package com.voronkely.service;

import com.voronkely.entity.FicheForm3;
import com.voronkely.repository.FicheForm3Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheForm3Service {

    private final FicheForm3Repository repository;

    public FicheForm3Service(FicheForm3Repository repository) {
        this.repository = repository;
    }

    public List<FicheForm3> findAll() {
        return repository.findAll();
    }

    public Optional<FicheForm3> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<FicheForm3> findByIdMembre(Long idMembre) {
        return repository.findFirstByIdMembreOrderByIdDesc(idMembre);
    }

    public List<FicheForm3> findAllByIdMembre(Long idMembre) {
        return repository.findByIdMembreOrderByIdAsc(idMembre);
    }

    public FicheForm3 save(FicheForm3 f) {
        return repository.save(f);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
