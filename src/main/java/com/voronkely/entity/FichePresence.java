package com.voronkely.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "fiche_presence")
public class FichePresence {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_membre", nullable = false)
    private Long idMembre;

    @Column(name = "date_presence", nullable = false)
    private LocalDate datePresence;

    @Column(name = "present", nullable = false)
    private Boolean present = false;


    public FichePresence() {
    }


    public FichePresence(Long idMembre, LocalDate datePresence, Boolean present) {
        this.idMembre = idMembre;
        this.datePresence = datePresence;
        this.present = present;
    }


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


    public LocalDate getDatePresence() {
        return datePresence;
    }

    public void setDatePresence(LocalDate datePresence) {
        this.datePresence = datePresence;
    }


    public Boolean getPresent() {
        return present;
    }

    public void setPresent(Boolean present) {
        this.present = present;
    }
}