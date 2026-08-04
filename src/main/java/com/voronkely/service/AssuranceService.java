package com.voronkely.service;

import com.voronkely.entity.Assurance;
import com.voronkely.repository.AssuranceRepository;

import org.springframework.stereotype.Service;
import java.time.LocalDate;
import com.voronkely.dto.HistoriqueAssuranceDto;
import com.voronkely.entity.Membre;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AssuranceService {

    private final AssuranceRepository assuranceRepository;

    public AssuranceService(
            AssuranceRepository assuranceRepository) {

        this.assuranceRepository = assuranceRepository;

    }

    // public List<HistoriqueAssuranceDto> historique(

    // LocalDate dateMin,

    // LocalDate dateMax){

    // // return assuranceRepository.historique(
    // // dateMin,
    // // dateMax);

    // return assuranceRepository.historique(
    // );

    // }

    public List<HistoriqueAssuranceDto> historique() {
        return assuranceRepository.historique();
    }

    public List<HistoriqueAssuranceDto> historique(

            String reference,

            LocalDate dateMin,

            LocalDate dateMax) {

        return assuranceRepository.historique(
                reference,
                dateMin,
                dateMax);

    }

    public List<Assurance> findAll() {

        List<Assurance> assurances = assuranceRepository.findAllByOrderByDateDesc();
        List<Assurance> result = new ArrayList<>();

        for (Assurance assurance : assurances) {
            try {
                if (assurance.getMembre() != null) {
                    result.add(assurance);
                }
            } catch (RuntimeException ex) {
                // Ignore the broken record so the page can still render.
            }
        }

        return result;

    }

    public Optional<Assurance> findById(Long id) {

        return assuranceRepository.findById(id);

    }

    public Assurance save(Assurance assurance) {

        return assuranceRepository.save(assurance);

    }

    public void deleteById(Long id) {

        assuranceRepository.deleteById(id);

    }

    public List<Assurance> findByMembre(Long membreId) {

        return assuranceRepository.findByMembreIdOrderByDateDesc(
                membreId);

    }

    public List<Assurance> findByDateBetween(
            LocalDate dateMin,
            LocalDate dateMax) {

        return assuranceRepository.findByDateBetweenOrderByDateDesc(
                dateMin,
                dateMax);

    }

}