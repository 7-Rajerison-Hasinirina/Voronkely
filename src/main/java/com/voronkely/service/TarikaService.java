package com.voronkely.service;

import com.voronkely.entity.Tarika;
import com.voronkely.repository.TarikaRepository;
import com.voronkely.service.MembreTarikaService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TarikaService {

    private final TarikaRepository tarikaRepository;
    private final MembreTarikaService membreTarikaService;

    public TarikaService(TarikaRepository tarikaRepository, MembreTarikaService membreTarikaService) {
        this.tarikaRepository = tarikaRepository;
        this.membreTarikaService = membreTarikaService;
    }

    public List<Tarika> findAll() {
        return tarikaRepository.findAllByOrderByNomAsc();
    }

    public Optional<Tarika> findById(Long id) {
        return tarikaRepository.findById(id);
    }

    public Tarika save(Tarika tarika) {
        return tarikaRepository.save(tarika);
    }

    public void delete(Long id) {
        membreTarikaService.deleteByTarika(id);
        tarikaRepository.deleteById(id);
    }

}