package com.voronkely.service;

import com.voronkely.entity.TypeAssurance;
import com.voronkely.repository.TypeAssuranceRepository;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class TypeAssuranceService {


    private final TypeAssuranceRepository typeAssuranceRepository;


    public TypeAssuranceService(
            TypeAssuranceRepository typeAssuranceRepository
    ){

        this.typeAssuranceRepository = typeAssuranceRepository;

    }





    public List<TypeAssurance> findAll(){

        return typeAssuranceRepository.findAllByOrderByLibelleAsc();

    }





    public Optional<TypeAssurance> findById(Long id){

        return typeAssuranceRepository.findById(id);

    }





    public TypeAssurance save(TypeAssurance typeAssurance){

        return typeAssuranceRepository.save(typeAssurance);

    }





    public void deleteById(Long id){

        typeAssuranceRepository.deleteById(id);

    }

}