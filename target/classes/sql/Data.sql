

### PART 03: 

- Module 1: Rakitra

    - table a creer: 'rakitra':

        - rakitra:

            * id

            * montant

            * montant_restant

            * date_ajout

        - mouvement_rakitra: 

            * id

            * id_rakitra

            * montant_a_deduire

            * motif_utilisation

            * type_mouvement 'ENTREE', "SORTIE"

    - ajout de bouton 'Rakitra' dans le navbar

    - on affiche un bouton : 'Nouvel rakitra' dans rakitra/page-rakitra.jsp qui ouvre rakitra/rakitra-form.jsp 

    - Creation de la page pour le gestion de rakitra rakitra/rakitra-form.jsp 



        - bouton 'Nouvel rakitra' -> ouvre une form_rakitra ( formulaire pour isnerer le montant de rakitra )

        - form_rakitra:

            * date 

            * montant

            * montant_restant

            * bouton : enregistrer -> table rakitra 





- Module 2: Affichge de tabelau historique rakitra : dans rakitra/page-rakitra.jsp

    - date 

    - montant

    - montant_restante : montant - SUM montant_a_deduire dans la table mouvement_rakitra  ( s'il n'y en a pas, on prend 0 le montant_a_deduire)

    - 'Voir detail'





- Module 3: Si rakitra : tsy lany 

    - Clique sur bouton 'Voir detail' -> ouvre une mouvement-rakira.jsp 

    - Creation de la formulaire mouvement rakitra: ( en recuperation de cet id_rakitra )

        - montant actuel ( le montant restant )

        - montant a deduire

        - montant restant : calculer par JS ( erreur: 'montant insuffisant' si  montant actuel - montant a deduire < 0 )

        - motif_utilisation

        - type_mouvement

        - bouton: Enregistrer -> mouvement_rakitra 





- Module 4: Montant global via rakitra 

    - filtre date min max

    - affichge de montant globaal 



rakitra.js dans static/javascript/rakitra.js 

+ creation de enity, controller, repository, service pour ces deux tables 





package com.voronkely.entity;



import jakarta.persistence.*;



import java.time.LocalDate;



@Entity

@Table(name = "rakitra")

public class Rakitra {



    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;



    @Column(nullable = false)

    private Double montant;



    @Column(name = "montant_restant", nullable = false)

    private Double montantRestant;



    @Column(name = "date_ajout", nullable = false)

    private LocalDate dateAjout;



    public Rakitra() {

    }



    public Long getId() {

        return id;

    }



    public void setId(Long id) {

        this.id = id;

    }



    public Double getMontant() {

        return montant;

    }



    public void setMontant(Double montant) {

        this.montant = montant;

    }



    public Double getMontantRestant() {

        return montantRestant;

    }



    public void setMontantRestant(Double montantRestant) {

        this.montantRestant = montantRestant;

    }



    public LocalDate getDateAjout() {

        return dateAjout;

    }



    public void setDateAjout(LocalDate dateAjout) {

        this.dateAjout = dateAjout;

    }

}







package com.voronkely.repository;



import com.voronkely.entity.Rakitra;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;



import java.util.List;



public interface RakitraRepository extends JpaRepository<Rakitra, Long> {

    List<Rakitra> findAllByOrderByDateAjoutDesc();





    List<Rakitra> findByMontantRestantGreaterThanOrderByDateAjoutDesc(Double montant);





    @Query("""

            SELECT COALESCE(SUM(r.montantRestant),0)

            FROM Rakitra r

            """)

    Double montantGlobalRestant();



}





package com.voronkely.service;



import com.voronkely.entity.Rakitra;

import com.voronkely.repository.RakitraRepository;

import org.springframework.stereotype.Service;



import java.util.List;

import java.util.Optional;



@Service

public class RakitraService {



    private final RakitraRepository rakitraRepository;



    public RakitraService(RakitraRepository rakitraRepository) {

        this.rakitraRepository = rakitraRepository;

    }



    public List<Rakitra> findAll() {

        return rakitraRepository.findAllByOrderByDateAjoutDesc();

    }



    public Optional<Rakitra> findById(Long id) {

        return rakitraRepository.findById(id);

    }



    public Rakitra save(Rakitra rakitra) {

        return rakitraRepository.save(rakitra);

    }



    public void deleteById(Long id) {

        rakitraRepository.deleteById(id);

    }



    public List<Rakitra> findDisponible() {

        return rakitraRepository.findByMontantRestantGreaterThanOrderByDateAjoutDesc(0.0);

    }



    public Double montantGlobalRestant() {

        return rakitraRepository.montantGlobalRestant();

    }



}







package com.voronkely.controller;



import com.voronkely.entity.Rakitra;

import com.voronkely.service.RakitraService;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;



import java.time.LocalDate;



@Controller

@RequestMapping("/rakitra")

public class RakitraController {



    private final RakitraService rakitraService;



    public RakitraController(RakitraService rakitraService) {

        this.rakitraService = rakitraService;

    }





    @GetMapping

    public String pageRakitra(Model model) {



        model.addAttribute(

                "rakitras",

                rakitraService.findAll());



        model.addAttribute(

                "montantGlobal",

                rakitraService.montantGlobalRestant());



        return "rakitra/page-rakitra";

    }





    @GetMapping("/nouveau")

    public String nouveau(Model model) {



        Rakitra rakitra = new Rakitra();



        rakitra.setDateAjout(LocalDate.now());



        rakitra.setMontant(0.0);



        rakitra.setMontantRestant(0.0);



        model.addAttribute(

                "rakitra",

                rakitra);



        return "rakitra/rakitra-form";

    }





    @PostMapping

    public String creer(

            @ModelAttribute Rakitra rakitra) {



        // Au départ le restant est égal au montant

        rakitra.setMontantRestant(

                rakitra.getMontant());



        rakitraService.save(rakitra);



        return "redirect:/rakitra";

    }





    @GetMapping("/{id}")

    public String detail(

            @PathVariable Long id,

            Model model) {



        rakitraService.findById(id)

                .ifPresent(r ->

                        model.addAttribute("rakitra", r));



        return "rakitra/mouvement-rakitra";

    }



}







j'ai pas encore creer les entity, ...., controler pour mouvement_rakitra 



et les deux autres views

voici page-rakitra.jsp 



<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<html lang="fr">



<head>



    <meta charset="UTF-8">



    <title>Gestion Rakitra</title>



    <link rel="stylesheet"

          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">



</head>



<body class="bg-light">



<div class="container py-4">



    <div class="d-flex justify-content-between align-items-center mb-4">



        <div>



            <h2>Gestion Rakitra</h2>



            <small class="text-muted">

                Historique des Rakitra

            </small>



        </div>



        <div>



            <a href="${pageContext.request.contextPath}/rakitra/nouveau"

               class="btn btn-success">



                Nouvel Rakitra



            </a>



        </div>



    </div>





    <div class="card shadow-sm mb-4">



        <div class="card-body">



            <form method="get"

                  action="${pageContext.request.contextPath}/rakitra">



                <div class="row">



                    <div class="col-md-4">



                        <label class="form-label">



                            Date minimum



                        </label>



                        <input

                                type="date"

                                name="dateMin"

                                class="form-control"

                                value="${dateMin}">



                    </div>



                    <div class="col-md-4">



                        <label class="form-label">



                            Date maximum



                        </label>



                        <input

                                type="date"

                                name="dateMax"

                                class="form-control"

                                value="${dateMax}">



                    </div>



                    <div class="col-md-4 d-grid">



                        <label>&nbsp;</label>



                        <button

                                class="btn btn-primary">



                            Rechercher



                        </button>



                    </div>



                </div>



            </form>



        </div>



    </div>





    <div class="alert alert-success mb-4">



        <div class="row">



            <div class="col-md-6">



                <strong>



                    Montant global restant



                </strong>



            </div>



            <div class="col-md-6 text-end">



                <h4 class="mb-0">



                    ${montantGlobal}



                </h4>



            </div>



        </div>



    </div>





    <div class="card shadow-sm">



        <div class="card-body">



            <table class="table table-bordered table-hover align-middle">



                <thead class="table-success">



                <tr>



                    <th>Date</th>



                    <th>Montant</th>



                    <th>Montant restant</th>



                    <th>Etat</th>



                    <th width="150">



                        Action



                    </th>



                </tr>



                </thead>



                <tbody>



                <c:forEach

                        items="${rakitras}"

                        var="rakitra">



                    <tr>



                        <td>



                            ${rakitra.dateAjout}



                        </td>



                        <td>



                            ${rakitra.montant}



                        </td>



                        <td>



                            ${rakitra.montantRestant}



                        </td>



                        <td>



                            <c:choose>



                                <c:when test="${rakitra.montantRestant>0}">



                                    <span class="badge bg-success">



                                        Disponible



                                    </span>



                                </c:when>



                                <c:otherwise>



                                    <span class="badge bg-danger">



                                        Epuisé



                                    </span>



                                </c:otherwise>



                            </c:choose>



                        </td>



                        <td>



                            <a

                                    href="${pageContext.request.contextPath}/rakitra/${rakitra.id}"

                                    class="btn btn-primary btn-sm">



                                Voir détail



                            </a>



                        </td>



                    </tr>



                </c:forEach>



                <c:if test="${empty rakitras}">



                    <tr>



                        <td colspan="5"

                            class="text-center">



                            Aucun Rakitra disponible.



                        </td>



                    </tr>



                </c:if>



                </tbody>



            </table>



        </div>



    </div>



</div>



<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>



</body>



</html>







CREATE TABLE rakitra (

    id INTEGER PRIMARY KEY AUTOINCREMENT,