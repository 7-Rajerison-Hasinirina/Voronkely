package com.voronkely.service;

import com.voronkely.entity.Agenda;
import com.voronkely.repository.AgendaRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class AgendaService {

    private final AgendaRepository repository;

    public AgendaService(AgendaRepository repository) {
        this.repository = repository;
    }

    public List<Agenda> findAllByDateDesc() {
        return repository.findAllByOrderByDateUtilisationDesc();
    }

    public List<Agenda> findByDateRange(LocalDate start, LocalDate end) {
        return repository.findByDateUtilisationBetweenOrderByDateUtilisationDesc(start, end);
    }

    public Optional<Agenda> findById(Long id) {
        return repository.findById(id);
    }

    public Agenda save(Agenda agenda) {
        return repository.save(agenda);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}
