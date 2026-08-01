package com.voronkely.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "fiche_technique_info")
public class FicheTechniqueInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_fiche_technique", nullable = false)
    private FicheTechnique ficheTechnique;

    private String faritra;

    @Column(columnDefinition = "TEXT")
    private String teninAndriamanitra;

    @Column(columnDefinition = "TEXT")
    private String tarigetra;

    private String toeranaIvoriana;
    private String androIvoriana;
    private String oraIvoriana;
    private String nyTonia;
    private String komitimPivondronana;
    private String filoha;

    @Column(columnDefinition = "TEXT")
    private String datyIraisana;

    @Column(columnDefinition = "TEXT")
    private String objectif;

    private String tomponAndraikitra;

    public FicheTechniqueInfo() {
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

    public String getFaritra() {
        return faritra;
    }

    public void setFaritra(String faritra) {
        this.faritra = faritra;
    }

    public String getTeninAndriamanitra() {
        return teninAndriamanitra;
    }

    public void setTeninAndriamanitra(String teninAndriamanitra) {
        this.teninAndriamanitra = teninAndriamanitra;
    }

    public String getTarigetra() {
        return tarigetra;
    }

    public void setTarigetra(String tarigetra) {
        this.tarigetra = tarigetra;
    }

    public String getToeranaIvoriana() {
        return toeranaIvoriana;
    }

    public void setToeranaIvoriana(String toeranaIvoriana) {
        this.toeranaIvoriana = toeranaIvoriana;
    }

    public String getAndroIvoriana() {
        return androIvoriana;
    }

    public void setAndroIvoriana(String androIvoriana) {
        this.androIvoriana = androIvoriana;
    }

    public String getOraIvoriana() {
        return oraIvoriana;
    }

    public void setOraIvoriana(String oraIvoriana) {
        this.oraIvoriana = oraIvoriana;
    }

    public String getNyTonia() {
        return nyTonia;
    }

    public void setNyTonia(String nyTonia) {
        this.nyTonia = nyTonia;
    }

    public String getKomitimPivondronana() {
        return komitimPivondronana;
    }

    public void setKomitimPivondronana(String komitimPivondronana) {
        this.komitimPivondronana = komitimPivondronana;
    }

    public String getFiloha() {
        return filoha;
    }

    public void setFiloha(String filoha) {
        this.filoha = filoha;
    }

    public String getDatyIraisana() {
        return datyIraisana;
    }

    public void setDatyIraisana(String datyIraisana) {
        this.datyIraisana = datyIraisana;
    }

    public String getObjectif() {
        return objectif;
    }

    public void setObjectif(String objectif) {
        this.objectif = objectif;
    }

    public String getTomponAndraikitra() {
        return tomponAndraikitra;
    }

    public void setTomponAndraikitra(String tomponAndraikitra) {
        this.tomponAndraikitra = tomponAndraikitra;
    }

}
