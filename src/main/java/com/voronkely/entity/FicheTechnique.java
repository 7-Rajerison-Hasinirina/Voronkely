package com.voronkely.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "fiche_technique")
public class FicheTechnique {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String titre;

    @Column(nullable = false)
    private Integer annee;

    @ManyToOne
    @JoinColumn(name = "id_numero_trimestre")
    private NumeroTrimestre numeroTrimestre;

    public FicheTechnique() {
    }

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

    public Integer getAnnee() {
        return annee;
    }

    public void setAnnee(Integer annee) {
        this.annee = annee;
    }

    public NumeroTrimestre getNumeroTrimestre() {
        return numeroTrimestre;
    }

    public void setNumeroTrimestre(NumeroTrimestre numeroTrimestre) {
        this.numeroTrimestre = numeroTrimestre;
    }

}
