package com.voronkely.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "agenda")
public class Agenda {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String titre;

    @Column(name = "date_creation", nullable = false)
    private LocalDate dateCreation;

    @Column(name = "date_utilisation", nullable = false)
    private LocalDate dateUtilisation;

    @Column(columnDefinition = "TEXT")
    private String contenu;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public LocalDate getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(LocalDate dateCreation) {
        this.dateCreation = dateCreation;
    }

    public LocalDate getDateUtilisation() {
        return dateUtilisation;
    }

    public void setDateUtilisation(LocalDate dateUtilisation) {
        this.dateUtilisation = dateUtilisation;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }
}
