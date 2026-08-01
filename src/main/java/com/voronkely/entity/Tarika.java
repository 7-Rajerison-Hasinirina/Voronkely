package com.voronkely.entity;


import jakarta.persistence.*;

import java.time.LocalDate;


@Entity
@Table(name="tarika")
public class Tarika {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



    @Column(nullable=false,length=100)
    private String nom;



    @Column(nullable=false,length=100)
    private String image;



    @Column(name="date_creation",nullable=false)
    private LocalDate dateCreation;




    public Tarika(){
    }



    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id=id;
    }



    public String getNom() {
        return nom;
    }


    public void setNom(String nom) {
        this.nom=nom;
    }



    public String getImage() {
        return image;
    }


    public void setImage(String image) {
        this.image=image;
    }



    public LocalDate getDateCreation() {
        return dateCreation;
    }


    public void setDateCreation(LocalDate dateCreation) {
        this.dateCreation=dateCreation;
    }


}