package com.voronkely.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "membre_grade")
public class MembreGrade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_membre", nullable = false)
    private Membre membre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_grade", nullable = false)
    private Grade grade;

    @Column(name = "date")
    private LocalDate date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Membre getMembre() {
        return membre;
    }

    public void setMembre(Membre membre) {
        this.membre = membre;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
