<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Gestion Camp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        .camp-card {
            min-height: 260px;
            background-size: cover;
            background-position: center;
            color: #fff;
        }
        .camp-card-overlay {
            background: rgba(0, 0, 0, 0.45);
            min-height: 260px;
        }
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-auto px-0">
            <jsp:include page="../dashboard/navbar.jsp" />
        </div>
        <div class="col p-4">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <div>
                    <h2>Gestion Camp</h2>
                    <small class="text-muted">Liste des camps</small>
                </div>
                <a href="${pageContext.request.contextPath}/camp/nouveau" class="btn btn-success">Nouvelle camp</a>
            </div>

            <div class="row g-4">
                <c:forEach items="${camps}" var="camp">
                    <div class="col-md-4">
                        <div class="card text-white camp-card shadow" style="background-image:url('${pageContext.request.contextPath}/images/camp.jpeg');">
                            <div class="camp-card-overlay p-4 d-flex flex-column justify-content-between h-100 rounded-4">
                                <div>
                                    <h4 class="card-title">${camp.titre}</h4>
                                    <p class="mb-1">Lieu : ${camp.lieu}</p>
                                    <p class="mb-0">Début : ${camp.dateDebut}</p>
                                    <p class="mb-0">Fin : ${camp.dateFin}</p>
                                </div>
                                <div class="d-flex gap-2">
                                    <a href="${pageContext.request.contextPath}/camp/${camp.id}" class="btn btn-light btn-sm">Voir plus</a>
                                    <a href="${pageContext.request.contextPath}/camp/${camp.id}/supprimer" class="btn btn-outline-danger btn-sm" onclick="return confirm('Supprimer ce camp ?');">Supprimer</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${empty camps}">
                <div class="alert alert-warning text-center mt-4">Aucun camp trouvé.</div>
            </c:if>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
