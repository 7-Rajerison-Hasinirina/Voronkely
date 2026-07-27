<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h4">Fiche individuelle</h1>
                    <p class="text-muted mb-0">Crée une fiche individuelle pour ce membre.</p>
                </div>
                <a href="/membres/${membre.id}" class="btn btn-success">Créer une fiche individuelle</a>
            </div>
            <div class="row g-4">
                <div class="col-12 col-md-4 text-center">
                    <div class="rounded-circle bg-success text-white d-flex align-items-center justify-content-center mx-auto" style="width: 140px; height: 140px; font-size: 3rem;">
                        <span>${membre.nomPrenom != null ? membre.nomPrenom.substring(0,1) : 'M'}</span>
                    </div>
                </div>
                <div class="col-12 col-md-8">
                    <dl class="row mb-0">
                        <dt class="col-sm-4">Nom et prénoms</dt>
                        <dd class="col-sm-8">${membre.nomPrenom}</dd>
                        <dt class="col-sm-4">Référence</dt>
                        <dd class="col-sm-8">${membre.reference}</dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
