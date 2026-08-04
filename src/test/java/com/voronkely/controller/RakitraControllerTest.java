package com.voronkely.controller;

import com.voronkely.entity.Rakitra;
import com.voronkely.service.RakitraService;
import org.junit.jupiter.api.Test;
import org.springframework.ui.ExtendedModelMap;

import java.time.LocalDate;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class RakitraControllerTest {

    @Test
    void pageRakitra_shouldFilterByDateAndExposeAttributes() {
        RakitraService rakitraService = mock(RakitraService.class);
        RakitraController controller = new RakitraController(rakitraService);
        ExtendedModelMap model = new ExtendedModelMap();

        LocalDate dateMin = LocalDate.of(2024, 1, 1);
        LocalDate dateMax = LocalDate.of(2024, 1, 31);
        List<Rakitra> expected = List.of(new Rakitra());

        when(rakitraService.findByDateRange(dateMin, dateMax)).thenReturn(expected);
        when(rakitraService.montantGlobalRestant()).thenReturn(42.0);

        String view = controller.pageRakitra(dateMin, dateMax, model);

        assertThat(view).isEqualTo("rakitra/page-rakitra");
        assertThat(model.getAttribute("rakitras")).isEqualTo(expected);
        assertThat(model.getAttribute("montantGlobal")).isEqualTo(42.0);
        assertThat(model.getAttribute("dateMin")).isEqualTo(dateMin);
        assertThat(model.getAttribute("dateMax")).isEqualTo(dateMax);
        verify(rakitraService).findByDateRange(dateMin, dateMax);
    }
}
