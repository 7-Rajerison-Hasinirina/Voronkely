package com.voronkely.service;

import com.voronkely.entity.FicheForm2;
import com.voronkely.repository.FicheForm2Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheForm2Service {

    private final FicheForm2Repository repository;

    public FicheForm2Service(FicheForm2Repository repository) {
        this.repository = repository;
    }

    public List<FicheForm2> findAll() {
        return repository.findAll();
    }

    public Optional<FicheForm2> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<FicheForm2> findByIdMembre(Long idMembre) {
        return repository.findFirstByIdMembreOrderByIdDesc(idMembre);
    }

    public List<FicheForm2> findAllByIdMembre(Long idMembre) {
        return repository.findByIdMembreOrderByIdAsc(idMembre);
    }

    public FicheForm2 save(FicheForm2 f) {
        return repository.save(f);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
