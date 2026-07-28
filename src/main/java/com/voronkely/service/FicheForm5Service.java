package com.voronkely.service;

import com.voronkely.entity.FicheForm5;
import com.voronkely.repository.FicheForm5Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheForm5Service {

    private final FicheForm5Repository repository;

    public FicheForm5Service(FicheForm5Repository repository) {
        this.repository = repository;
    }

    public List<FicheForm5> findAll() {
        return repository.findAll();
    }

    public Optional<FicheForm5> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<FicheForm5> findByIdMembre(Long idMembre) {
        return repository.findFirstByIdMembreOrderByIdDesc(idMembre);
    }

    public List<FicheForm5> findAllByIdMembre(Long idMembre) {
        return repository.findByIdMembreOrderByIdAsc(idMembre);
    }

    public FicheForm5 save(FicheForm5 f) {
        return repository.save(f);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
