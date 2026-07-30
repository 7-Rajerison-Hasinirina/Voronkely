package com.voronkely.service;

import com.voronkely.entity.Rakitra;
import com.voronkely.repository.RakitraRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RakitraService {

    private final RakitraRepository rakitraRepository;

    public RakitraService(RakitraRepository rakitraRepository) {
        this.rakitraRepository = rakitraRepository;
    }

    public List<Rakitra> findAll() {
        return rakitraRepository.findAllByOrderByDateAjoutDesc();
    }

    public Optional<Rakitra> findById(Long id) {
        return rakitraRepository.findById(id);
    }

    public Rakitra save(Rakitra rakitra) {
        return rakitraRepository.save(rakitra);
    }

    public void deleteById(Long id) {
        rakitraRepository.deleteById(id);
    }

    public List<Rakitra> findDisponible() {
        return rakitraRepository.findByMontantRestantGreaterThanOrderByDateAjoutDesc(0.0);
    }

    public Double montantGlobalRestant() {
        return rakitraRepository.montantGlobalRestant();
    }

}