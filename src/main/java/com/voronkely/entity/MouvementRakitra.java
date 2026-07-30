package com.voronkely.entity;


import jakarta.persistence.*;

import java.time.LocalDate;


@Entity
@Table(name = "mouvement_rakitra")
public class MouvementRakitra {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



    @ManyToOne
    @JoinColumn(name = "id_rakitra", nullable = false)
    private Rakitra rakitra;



    @Column(name = "montant_a_deduire", nullable = false)
    private Double montantADeduire;



    @Column(name = "motif_utilisation", nullable = false)
    private String motifUtilisation;



    @Column(name = "type_mouvement", nullable = false)
    private String typeMouvement;



    @Column(name = "date_mouvement", nullable = false)
    private LocalDate dateMouvement;





    public MouvementRakitra() {

    }






    public Long getId() {
        return id;
    }



    public void setId(Long id) {
        this.id = id;
    }






    public Rakitra getRakitra() {
        return rakitra;
    }



    public void setRakitra(Rakitra rakitra) {
        this.rakitra = rakitra;
    }






    public Double getMontantADeduire() {
        return montantADeduire;
    }



    public void setMontantADeduire(Double montantADeduire) {
        this.montantADeduire = montantADeduire;
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






    public LocalDate getDateMouvement() {
        return dateMouvement;
    }



    public void setDateMouvement(LocalDate dateMouvement) {
        this.dateMouvement = dateMouvement;
    }

}