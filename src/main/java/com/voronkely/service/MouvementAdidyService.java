package com.voronkely.service;

import com.voronkely.entity.MouvementAdidy;
import com.voronkely.repository.MouvementAdidyRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MouvementAdidyService {


    private final MouvementAdidyRepository mouvementAdidyRepository;



    public MouvementAdidyService(
            MouvementAdidyRepository mouvementAdidyRepository
    ) {

        this.mouvementAdidyRepository = mouvementAdidyRepository;

    }





    public List<MouvementAdidy> findAllByAdidy(Long idAdidy) {

        return mouvementAdidyRepository
                .findByAdidyIdOrderByDateMouvementDesc(idAdidy);

    }





    public Optional<MouvementAdidy> findById(Long id) {

        return mouvementAdidyRepository.findById(id);

    }





    public MouvementAdidy save(
            MouvementAdidy mouvementAdidy
    ) {

        return mouvementAdidyRepository.save(mouvementAdidy);

    }





    public void deleteById(Long id) {

        mouvementAdidyRepository.deleteById(id);

    }

}