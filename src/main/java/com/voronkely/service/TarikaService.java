package com.voronkely.service;

import com.voronkely.entity.Tarika;
import com.voronkely.repository.TarikaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TarikaService {

    private final TarikaRepository tarikaRepository;

    public TarikaService(TarikaRepository tarikaRepository) {
        this.tarikaRepository = tarikaRepository;
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
        tarikaRepository.deleteById(id);
    }


}