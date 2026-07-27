package com.voronkely.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "fiche_form3")
public class FicheForm3 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_membre")
    private Long idMembre;

    @Column(name = "toetra_mahafinaritra")
    private String toetraMahafinaritra;

    @Column(name = "toetra_manahirana")
    private String toetraManahirana;

    @Column(name = "zavatra_tiana")
    private String zavatraTiana;

    @Column(name = "zavatra_tsy_tiana")
    private String zavatraTsyTiana;

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

    public String getToetraMahafinaritra() {
        return toetraMahafinaritra;
    }

    public void setToetraMahafinaritra(String toetraMahafinaritra) {
        this.toetraMahafinaritra = toetraMahafinaritra;
    }

    public String getToetraManahirana() {
        return toetraManahirana;
    }

    public void setToetraManahirana(String toetraManahirana) {
        this.toetraManahirana = toetraManahirana;
    }

    public String getZavatraTiana() {
        return zavatraTiana;
    }

    public void setZavatraTiana(String zavatraTiana) {
        this.zavatraTiana = zavatraTiana;
    }

    public String getZavatraTsyTiana() {
        return zavatraTsyTiana;
    }

    public void setZavatraTsyTiana(String zavatraTsyTiana) {
        this.zavatraTsyTiana = zavatraTsyTiana;
    }
}
