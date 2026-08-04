<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des membres</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        body {
            min-height: 100vh;
        }

        .page-shell {
            background: rgba(255, 255, 255, 0.93);
            border-radius: 1.25rem;
            box-shadow: 0 1rem 2rem rgba(15, 81, 50, 0.12);
            backdrop-filter: blur(6px);
        }

        .member-card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 1rem 2rem rgba(15, 81, 50, 0.12);
        }
        .avatar-placeholder {
            width: 90px;
            height: 90px;
            background: linear-gradient(135deg, #198754 0%, #0f5132 100%);
            color: #fff;
            font-size: 2rem;
            font-weight: 700;
        }
    </style>
</head>
<body>
<div class="container-fluid px-0">
    <div class="row g-0">
        <div class="col-auto px-0">
            <div class="position-sticky top-0" style="height:100vh;">
                <jsp:include page="../dashboard/navbar.jsp" />
            </div>
        </div>
        <div class="col p-3 p-lg-4">
            <div class="page-shell p-4 p-lg-5">
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div>
                        <h1 class="h3 mb-1 text-success">Liste des membres</h1>
                        <p class="text-muted mb-0">Voici tous les membres enregistrés.</p>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary me-2">Retour vers dashboard</a>
                        <a href="${pageContext.request.contextPath}/membres/new" class="btn btn-success btn-lg">Nouvel membre</a>
                    </div>
                </div>
                <div class="row g-4">
                    <c:forEach items="${membres}" var="membre">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card member-card h-100">
                                <div class="card-body text-center">

                                    <c:choose>
                                        <c:when test="${not empty images[membre.id]}">
                                            <img src="${pageContext.request.contextPath}/images/${images[membre.id]}"
                                                alt="${membre.nomPrenom}"
                                                class="rounded-circle mx-auto d-block mb-3 shadow-sm"
                                                style="width:90px; height:90px; object-fit:cover; border:3px solid #d6eadc;">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="avatar-placeholder rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3">
                                                ${fn:substring(membre.nomPrenom, 0, 1)}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <h5 class="card-title mb-1">${membre.nomPrenom}</h5>

                                    <p class="text-muted mb-3">
                                        Référence :
                                        <strong>${membre.reference}</strong>
                                    </p>

                                    <div class="d-flex justify-content-center gap-2 mt-2 flex-wrap">
                                        <a href="${pageContext.request.contextPath}/membres/${membre.id}/fiche"
                                        class="btn btn-outline-success btn-sm">
                                            Fiche individuelle
                                        </a>
                                        <a href="${pageContext.request.contextPath}/membres/${membre.id}/grades"
                                        class="btn btn-outline-primary btn-sm">
                                            Voir grade
                                        </a>
                                        <a href="${pageContext.request.contextPath}/membres/${membre.id}/supprimer"
                                        class="btn btn-outline-danger btn-sm"
                                        onclick="return confirm('Supprimer ce membre ?');">
                                            Supprimer
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
