package com.voronkely.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "fiche_form2")
public class FicheForm2 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_membre")
    private Long idMembre;

    @Column(name = "aretina_mpahazo")
    private String aretinaMpahazo;

    @Column(name = "fanafody_fampiasa")
    private String fanafodyFampiasa;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdMembre() {
        return idMembre;
    }

    public void setIdMembre(Long idMembre) {
        this.idMembre = idMembre;
    }

    public String getAretinaMpahazo() {
        return aretinaMpahazo;
    }

    public void setAretinaMpahazo(String aretinaMpahazo) {
        this.aretinaMpahazo = aretinaMpahazo;
    }

    public String getFanafodyFampiasa() {
        return fanafodyFampiasa;
    }

    public void setFanafodyFampiasa(String fanafodyFampiasa) {
        this.fanafodyFampiasa = fanafodyFampiasa;
    }
}
