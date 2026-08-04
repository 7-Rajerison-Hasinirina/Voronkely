package com.voronkely.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import java.time.LocalDate;

@Entity
@Table(name = "assurance")
public class Assurance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "id_membre", nullable = true)
    @NotFound(action = NotFoundAction.IGNORE)
    private Membre membre;

    @Column(nullable = false)
    private Double montant;

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "id_type_assurance", nullable = true)
    @NotFound(action = NotFoundAction.IGNORE)
    private TypeAssurance typeAssurance;

    @Column(nullable = false)
    private LocalDate date;

    public Assurance() {

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

    public Double getMontant() {
        return montant;
    }

    public void setMontant(Double montant) {
        this.montant = montant;
    }

    public TypeAssurance getTypeAssurance() {
        return typeAssurance;
    }

    public void setTypeAssurance(TypeAssurance typeAssurance) {
        this.typeAssurance = typeAssurance;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

}