package com.voronkely.entity;

import jakarta.persistence.*;

@Entity
@Table(name="role_tarika")
public class RoleTarika {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(nullable=false,length=100)
    private String role;



    public RoleTarika(){
    }



    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id=id;
    }


    public String getRole() {
        return role;
    }


    public void setRole(String role) {
        this.role=role;
    }

}