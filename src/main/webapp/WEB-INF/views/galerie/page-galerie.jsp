<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Galerie</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-auto px-0">
            <jsp:include page="../dashboard/navbar.jsp" />
        </div>
        <div class="col p-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Galerie d'images</h2>
        <a href="${pageContext.request.contextPath}/galerie/nouveau" class="btn btn-primary">Ajouter une photo</a>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <div class="row">
        <c:forEach var="galerie" items="${galeries}">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <c:if test="${not empty galerie.imageName}">
                        <img src="${pageContext.request.contextPath}/images/galerie/${galerie.imageName}"
                             class="card-img-top" alt="${galerie.titre}" style="height: 220px; object-fit: cover;"/>
                    </c:if>
                    <div class="card-body">
                        <h5 class="card-title">${galerie.titre}</h5>
                        <p class="card-text">Date: ${galerie.date}</p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <form action="${pageContext.request.contextPath}/galerie/supprimer/${galerie.id}" method="post" onsubmit="return confirm('Supprimer cette image ?');">
                            <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
