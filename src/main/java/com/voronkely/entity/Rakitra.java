package com.voronkely.entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "rakitra")
public class Rakitra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Double montant;

    @Column(name = "montant_restant", nullable = false)
    private Double montantRestant;

    @Column(name = "date_ajout", nullable = false)
    private LocalDate dateAjout;

    public Rakitra() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getMontant() {
        return montant;
    }

    public void setMontant(Double montant) {
        this.montant = montant;
    }

    public Double getMontantRestant() {
        return montantRestant;
    }

    public void setMontantRestant(Double montantRestant) {
        this.montantRestant = montantRestant;
    }

    public LocalDate getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(LocalDate dateAjout) {
        this.dateAjout = dateAjout;
    }
}