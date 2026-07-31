package com.voronkely.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "type_adidy")
public class TypeAdidy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String libelle;


    public TypeAdidy() {
    }


    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public String getLibelle() {
        return libelle;
    }


    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
}