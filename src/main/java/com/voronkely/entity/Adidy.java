package com.voronkely.entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "adidy")
public class Adidy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @ManyToOne
    @JoinColumn(name = "id_membre", nullable = false)
    private Membre membre;


    @ManyToOne
    @JoinColumn(name = "id_type_adidy", nullable = false)
    private TypeAdidy typeAdidy;


    @Column(nullable = false)
    private Double montant;


    @Column(name = "montant_restant", nullable = false)
    private Double montantRestant;


    @Column(name = "date_ajout", nullable = false)
    private LocalDate dateAjout;



    public Adidy() {
    }



    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public Membre getMembre() {
        return membre;
    }


    public void setMembre(Membre membre) {
        this.membre = membre;
    }


    public TypeAdidy getTypeAdidy() {
        return typeAdidy;
    }


    public void setTypeAdidy(TypeAdidy typeAdidy) {
        this.typeAdidy = typeAdidy;
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