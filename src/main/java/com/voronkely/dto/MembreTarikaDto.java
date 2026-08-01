package com.voronkely.dto;

public class MembreTarikaDto {

    private Long membreTarikaId;
    private Long membreId;
    private String reference;
    private String nomPrenom;
    private String image;
    private String role;
    private Long tarikaId;
    private String tarikaNom;

    public MembreTarikaDto(
            Long membreTarikaId,
            Long membreId,
            String reference,
            String nomPrenom,
            String image,
            String role,
            Long tarikaId,
            String tarikaNom) {
        this.membreTarikaId = membreTarikaId;
        this.membreId = membreId;
        this.reference = reference;
        this.nomPrenom = nomPrenom;
        this.image = image;
        this.role = role;
        this.tarikaId = tarikaId;
        this.tarikaNom = tarikaNom;
    }

    public Long getMembreTarikaId() {
        return membreTarikaId;
    }

    public Long getMembreId() {
        return membreId;
    }

    public String getReference() {
        return reference;
    }

    public String getNomPrenom() {
        return nomPrenom;
    }

    public String getImage() {
        return image;
    }

    public String getRole() {
        return role;
    }

    public Long getTarikaId() {
        return tarikaId;
    }

    public String getTarikaNom() {
        return tarikaNom;
    }

}