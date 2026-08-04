package com.voronkely.service;

import com.voronkely.entity.Assurance;
import com.voronkely.entity.Membre;
import com.voronkely.repository.AssuranceRepository;
import jakarta.persistence.EntityNotFoundException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AssuranceServiceTest {

    @Mock
    private AssuranceRepository assuranceRepository;

    @InjectMocks
    private AssuranceService assuranceService;

    @Test
    void findAll_skipsAssurancesWithMissingMember() {
        Assurance valid = new Assurance();
        valid.setMembre(new Membre());

        Assurance invalid = mock(Assurance.class);
        when(invalid.getMembre())
                .thenThrow(new EntityNotFoundException("Missing member"));

        when(assuranceRepository.findAllByOrderByDateDesc())
                .thenReturn(List.of(invalid, valid));

        List<Assurance> result = assuranceService.findAll();

        assertThat(result).containsExactly(valid);
    }
}
