package com.voronkely.dto;

public class MembreRechercheDto {

    private Long id;
    private String reference;
    private String nomPrenom;
    private String image;

    public MembreRechercheDto(Long id,
                              String reference,
                              String nomPrenom,
                              String image) {
        this.id = id;
        this.reference = reference;
        this.nomPrenom = nomPrenom;
        this.image = image;
    }

    public Long getId() {
        return id;
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
}