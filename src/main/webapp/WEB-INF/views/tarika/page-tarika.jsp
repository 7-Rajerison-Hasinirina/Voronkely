<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Gestion Tarika</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

</head>

<body class="bg-light">

<div class="container py-4">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2>Gestion Tarika</h2>

            <small class="text-muted">
                Liste des Tarika
            </small>

        </div>

        <a href="${pageContext.request.contextPath}/tarika/nouveau"
           class="btn btn-success">

            Nouvel Tarika

        </a>

    </div>



    <div class="row">

        <c:forEach items="${tarikas}" var="tarika">

            <div class="col-md-4 mb-4">

                <div class="card shadow h-100">

                    <img
                            src="${pageContext.request.contextPath}/images/${tarika.image}"
                            class="card-img-top"
                            style="height:250px;object-fit:cover;">

                    <div class="card-body">

                        <h5 class="card-title">

                            ${tarika.nom}

                        </h5>

                        <p class="text-muted mb-2">

                            Créé le :
                            ${tarika.dateCreation}

                        </p>

                        <p>

                            <strong>Effectif :</strong>

                            <c:choose>

                                <c:when test="${effectifs[tarika.id]!=null}">

                                    ${effectifs[tarika.id]}

                                </c:when>

                                <c:otherwise>

                                    0

                                </c:otherwise>

                            </c:choose>

                        </p>

                    </div>

                    <div class="card-footer bg-white">

                        <a href="${pageContext.request.contextPath}/membre-tarika/${tarika.id}"
                           class="btn btn-primary w-100">

                            Membre Tarika

                        </a>

                    </div>

                </div>

            </div>

        </c:forEach>

    </div>



    <c:if test="${empty tarikas}">

        <div class="alert alert-warning text-center">

            Aucun Tarika enregistré.

        </div>

    </c:if>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>