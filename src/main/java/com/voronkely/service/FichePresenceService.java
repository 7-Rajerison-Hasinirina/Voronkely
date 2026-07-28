package com.voronkely.service;

import com.voronkely.entity.FichePresence;
import com.voronkely.repository.FichePresenceRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class FichePresenceService {
    private final FichePresenceRepository repository;
    public FichePresenceService(FichePresenceRepository repository) {
        this.repository = repository;
    }


    public List<FichePresence> findAll() {
        return repository.findAll();
    }


    public Optional<FichePresence> findById(Long id) {
        return repository.findById(id);
    }


    public List<FichePresence> findByDate(LocalDate date) {
        return repository.findByDatePresence(date);
    }


    public List<FichePresence> findByMembre(Long idMembre) {
        return repository.findByIdMembre(idMembre);
    }


    public FichePresence save(FichePresence fichePresence) {
        return repository.save(fichePresence);
    }


    public void delete(Long id) {
        repository.deleteById(id);
    }


    public FichePresence findByMembreAndDate(Long idMembre, LocalDate date) {
        return repository.findByIdMembreAndDatePresence(idMembre, date);
    }

}