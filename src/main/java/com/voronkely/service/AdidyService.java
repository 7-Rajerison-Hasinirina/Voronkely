package com.voronkely.service;

import com.voronkely.entity.Adidy;
import com.voronkely.repository.AdidyRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class AdidyService {

    private final AdidyRepository adidyRepository;

    public AdidyService(AdidyRepository adidyRepository) {

        this.adidyRepository = adidyRepository;

    }

    public List<Adidy> findAll() {

        List<Adidy> adidys = adidyRepository.findAllByOrderByDateAjoutDesc();
        List<Adidy> result = new java.util.ArrayList<>();

        for (Adidy adidy : adidys) {
            try {
                if (adidy.getMembre() != null && adidy.getTypeAdidy() != null) {
                    result.add(adidy);
                }
            } catch (RuntimeException ex) {
                // Ignore broken records so the dashboard still renders.
            }
        }

        return result;

    }

    public Optional<Adidy> findById(Long id) {

        return adidyRepository.findById(id);

    }

    public Adidy save(Adidy adidy) {

        return adidyRepository.save(adidy);

    }

    public void deleteById(Long id) {

        adidyRepository.deleteById(id);

    }

    public List<Adidy> findDisponible() {

        return adidyRepository
                .findByMontantRestantGreaterThanOrderByDateAjoutDesc(0.0);

    }

    public List<Adidy> findByMembre(Long idMembre) {

        return adidyRepository
                .findByMembreIdOrderByDateAjoutDesc(idMembre);

    }

    public double montantTotal() {
        Double total = adidyRepository.montantGlobal();
        return total != null ? total : 0.0;
    }

    public Double montantGlobalRestant() {

        return adidyRepository.montantGlobalRestant();

    }

    public List<Adidy> rechercher(
            LocalDate dateMin,
            LocalDate dateMax,
            String reference) {

        return adidyRepository.rechercher(
                dateMin,
                dateMax,
                reference);

    }

}