package com.voronkely.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "type_assurance")
public class TypeAssurance {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(nullable = false)
    private String libelle;



    public TypeAssurance() {

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