package com.voronkely.service;

import com.voronkely.entity.Camp;
import com.voronkely.repository.ActiviteCampRepository;
import com.voronkely.repository.CampInfoRepository;
import com.voronkely.repository.CampRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CampService {

    private final CampRepository repository;
    private final CampInfoRepository infoRepository;
    private final ActiviteCampRepository activiteRepository;

    public CampService(CampRepository repository, CampInfoRepository infoRepository,
            ActiviteCampRepository activiteRepository) {
        this.repository = repository;
        this.infoRepository = infoRepository;
        this.activiteRepository = activiteRepository;
    }

    public List<Camp> findAll() {
        return repository.findAll();
    }

    public Optional<Camp> findById(Long id) {
        return repository.findById(id);
    }

    public Camp save(Camp camp) {
        return repository.save(camp);
    }

    public void delete(Long id) {
        infoRepository.findByCampId(id).ifPresent(infoRepository::delete);
        activiteRepository.findByCampId(id).forEach(activiteRepository::delete);
        repository.deleteById(id);
    }
}
