package com.voronkely.service;

import com.voronkely.entity.NumeroTrimestre;
import com.voronkely.repository.NumeroTrimestreRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NumeroTrimestreService {

    private final NumeroTrimestreRepository repository;

    public NumeroTrimestreService(NumeroTrimestreRepository repository) {
        this.repository = repository;
    }

    public List<NumeroTrimestre> findAll() {
        return repository.findAll();
    }

    public java.util.Optional<NumeroTrimestre> findById(Long id) {
        return repository.findById(id);
    }

}
