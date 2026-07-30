package com.voronkely.entity;


import jakarta.persistence.*;
import java.time.LocalDate;


@Entity
@Table(name="visite_parent")
public class VisiteParent {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(name="id_membre")
    private Long idMembre;


    @Column(name="date_visite")
    private LocalDate dateVisite;


    private String statut;



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
        this.idMembre=idMembre;
    }


    public LocalDate getDateVisite() {
        return dateVisite;
    }


    public void setDateVisite(LocalDate dateVisite) {
        this.dateVisite=dateVisite;
    }


    public String getStatut() {
        return statut;
    }


    public void setStatut(String statut) {
        this.statut=statut;
    }

}