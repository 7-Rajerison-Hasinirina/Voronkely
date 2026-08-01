package com.voronkely.service;

import com.voronkely.entity.ActiviteCamp;
import com.voronkely.repository.ActiviteCampRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ActiviteCampService {

    private final ActiviteCampRepository repository;

    public ActiviteCampService(ActiviteCampRepository repository) {
        this.repository = repository;
    }

    public List<ActiviteCamp> findByCampId(Long campId) {
        return repository.findByCampId(campId);
    }

    public List<ActiviteCamp> findByCampIdAndTypeMouvement(Long campId, String typeMouvement) {
        return repository.findByCampIdAndTypeMouvement(campId, typeMouvement);
    }

    public Optional<ActiviteCamp> findById(Long id) {
        return repository.findById(id);
    }

    public ActiviteCamp save(ActiviteCamp activiteCamp) {
        return repository.save(activiteCamp);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
