package com.voronkely.service;

import com.voronkely.entity.ActiviteFicheTechnique;
import com.voronkely.entity.FicheTechnique;
import com.voronkely.entity.FicheTechniqueInfo;
import com.voronkely.repository.ActiviteFicheTechniqueRepository;
import com.voronkely.repository.FicheTechniqueInfoRepository;
import com.voronkely.repository.FicheTechniqueRepository;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class FicheTechniqueServiceTest {

    @Test
    void delete_shouldRemoveLinkedInfoAndActivitiesBeforeDeletingFiche() {
        FicheTechniqueRepository ficheRepository = mock(FicheTechniqueRepository.class);
        FicheTechniqueInfoRepository infoRepository = mock(FicheTechniqueInfoRepository.class);
        ActiviteFicheTechniqueRepository activiteRepository = mock(ActiviteFicheTechniqueRepository.class);
        FicheTechniqueService service = new FicheTechniqueService(ficheRepository, infoRepository, activiteRepository);

        FicheTechniqueInfo info = new FicheTechniqueInfo();
        ActiviteFicheTechnique activite = new ActiviteFicheTechnique();

        when(infoRepository.findByFicheTechniqueId(7L)).thenReturn(Optional.of(info));
        when(activiteRepository.findByFicheTechniqueId(7L)).thenReturn(List.of(activite));

        service.delete(7L);

        verify(infoRepository).findByFicheTechniqueId(7L);
        verify(infoRepository).delete(info);
        verify(activiteRepository).findByFicheTechniqueId(7L);
        verify(activiteRepository).delete(activite);
        verify(ficheRepository).deleteById(7L);
    }
}
