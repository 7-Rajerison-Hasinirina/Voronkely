package com.voronkely.service;

import com.voronkely.entity.ActiviteCamp;
import com.voronkely.entity.Camp;
import com.voronkely.entity.CampInfo;
import com.voronkely.repository.ActiviteCampRepository;
import com.voronkely.repository.CampInfoRepository;
import com.voronkely.repository.CampRepository;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class CampServiceTest {

    @Test
    void delete_shouldRemoveLinkedInfoAndActivitiesBeforeDeletingCamp() {
        CampRepository campRepository = mock(CampRepository.class);
        CampInfoRepository infoRepository = mock(CampInfoRepository.class);
        ActiviteCampRepository activiteRepository = mock(ActiviteCampRepository.class);
        CampService service = new CampService(campRepository, infoRepository, activiteRepository);

        CampInfo info = new CampInfo();
        ActiviteCamp activite = new ActiviteCamp();

        when(infoRepository.findByCampId(11L)).thenReturn(Optional.of(info));
        when(activiteRepository.findByCampId(11L)).thenReturn(List.of(activite));

        service.delete(11L);

        verify(infoRepository).findByCampId(11L);
        verify(infoRepository).delete(info);
        verify(activiteRepository).findByCampId(11L);
        verify(activiteRepository).delete(activite);
        verify(campRepository).deleteById(11L);
    }
}
