package com.voronkely.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "camp_info")
public class CampInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_camp", nullable = false)
    private Camp camp;

    @Column(length = 100)
    private String sampana;

    @Column(length = 100)
    private String faritany;

    @Column(length = 100)
    private String faritra;

    @Column(length = 100)
    private String fivondronana;

    @Column(length = 100)
    private String andiany;

    @Column(columnDefinition = "TEXT")
    private String tarigetra;

    @Column(name = "tenin_andriamanitra", columnDefinition = "TEXT")
    private String teninAndriamanitra;

    @Column(columnDefinition = "TEXT")
    private String objectif;

    @Column(columnDefinition = "TEXT")
    private String fandraharahana;

    @Column(columnDefinition = "TEXT")
    private String fitaovana;

    @Column(name = "ara_panahy", columnDefinition = "TEXT")
    private String araPanahy;

    @Column(columnDefinition = "TEXT")
    private String fientanana;

    @Column(columnDefinition = "TEXT")
    private String fahasalamana;

    private Integer isaMpilasy;

    @Column(columnDefinition = "TEXT")
    private String fitanterana;

    @Column(name = "toerana_hiaingana", length = 200)
    private String toeranaHiaingana;

    @Column(name = "toerana_hiverenana", length = 200)
    private String toeranaHiverenana;

    public CampInfo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Camp getCamp() {
        return camp;
    }

    public void setCamp(Camp camp) {
        this.camp = camp;
    }

    public String getSampana() {
        return sampana;
    }

    public void setSampana(String sampana) {
        this.sampana = sampana;
    }

    public String getFaritany() {
        return faritany;
    }

    public void setFaritany(String faritany) {
        this.faritany = faritany;
    }

    public String getFaritra() {
        return faritra;
    }

    public void setFaritra(String faritra) {
        this.faritra = faritra;
    }

    public String getFivondronana() {
        return fivondronana;
    }

    public void setFivondronana(String fivondronana) {
        this.fivondronana = fivondronana;
    }

    public String getAndiany() {
        return andiany;
    }

    public void setAndiany(String andiany) {
        this.andiany = andiany;
    }

    public String getTarigetra() {
        return tarigetra;
    }

    public void setTarigetra(String tarigetra) {
        this.tarigetra = tarigetra;
    }

    public String getTeninAndriamanitra() {
        return teninAndriamanitra;
    }

    public void setTeninAndriamanitra(String teninAndriamanitra) {
        this.teninAndriamanitra = teninAndriamanitra;
    }

    public String getObjectif() {
        return objectif;
    }

    public void setObjectif(String objectif) {
        this.objectif = objectif;
    }

    public String getFandraharahana() {
        return fandraharahana;
    }

    public void setFandraharahana(String fandraharahana) {
        this.fandraharahana = fandraharahana;
    }

    public String getFitaovana() {
        return fitaovana;
    }

    public void setFitaovana(String fitaovana) {
        this.fitaovana = fitaovana;
    }

    public String getAraPanahy() {
        return araPanahy;
    }

    public void setAraPanahy(String araPanahy) {
        this.araPanahy = araPanahy;
    }

    public String getFientanana() {
        return fientanana;
    }

    public void setFientanana(String fientanana) {
        this.fientanana = fientanana;
    }

    public String getFahasalamana() {
        return fahasalamana;
    }

    public void setFahasalamana(String fahasalamana) {
        this.fahasalamana = fahasalamana;
    }

    public Integer getIsaMpilasy() {
        return isaMpilasy;
    }

    public void setIsaMpilasy(Integer isaMpilasy) {
        this.isaMpilasy = isaMpilasy;
    }

    public String getFitanterana() {
        return fitanterana;
    }

    public void setFitanterana(String fitanterana) {
        this.fitanterana = fitanterana;
    }

    public String getToeranaHiaingana() {
        return toeranaHiaingana;
    }

    public void setToeranaHiaingana(String toeranaHiaingana) {
        this.toeranaHiaingana = toeranaHiaingana;
    }

    public String getToeranaHiverenana() {
        return toeranaHiverenana;
    }

    public void setToeranaHiverenana(String toeranaHiverenana) {
        this.toeranaHiverenana = toeranaHiverenana;
    }
}
