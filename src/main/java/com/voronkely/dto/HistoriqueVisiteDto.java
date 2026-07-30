package com.voronkely.dto;

import java.time.LocalDate;

public class HistoriqueVisiteDto {

    private Long id;

    private Long idMembre;

    private String reference;

    private String nomPrenom;

    private LocalDate dateVisite;

    private String statut;

    public HistoriqueVisiteDto(
            Long id,
            Long idMembre,
            String reference,
            String nomPrenom,
            LocalDate dateVisite,
            String statut) {

        this.id = id;
        this.idMembre = idMembre;
        this.reference = reference;
        this.nomPrenom = nomPrenom;
        this.dateVisite = dateVisite;
        this.statut = statut;
    }

    public Long getId() {
        return id;
    }

    public Long getIdMembre() {
        return idMembre;
    }

    public String getReference() {
        return reference;
    }

    public String getNomPrenom() {
        return nomPrenom;
    }

    public LocalDate getDateVisite() {
        return dateVisite;
    }

    public String getStatut() {
        return statut;
    }

}