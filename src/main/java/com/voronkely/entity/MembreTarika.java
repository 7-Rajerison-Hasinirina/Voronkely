package com.voronkely.entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "membre_tarika")
public class MembreTarika {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_tarika")
    private Tarika tarika;

    @ManyToOne
    @JoinColumn(name = "id_membre")
    private Membre membre;

    @ManyToOne
    @JoinColumn(name = "id_role_tarika")
    private RoleTarika roleTarika;

    private LocalDate date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tarika getTarika() {
        return tarika;
    }

    public void setTarika(Tarika tarika) {
        this.tarika = tarika;
    }

    public Membre getMembre() {
        return membre;
    }

    public void setMembre(Membre membre) {
        this.membre = membre;
    }

    public RoleTarika getRoleTarika() {
        return roleTarika;
    }

    public void setRoleTarika(RoleTarika roleTarika) {
        this.roleTarika = roleTarika;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

}