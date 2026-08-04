package com.voronkely.service;

import com.voronkely.entity.MembreGrade;
import com.voronkely.repository.MembreGradeRepository;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class MembreGradeServiceTest {

    @Test
    void shouldFindGradesByMemberIdAndSaveNewAssignment() {
        MembreGradeRepository repository = mock(MembreGradeRepository.class);
        MembreGradeService service = new MembreGradeService(repository);
        MembreGrade assignment = new MembreGrade();

        when(repository.findByMembreIdOrderByDateDesc(7L)).thenReturn(List.of(assignment));
        when(repository.save(assignment)).thenReturn(assignment);

        List<MembreGrade> result = service.findByMembreId(7L);
        MembreGrade saved = service.save(assignment);

        assertThat(result).containsExactly(assignment);
        assertThat(saved).isSameAs(assignment);
        verify(repository).findByMembreIdOrderByDateDesc(7L);
        verify(repository).save(assignment);
    }
}
