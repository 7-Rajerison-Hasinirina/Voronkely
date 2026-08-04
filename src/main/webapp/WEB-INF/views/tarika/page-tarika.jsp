<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Gestion Tarika</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<jsp:include page="../common/background.jsp" />
<style>
body { min-height: 100vh; }
.page-shell {
    background: rgba(255,255,255,0.93);
    border-radius: 1.25rem;
    box-shadow: 0 1rem 2rem rgba(15,81,50,.12);
    backdrop-filter: blur(6px);
}
</style>

</head>

<body>
<div class="container-fluid px-0">
    <div class="row g-0">
        <div class="col-auto px-0">
            <div class="position-sticky top-0" style="height:100vh;">
                <jsp:include page="../dashboard/navbar.jsp"/>
            </div>
        </div>
        <div class="col p-3 p-lg-4">
            <div class="page-shell p-4 p-lg-5">
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div>
                        <h2 class="mb-1 text-success">Gestion Tarika</h2>
                        <small class="text-muted">Liste des Tarika</small>
                    </div>
                    <a href="${pageContext.request.contextPath}/tarika/nouveau" class="btn btn-success">Nouvel Tarika</a>
                </div>

                <div class="row">
                    <c:forEach items="${tarikas}" var="tarika">
                        <div class="col-md-4 mb-4">
                            <div class="card shadow h-100">
                                <img src="${pageContext.request.contextPath}/images/${tarika.image}" class="card-img-top" style="height:250px;object-fit:cover;">
                                <div class="card-body">
                                    <h5 class="card-title">${tarika.nom}</h5>
                                    <p class="text-muted mb-2">Créé le : ${tarika.dateCreation}</p>
                                    <p><strong>Effectif :</strong>
                                        <c:choose>
                                            <c:when test="${effectifs[tarika.id]!=null}">${effectifs[tarika.id]}</c:when>
                                            <c:otherwise>0</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="card-footer bg-white d-grid gap-2">
                                    <a href="${pageContext.request.contextPath}/membre-tarika/${tarika.id}" class="btn btn-primary w-100">Membre Tarika</a>
                                    <a href="${pageContext.request.contextPath}/tarika/${tarika.id}/supprimer" class="btn btn-outline-danger w-100" onclick="return confirm('Supprimer ce Tarika ?');">Supprimer</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <c:if test="${empty tarikas}">
                    <div class="alert alert-warning text-center">Aucun Tarika enregistré.</div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>