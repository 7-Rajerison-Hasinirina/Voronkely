<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des membres</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h3">Liste des membres</h1>
            <p class="text-muted mb-0">Voici tous les membres enregistrés.</p>
        </div>
        <div>
            <a href="/" class="btn btn-secondary me-2">Retour vers dashboard</a>
            <a href="/membres/new" class="btn btn-success btn-lg">Nouvel membre</a>
        </div>
    </div>

    <div class="row g-4">
        <c:forEach items="${membres}" var="membre">
            <div class="col-12 col-md-6 col-lg-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body text-center">
                        <img src="/images/profile-placeholder.png" alt="Profile" class="rounded-circle mb-3" style="width: 90px; height: 90px; object-fit: cover;">
                        <h5 class="card-title mb-1">${membre.nomPrenom}</h5>
                        <p class="text-muted mb-0">Référence : <strong>${membre.reference}</strong></p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
