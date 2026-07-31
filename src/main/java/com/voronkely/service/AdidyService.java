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

        return adidyRepository.findAllByOrderByDateAjoutDesc();

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



    public Double montantGlobalRestant() {

        return adidyRepository.montantGlobalRestant();

    }


    public List<Adidy> rechercher(
        LocalDate dateMin,
        LocalDate dateMax,
        String reference
    ) {

        return adidyRepository.rechercher(
                dateMin,
                dateMax,
                reference
        );

    }

}