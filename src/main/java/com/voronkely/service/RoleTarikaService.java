package com.voronkely.service;

import com.voronkely.entity.RoleTarika;
import com.voronkely.repository.RoleTarikaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoleTarikaService {

    private final RoleTarikaRepository roleTarikaRepository;

    public RoleTarikaService(RoleTarikaRepository roleTarikaRepository) {
        this.roleTarikaRepository = roleTarikaRepository;
    }

    public List<RoleTarika> findAll() {
        return roleTarikaRepository.findAllByOrderByRoleAsc();
    }

    public Optional<RoleTarika> findById(Long id) {
        return roleTarikaRepository.findById(id);
    }

    public RoleTarika save(RoleTarika roleTarika) {
        return roleTarikaRepository.save(roleTarika);
    }

    public void delete(Long id) {
        roleTarikaRepository.deleteById(id);
    }

}