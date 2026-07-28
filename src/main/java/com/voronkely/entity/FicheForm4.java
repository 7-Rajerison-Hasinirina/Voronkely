package com.voronkely.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "fiche_form4")
public class FicheForm4 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_membre")
    private Long idMembre;

    @Column(name = "taona")
    private Integer taona;

    @Column(name = "sekoly")
    private String sekoly;

    @Column(name = "kilasy")
    private String kilasy;

    @Column(name = "taranja_manavanana")
    private String taranjaManavanana;

    @Column(name = "taranja_manahirana")
    private String taranjaManahirana;

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

    public Integer getTaona() {
        return taona;
    }

    public void setTaona(Integer taona) {
        this.taona = taona;
    }

    public String getSekoly() {
        return sekoly;
    }

    public void setSekoly(String sekoly) {
        this.sekoly = sekoly;
    }

    public String getKilasy() {
        return kilasy;
    }

    public void setKilasy(String kilasy) {
        this.kilasy = kilasy;
    }

    public String getTaranjaManavanana() {
        return taranjaManavanana;
    }

    public void setTaranjaManavanana(String taranjaManavanana) {
        this.taranjaManavanana = taranjaManavanana;
    }

    public String getTaranjaManahirana() {
        return taranjaManahirana;
    }

    public void setTaranjaManahirana(String taranjaManahirana) {
        this.taranjaManahirana = taranjaManahirana;
    }
}
