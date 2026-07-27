package com.voronkely.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDate;

@Entity
@Table(name = "fiche_form1")
public class FicheForm1 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_membre")
    private Long idMembre;

    @Column(name = "image")
    private String image;

    @Column(name = "fiantsoana")
    private String fiantsoana;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "nom_pere")
    private String nomPere;

    @Column(name = "profession_pere")
    private String professionPere;

    @Column(name = "telephone_pere")
    private String telephonePere;

    @Column(name = "fb_pere")
    private String fbPere;

    @Column(name = "lien_fb_pere")
    private String lienFbPere;

    @Column(name = "nom_mere")
    private String nomMere;

    @Column(name = "profession_mere")
    private String professionMere;

    @Column(name = "telephone_mere")
    private String telephoneMere;

    @Column(name = "fb_mere")
    private String fbMere;

    @Column(name = "lien_fb_mere")
    private String lienFbMere;

    @Column(name = "nb_ray_tampo", nullable = false)
    private Integer nbRayTampo;

    @Column(name = "rang_ray_tampo", nullable = false)
    private Integer rangRayTampo;

    @Column(name = "religion")
    private String religion;

    @Column(name = "fiangonana")
    private String fiangonana;

    @Column(name = "sekoly_alahady")
    private Boolean sekolyAlahady;

    @Column(name = "kilasy")
    private String kilasy;

    @Column(name = "batisa")
    private Boolean batisa;

    @Column(name = "sakafo_tsy_zaka")
    private String sakafoTsyZaka;

    @Column(name = "fanafody_tsy_zaka")
    private String fanafodyTsyZaka;

    @Column(name = "famarihana_hafa")
    private String famarihanaHafa;

    @Column(name = "daty_nidirana")
    private LocalDate datyNidirana;

    @Column(name = "daty_fanekena")
    private LocalDate datyFanekena;

    @Column(name = "toerana_nanaovana_fanekena")
    private String toeranaNanaovanaFanekena;

    @Column(name = "daty_nialana")
    private LocalDate datyNialana;

    @Column(name = "antony_nialana")
    private String antonyNialana;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdMembre() {
        return idMembre;
    }

    public void setIdMembre(Long idMembre) {
        this.idMembre = idMembre;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFiantsoana() {
        return fiantsoana;
    }

    public void setFiantsoana(String fiantsoana) {
        this.fiantsoana = fiantsoana;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNomPere() {
        return nomPere;
    }

    public void setNomPere(String nomPere) {
        this.nomPere = nomPere;
    }

    public String getProfessionPere() {
        return professionPere;
    }

    public void setProfessionPere(String professionPere) {
        this.professionPere = professionPere;
    }

    public String getTelephonePere() {
        return telephonePere;
    }

    public void setTelephonePere(String telephonePere) {
        this.telephonePere = telephonePere;
    }

    public String getFbPere() {
        return fbPere;
    }

    public void setFbPere(String fbPere) {
        this.fbPere = fbPere;
    }

    public String getLienFbPere() {
        return lienFbPere;
    }

    public void setLienFbPere(String lienFbPere) {
        this.lienFbPere = lienFbPere;
    }

    public String getNomMere() {
        return nomMere;
    }

    public void setNomMere(String nomMere) {
        this.nomMere = nomMere;
    }

    public String getProfessionMere() {
        return professionMere;
    }

    public void setProfessionMere(String professionMere) {
        this.professionMere = professionMere;
    }

    public String getTelephoneMere() {
        return telephoneMere;
    }

    public void setTelephoneMere(String telephoneMere) {
        this.telephoneMere = telephoneMere;
    }

    public String getFbMere() {
        return fbMere;
    }

    public void setFbMere(String fbMere) {
        this.fbMere = fbMere;
    }

    public String getLienFbMere() {
        return lienFbMere;
    }

    public void setLienFbMere(String lienFbMere) {
        this.lienFbMere = lienFbMere;
    }

    public Integer getNbRayTampo() {
        return nbRayTampo;
    }

    public void setNbRayTampo(Integer nbRayTampo) {
        this.nbRayTampo = nbRayTampo;
    }

    public Integer getRangRayTampo() {
        return rangRayTampo;
    }

    public void setRangRayTampo(Integer rangRayTampo) {
        this.rangRayTampo = rangRayTampo;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getFiangonana() {
        return fiangonana;
    }

    public void setFiangonana(String fiangonana) {
        this.fiangonana = fiangonana;
    }

    public Boolean getSekolyAlahady() {
        return sekolyAlahady;
    }

    public void setSekolyAlahady(Boolean sekolyAlahady) {
        this.sekolyAlahady = sekolyAlahady;
    }

    public String getKilasy() {
        return kilasy;
    }

    public void setKilasy(String kilasy) {
        this.kilasy = kilasy;
    }

    public Boolean getBatisa() {
        return batisa;
    }

    public void setBatisa(Boolean batisa) {
        this.batisa = batisa;
    }

    public String getSakafoTsyZaka() {
        return sakafoTsyZaka;
    }

    public void setSakafoTsyZaka(String sakafoTsyZaka) {
        this.sakafoTsyZaka = sakafoTsyZaka;
    }

    public String getFanafodyTsyZaka() {
        return fanafodyTsyZaka;
    }

    public void setFanafodyTsyZaka(String fanafodyTsyZaka) {
        this.fanafodyTsyZaka = fanafodyTsyZaka;
    }

    public String getFamarihanaHafa() {
        return famarihanaHafa;
    }

    public void setFamarihanaHafa(String famarihanaHafa) {
        this.famarihanaHafa = famarihanaHafa;
    }

    public LocalDate getDatyNidirana() {
        return datyNidirana;
    }

    public void setDatyNidirana(LocalDate datyNidirana) {
        this.datyNidirana = datyNidirana;
    }

    public LocalDate getDatyFanekena() {
        return datyFanekena;
    }

    public void setDatyFanekena(LocalDate datyFanekena) {
        this.datyFanekena = datyFanekena;
    }

    public String getToeranaNanaovanaFanekena() {
        return toeranaNanaovanaFanekena;
    }

    public void setToeranaNanaovanaFanekena(String toeranaNanaovanaFanekena) {
        this.toeranaNanaovanaFanekena = toeranaNanaovanaFanekena;
    }

    public LocalDate getDatyNialana() {
        return datyNialana;
    }

    public void setDatyNialana(LocalDate datyNialana) {
        this.datyNialana = datyNialana;
    }

    public String getAntonyNialana() {
        return antonyNialana;
    }

    public void setAntonyNialana(String antonyNialana) {
        this.antonyNialana = antonyNialana;
    }
}
