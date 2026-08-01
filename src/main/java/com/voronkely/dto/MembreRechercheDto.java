package com.voronkely.dto;


public class MembreRechercheDto {


    private Long id;

    private String reference;

    private String nomPrenom;

    private String image;



    public MembreRechercheDto() {

    }



    public MembreRechercheDto(
            Long id,
            String reference,
            String nomPrenom,
            String image
    ) {

        this.id = id;
        this.reference = reference;
        this.nomPrenom = nomPrenom;
        this.image = image;

    }



    public Long getId() {
        return id;
    }



    public void setId(Long id) {
        this.id = id;
    }



    public String getReference() {
        return reference;
    }



    public void setReference(String reference) {
        this.reference = reference;
    }



    public String getNomPrenom() {
        return nomPrenom;
    }



    public void setNomPrenom(String nomPrenom) {
        this.nomPrenom = nomPrenom;
    }



    public String getImage() {
        return image;
    }



    public void setImage(String image) {
        this.image = image;
    }

}