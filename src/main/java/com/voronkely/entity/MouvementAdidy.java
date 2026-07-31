package com.voronkely.entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "mouvement_adidy")
public class MouvementAdidy {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



    @ManyToOne
    @JoinColumn(name = "id_adidy", nullable = false)
    private Adidy adidy;



    @Column(name = "motif_utilisation", nullable = false)
    private String motifUtilisation;



    @Column(name = "type_mouvement", nullable = false)
    private String typeMouvement;



    @Column(nullable = false)
    private Double montant;



    @Column(name = "date_mouvement", nullable = false)
    private LocalDate dateMouvement;



    public MouvementAdidy() {
    }




    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public Adidy getAdidy() {
        return adidy;
    }


    public void setAdidy(Adidy adidy) {
        this.adidy = adidy;
    }


    public String getMotifUtilisation() {
        return motifUtilisation;
    }


    public void setMotifUtilisation(String motifUtilisation) {
        this.motifUtilisation = motifUtilisation;
    }


    public String getTypeMouvement() {
        return typeMouvement;
    }


    public void setTypeMouvement(String typeMouvement) {
        this.typeMouvement = typeMouvement;
    }


    public Double getMontant() {
        return montant;
    }


    public void setMontant(Double montant) {
        this.montant = montant;
    }


    public LocalDate getDateMouvement() {
        return dateMouvement;
    }


    public void setDateMouvement(LocalDate dateMouvement) {
        this.dateMouvement = dateMouvement;
    }

}