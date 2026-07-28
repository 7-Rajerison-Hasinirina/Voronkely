package com.voronkely.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDate;

@Entity
@Table(name = "fiche_form5")
public class FicheForm5 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_membre")
    private Long idMembre;

    @Column(name = "anarana")
    private String anarana;

    @Column(name = "daty_nanomezana")
    private LocalDate datyNanomezana;

    @Column(name = "talenta_nomena")
    private String talentaNomena;

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

    public String getAnarana() {
        return anarana;
    }

    public void setAnarana(String anarana) {
        this.anarana = anarana;
    }

    public LocalDate getDatyNanomezana() {
        return datyNanomezana;
    }

    public void setDatyNanomezana(LocalDate datyNanomezana) {
        this.datyNanomezana = datyNanomezana;
    }

    public String getTalentaNomena() {
        return talentaNomena;
    }

    public void setTalentaNomena(String talentaNomena) {
        this.talentaNomena = talentaNomena;
    }
}
