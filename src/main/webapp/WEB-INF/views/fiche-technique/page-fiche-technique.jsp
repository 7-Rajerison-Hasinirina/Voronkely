<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="UTF-8">

    <title>Gestion Fiche Technique</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        .fiche-card {
            min-height: 360px;
            aspect-ratio: 1 / 1;
            background-size: cover;
            background-position: center;
            color: #fff;
        }
        .fiche-card-body {
            background: rgba(0, 0, 0, 0.45);
        }
    </style>

</head>


<body>

<div class="container-fluid">

    <div class="row">

        <div class="col-auto px-0">

            <jsp:include page="../dashboard/navbar.jsp"/>

        </div>

        <div class="col p-4">

            <div class="d-flex justify-content-between align-items-center mb-4">

                <div>

                    <h2>Gestion Fiche Technique</h2>

                    <small class="text-muted">Liste des fiches techniques</small>

                </div>

                <div>
                    <a href="${pageContext.request.contextPath}/fiche-technique/nouveau" class="btn btn-success">Nouvelle fiche technique</a>
                </div>

            </div>


            <div class="row">

                <c:forEach items="${fiches}" var="fiche">

                    <div class="col-md-4 mb-4">

                        <div class="card text-white shadow h-100" style="background-image: url('${pageContext.request.contextPath}/images/fiche-technique.jpeg'); background-size: cover; background-position: center;">

                            <div class="card-body d-flex flex-column justify-content-end" style="background: rgba(0, 0, 0, 0.45);">

                                <h5 class="card-title">${fiche.titre}</h5>

                                <p class="text-light mb-2">Année : ${fiche.annee}</p>

                                <div class="d-flex gap-2 mt-2">
                                    <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}" class="btn btn-light btn-sm">Voir plus</a>
                                    <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/supprimer" class="btn btn-outline-danger btn-sm" onclick="return confirm('Supprimer cette fiche technique ?');">Supprimer</a>
                                </div>

                            </div>

                        </div>

                    </div>

                </c:forEach>

            </div>


            <c:if test="${empty fiches}">
                <div class="alert alert-warning text-center">Aucune fiche technique trouvée.</div>
            </c:if>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
