package com.voronkely.dto;

public class HistoriqueAssuranceDto {

    private Long idTypeAssurance;
    private String typeAssurance;
    private Double montant;

    public HistoriqueAssuranceDto(
            Long idTypeAssurance,
            String typeAssurance,
            Double montant) {

        this.idTypeAssurance = idTypeAssurance;
        this.typeAssurance = typeAssurance;
        this.montant = montant;
    }

    public Long getIdTypeAssurance() {
        return idTypeAssurance;
    }

    public String getTypeAssurance() {
        return typeAssurance;
    }

    public Double getMontant() {
        return montant;
    }
}