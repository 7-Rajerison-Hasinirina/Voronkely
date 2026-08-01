package com.voronkely.dto;

public class MembreTarikaDto {

    private Long id;
    private String reference;
    private String nomPrenom;
    private String image;
    private String role;

    public MembreTarikaDto(
            Long id,
            String reference,
            String nomPrenom,
            String image,
            String role
    ){
        this.id = id;
        this.reference = reference;
        this.nomPrenom = nomPrenom;
        this.image = image;
        this.role = role;
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

    public String getRole() {
        return role;
    }
}