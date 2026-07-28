package com.voronkely.service;

import com.voronkely.entity.FicheForm6;
import com.voronkely.repository.FicheForm6Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheForm6Service {

    private final FicheForm6Repository repository;

    public FicheForm6Service(FicheForm6Repository repository) {
        this.repository = repository;
    }

    public List<FicheForm6> findAll() {
        return repository.findAll();
    }

    public Optional<FicheForm6> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<FicheForm6> findByIdMembre(Long idMembre) {
        return repository.findFirstByIdMembreOrderByIdDesc(idMembre);
    }

    public List<FicheForm6> findAllByIdMembre(Long idMembre) {
        return repository.findByIdMembreOrderByIdAsc(idMembre);
    }

    public FicheForm6 save(FicheForm6 f) {
        return repository.save(f);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
