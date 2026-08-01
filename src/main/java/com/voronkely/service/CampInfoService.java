package com.voronkely.service;

import com.voronkely.entity.CampInfo;
import com.voronkely.repository.CampInfoRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CampInfoService {

    private final CampInfoRepository repository;

    public CampInfoService(CampInfoRepository repository) {
        this.repository = repository;
    }

    public CampInfo save(CampInfo campInfo) {
        return repository.save(campInfo);
    }

    public Optional<CampInfo> findById(Long id) {
        return repository.findById(id);
    }

    public Optional<CampInfo> findByCampId(Long campId) {
        return repository.findByCampId(campId);
    }
}
