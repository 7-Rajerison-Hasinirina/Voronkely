package com.voronkely.service;


import com.voronkely.dto.HistoriqueVisiteDto;
import com.voronkely.entity.VisiteParent;
import com.voronkely.repository.VisiteParentRepository;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;


@Service
public class VisiteParentService {


    private final VisiteParentRepository repository;


    public VisiteParentService(
            VisiteParentRepository repository
    ){

        this.repository=repository;

    }



    public List<VisiteParent> findEnAttente(){

        return repository
                .findByStatutOrderByDateVisiteAsc(
                        "En attente"
                );

    }


    public VisiteParent save(
            VisiteParent visite
    ){

        return repository.save(visite);

    }


    public void terminer(Long id) {

        repository.findById(id)
                .ifPresent(visite -> {

                    visite.setStatut("Termine");

                    repository.save(visite);

                });

    }




    public List<HistoriqueVisiteDto> historique(

            String reference,

            LocalDate dateMin,

            LocalDate dateMax){

        return repository.historique(
                reference,
                dateMin,
                dateMax);

    }
}