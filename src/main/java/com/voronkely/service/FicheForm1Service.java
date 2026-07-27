package com.voronkely.service;

import com.voronkely.entity.FicheForm1;
import com.voronkely.repository.FicheForm1Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FicheForm1Service {

    private final FicheForm1Repository repository;

    public FicheForm1Service(FicheForm1Repository repository) {
        this.repository = repository;
    }

    public List<FicheForm1> findAll() {
        return repository.findAll();
    }

    public Optional<FicheForm1> findById(Long id) {
        return repository.findById(id);
    }

    public FicheForm1 save(FicheForm1 f) {
        return repository.save(f);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
