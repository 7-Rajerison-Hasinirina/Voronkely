package com.voronkely.service;


import com.voronkely.entity.MouvementRakitra;
import com.voronkely.repository.MouvementRakitraRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MouvementRakitraService {


    private final MouvementRakitraRepository repository;


    public MouvementRakitraService(
            MouvementRakitraRepository repository
    ){
        this.repository = repository;
    }



    public List<MouvementRakitra> findByRakitra(Long id){

        return repository.findByRakitraId(id);

    }



    public MouvementRakitra save(MouvementRakitra mouvement){

        return repository.save(mouvement);

    }



    public Double totalDeduit(Long id){

        return repository.totalDeduit(id);

    }

}