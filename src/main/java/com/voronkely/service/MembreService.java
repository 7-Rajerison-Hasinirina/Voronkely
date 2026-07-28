package com.voronkely.service;

import com.voronkely.entity.Membre;
import com.voronkely.repository.MembreRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MembreService {

    private final MembreRepository membreRepository;

    public MembreService(MembreRepository membreRepository) {
        this.membreRepository = membreRepository;
    }

    public List<Membre> findAll() {
        return membreRepository.findAll();
    }

    public Optional<Membre> findById(Long id) {
        return membreRepository.findById(id);
    }

    public Membre save(Membre membre) {
        return membreRepository.save(membre);
    }

    public void deleteById(Long id) {
        membreRepository.deleteById(id);
    }
}
