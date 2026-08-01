package com.voronkely.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "numero_trimestre")
public class NumeroTrimestre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "numero_trimestre", nullable = false, length = 50)
    private String numeroTrimestre;

    public NumeroTrimestre() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumeroTrimestre() {
        return numeroTrimestre;
    }

    public void setNumeroTrimestre(String numeroTrimestre) {
        this.numeroTrimestre = numeroTrimestre;
    }

}
