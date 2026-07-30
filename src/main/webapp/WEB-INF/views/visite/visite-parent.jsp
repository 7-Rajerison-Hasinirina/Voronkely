<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="fr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Visites de parents</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

    <style>

        .member-card{
            border:none;
            border-radius:1rem;
            box-shadow:0 1rem 2rem rgba(15,81,50,.12);
        }

        .avatar-placeholder{
            width:90px;
            height:90px;
            background:linear-gradient(135deg,#198754,#0f5132);
            color:#fff;
            font-size:2rem;
            font-weight:700;
        }

    </style>

</head>

<body class="bg-light">

<div class="container py-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2>Visites de parents</h2>

            <p class="text-muted">
                Membres en attente de visite.
            </p>

        </div>

        <a href="${pageContext.request.contextPath}/visite/nouveau"
           class="btn btn-success">
            Nouvelle visite
        </a>

        <a href="${pageContext.request.contextPath}/visite/historique"
            class="btn btn-primary">

            Voir historique

         </a>

    </div>


    <div class="row g-4">

        <c:forEach items="${visites}" var="visite">

            <c:set var="membre" value="${membres[visite.idMembre]}"/>
            <c:set var="fiche" value="${fiches[visite.idMembre]}"/>

            <div class="col-12 col-md-6 col-lg-4">

                <div class="card member-card h-100">

                    <div class="card-body text-center">

                        <c:choose>

                            <c:when test="${not empty fiche.image}">

                                <img
                                        src="${pageContext.request.contextPath}/images/${fiche.image}"
                                        class="rounded-circle mx-auto d-block mb-3 shadow-sm"
                                        style="width:90px;height:90px;object-fit:cover;border:3px solid #d6eadc;"
                                        alt="${membre.nomPrenom}">

                            </c:when>

                            <c:otherwise>

                                <div class="avatar-placeholder rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3">

                                    ${fn:substring(membre.nomPrenom,0,1)}

                                </div>

                            </c:otherwise>

                        </c:choose>


                        <h5 class="card-title">

                            ${membre.nomPrenom}

                        </h5>

                        <p class="text-muted mb-1">

                            Référence :
                            <strong>${membre.reference}</strong>

                        </p>

                        <p class="mb-1">

                            Date visite :
                            <strong>${visite.dateVisite}</strong>

                        </p>
                        <div class="d-flex justify-content-center gap-2 mt-3">

                           <span class="badge bg-warning text-dark align-self-center">

                              ${visite.statut}

                           </span>

                           <form method="post"
                                 action="${pageContext.request.contextPath}/visite/${visite.id}/terminer">

                              <button
                                       class="btn btn-success btn-sm">

                                    Terminer

                              </button>

                           </form>

                        </div>

                        <a href="${pageContext.request.contextPath}/membres/${membre.id}/fiche"
                           class="btn btn-outline-success btn-sm">

                            Voir la fiche

                        </a>

                    </div>

                </div>

            </div>

        </c:forEach>

    </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>