package com.voronkely.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDate;

@Entity
@Table(name = "fiche_form6")
public class FicheForm6 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_membre")
    private Long idMembre;

    @Column(name = "daty")
    private LocalDate daty;

    @Column(name = "votoatin_draharaha")
    private String votoatinDraharaha;

    @Column(name = "fanamarihana")
    private String fanamarihana;

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

    public LocalDate getDaty() {
        return daty;
    }

    public void setDaty(LocalDate daty) {
        this.daty = daty;
    }

    public String getVotoatinDraharaha() {
        return votoatinDraharaha;
    }

    public void setVotoatinDraharaha(String votoatinDraharaha) {
        this.votoatinDraharaha = votoatinDraharaha;
    }

    public String getFanamarihana() {
        return fanamarihana;
    }

    public void setFanamarihana(String fanamarihana) {
        this.fanamarihana = fanamarihana;
    }
}
