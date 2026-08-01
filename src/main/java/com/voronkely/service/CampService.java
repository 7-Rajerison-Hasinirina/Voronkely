package com.voronkely.service;

import com.voronkely.entity.Camp;
import com.voronkely.repository.CampRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CampService {

    private final CampRepository repository;

    public CampService(CampRepository repository) {
        this.repository = repository;
    }

    public List<Camp> findAll() {
        return repository.findAll();
    }

    public Optional<Camp> findById(Long id) {
        return repository.findById(id);
    }

    public Camp save(Camp camp) {
        return repository.save(camp);
    }
}
