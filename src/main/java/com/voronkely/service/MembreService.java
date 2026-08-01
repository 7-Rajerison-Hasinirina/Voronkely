package com.voronkely.service;

import com.voronkely.dto.MembreRechercheDto;
import com.voronkely.entity.FicheForm1;
import com.voronkely.entity.Membre;
import com.voronkely.repository.FicheForm1Repository;
import com.voronkely.repository.MembreRepository;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class MembreService {


    private final MembreRepository membreRepository;

    private final FicheForm1Repository ficheForm1Repository;



    public MembreService(
            MembreRepository membreRepository,
            FicheForm1Repository ficheForm1Repository
    ){

        this.membreRepository = membreRepository;
        this.ficheForm1Repository = ficheForm1Repository;

    }






    public List<Membre> findAll(){

        return membreRepository.findAll();

    }






    public Optional<Membre> findById(Long id){

        return membreRepository.findById(id);

    }






    public Membre save(Membre membre){

        return membreRepository.save(membre);

    }






    public void deleteById(Long id){

        membreRepository.deleteById(id);

    }






    public List<MembreRechercheDto> rechercheVisite(String mot){

        return membreRepository.rechercheVisite(mot);

    }







    public Optional<MembreRechercheDto> rechercheReference(String reference){

        return membreRepository.rechercheReference(reference);

    }








    public Optional<Membre> findByReference(String reference){

        return membreRepository.findByReference(reference);

    }








    public MembreRechercheDto rechercheReferenceAvecImage(
            String reference
    ){



        Optional<Membre> membre =
                membreRepository.findByReference(reference);



        if(membre.isEmpty()){

            return null;

        }



        Membre m =
                membre.get();




        MembreRechercheDto dto =
                new MembreRechercheDto();




        dto.setId(
                m.getId()
        );



        dto.setNomPrenom(
                m.getNomPrenom()
        );



        dto.setReference(
                m.getReference()
        );




        String image =
                "profile-female.png";




        Optional<FicheForm1> fiche =
                ficheForm1Repository
                .findFirstByIdMembreOrderByIdDesc(
                        m.getId()
                );



        if(fiche.isPresent()
                && fiche.get().getImage()!=null
                && !fiche.get().getImage().isEmpty()){


            image =
                    fiche.get().getImage();

        }




        dto.setImage(
                image
        );



        return dto;

    }


}