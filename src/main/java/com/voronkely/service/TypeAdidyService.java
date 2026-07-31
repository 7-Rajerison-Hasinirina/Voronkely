package com.voronkely.service;

import com.voronkely.entity.TypeAdidy;
import com.voronkely.repository.TypeAdidyRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TypeAdidyService {

    private final TypeAdidyRepository typeAdidyRepository;


    public TypeAdidyService(TypeAdidyRepository typeAdidyRepository) {
        this.typeAdidyRepository = typeAdidyRepository;
    }


    public List<TypeAdidy> findAll() {

        return typeAdidyRepository.findAllByOrderByLibelleAsc();

    }


    public Optional<TypeAdidy> findById(Long id) {

        return typeAdidyRepository.findById(id);

    }


    public TypeAdidy save(TypeAdidy typeAdidy) {

        return typeAdidyRepository.save(typeAdidy);

    }


    public void deleteById(Long id) {

        typeAdidyRepository.deleteById(id);

    }


    public Optional<TypeAdidy> findByLibelle(String libelle) {

        return typeAdidyRepository.findByLibelle(libelle);

    }


    

}