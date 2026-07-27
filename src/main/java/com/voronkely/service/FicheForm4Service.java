package com.voronkely.service;

import com.voronkely.entity.FicheForm4;
import com.voronkely.repository.FicheForm4Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheForm4Service {

    private final FicheForm4Repository repository;

    public FicheForm4Service(FicheForm4Repository repository) {
        this.repository = repository;
    }

    public List<FicheForm4> findAll() {
        return repository.findAll();
    }

    public Optional<FicheForm4> findById(Long id) {
        return repository.findById(id);
    }

    public FicheForm4 save(FicheForm4 f) {
        return repository.save(f);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
