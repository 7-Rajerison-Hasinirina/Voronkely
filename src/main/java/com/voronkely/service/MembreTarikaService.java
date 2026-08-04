package com.voronkely.service;

import com.voronkely.dto.MembreTarikaDto;
import com.voronkely.entity.FicheForm1;
import com.voronkely.entity.MembreTarika;
import com.voronkely.repository.MembreTarikaRepository;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class MembreTarikaService {

        private final MembreTarikaRepository repository;

        private final FicheForm1Service ficheForm1Service;

        public MembreTarikaService(
                        MembreTarikaRepository repository,
                        FicheForm1Service ficheForm1Service) {

                this.repository = repository;
                this.ficheForm1Service = ficheForm1Service;

        }

        public List<MembreTarika> findByTarika(
                        Long idTarika) {

                return repository.findByTarikaId(idTarika);

        }

        public List<MembreTarikaDto> findDtoByTarika(
                        Long idTarika) {

                return repository.findByTarikaId(idTarika)
                                .stream()
                                .map(mt -> {

                                        String image = "profile-female.png";

                                        Optional<FicheForm1> fiche = ficheForm1Service
                                                        .findByIdMembre(
                                                                        mt.getMembre().getId());

                                        if (fiche.isPresent()
                                                        && fiche.get().getImage() != null
                                                        && !fiche.get().getImage().isEmpty()) {

                                                image = fiche.get().getImage();

                                        }

                                        return new MembreTarikaDto(
                                                        mt.getId(),
                                                        mt.getMembre().getId(),
                                                        mt.getMembre().getReference(),
                                                        mt.getMembre().getNomPrenom(),
                                                        image,
                                                        mt.getRoleTarika().getRole(),
                                                        mt.getTarika() != null ? mt.getTarika().getId() : null,
                                                        mt.getTarika() != null ? mt.getTarika().getNom() : null);

                                })
                                .toList();

        }

        public MembreTarika save(
                        MembreTarika membreTarika) {

                return repository.save(membreTarika);

        }

        public List<MembreTarika> saveAll(
                        List<MembreTarika> membres) {

                return repository.saveAll(membres);

        }

        public java.util.Optional<MembreTarika> findById(Long id) {
                return repository.findById(id);
        }

        public void delete(
                        Long id) {

                repository.deleteById(id);

        }

        @Transactional
        public void deleteByTarika(
                        Long idTarika) {

                List<MembreTarika> associations = repository.findByTarikaId(idTarika);

                if (!associations.isEmpty()) {
                        repository.deleteAll(associations);
                }

        }

}