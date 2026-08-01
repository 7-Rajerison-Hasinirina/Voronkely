package com.voronkely.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "activite_fiche_technique")
public class ActiviteFicheTechnique {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_fiche_technique", nullable = false)
    private FicheTechnique ficheTechnique;

    private LocalDate daty;
    private String lohahevitra;

    @Column(columnDefinition = "TEXT")
    private String fombaFampiasa;

    private String sahanasa;
    private String tomponandraikitra;

    @Column(columnDefinition = "TEXT")
    private String fanamarihana;

    public ActiviteFicheTechnique() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public FicheTechnique getFicheTechnique() {
        return ficheTechnique;
    }

    public void setFicheTechnique(FicheTechnique ficheTechnique) {
        this.ficheTechnique = ficheTechnique;
    }

    public LocalDate getDaty() {
        return daty;
    }

    public void setDaty(LocalDate daty) {
        this.daty = daty;
    }

    public String getLohahevitra() {
        return lohahevitra;
    }

    public void setLohahevitra(String lohahevitra) {
        this.lohahevitra = lohahevitra;
    }

    public String getFombaFampiasa() {
        return fombaFampiasa;
    }

    public void setFombaFampiasa(String fombaFampiasa) {
        this.fombaFampiasa = fombaFampiasa;
    }

    public String getSahanasa() {
        return sahanasa;
    }

    public void setSahanasa(String sahanasa) {
        this.sahanasa = sahanasa;
    }

    public String getTomponandraikitra() {
        return tomponandraikitra;
    }

    public void setTomponandraikitra(String tomponandraikitra) {
        this.tomponandraikitra = tomponandraikitra;
    }

    public String getFanamarihana() {
        return fanamarihana;
    }

    public void setFanamarihana(String fanamarihana) {
        this.fanamarihana = fanamarihana;
    }

}
