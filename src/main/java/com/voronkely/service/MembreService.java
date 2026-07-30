package com.voronkely.service;

import com.voronkely.dto.MembreRechercheDto;
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

    /**
     * Liste de tous les membres
     */
    public List<Membre> findAll() {
        return membreRepository.findAll();
    }

    /**
     * Recherche par identifiant
     */
    public Optional<Membre> findById(Long id) {
        return membreRepository.findById(id);
    }

    /**
     * Enregistrement d'un membre
     */
    public Membre save(Membre membre) {
        return membreRepository.save(membre);
    }

    /**
     * Suppression
     */
    public void deleteById(Long id) {
        membreRepository.deleteById(id);
    }

    /**
     * Recherche utilisée pour l'autocomplétion
     */
    public List<MembreRechercheDto> rechercheVisite(String mot) {
        return membreRepository.rechercheVisite(mot);
    }

    /**
     * Recherche d'un membre par référence
     */
    public Optional<MembreRechercheDto> rechercheReference(String reference) {
        return membreRepository.rechercheReference(reference);
    }

    /**
     * Recherche de l'entité Membre par référence
     * (peut encore servir ailleurs dans l'application)
     */
    public Optional<Membre> findByReference(String reference) {
        return membreRepository.findByReference(reference);
    }

}