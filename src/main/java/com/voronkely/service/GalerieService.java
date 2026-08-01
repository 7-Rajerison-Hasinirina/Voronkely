package com.voronkely.service;

import com.voronkely.entity.Galerie;
import com.voronkely.repository.GalerieRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GalerieService {

    private final GalerieRepository galerieRepository;

    public GalerieService(GalerieRepository galerieRepository) {
        this.galerieRepository = galerieRepository;
    }

    public List<Galerie> getAllGaleries() {
        return galerieRepository.findAllByOrderByDateDesc();
    }

    public Optional<Galerie> getGalerieById(Long id) {
        return galerieRepository.findById(id);
    }

    public Galerie saveGalerie(Galerie galerie) {
        return galerieRepository.save(galerie);
    }

    public void deleteGalerie(Long id) {
        galerieRepository.deleteById(id);
    }
}
