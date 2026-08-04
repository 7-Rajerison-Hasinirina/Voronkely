<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard Voronkely</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

<style>
body {
    background-image:
        linear-gradient(
            rgba(241,253,246,0.85),
            rgba(241,253,246,0.85)
        ),
        url("${pageContext.request.contextPath}/images/tente.jpg");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

.header-top {
    background-color:#0f5132;
    color:#ffffff;
    border-bottom:1px solid rgba(255,255,255,0.12);
}

.card-dashboard {
    border:1px solid #e9ecef;
    border-radius:0.75rem;
    box-shadow:0 0.25rem 0.5rem rgba(0,0,0,0.04);
}

.card-dashboard.card-member {
    border-left: 5px solid #f4b400;
}

.card-dashboard.card-visit {
    border-left: 5px solid #198754;
}
</style>

</head>

<body>

<div class="container-fluid">
<div class="row">

<div class="col-auto px-0">
    <jsp:include page="navbar.jsp" />
</div>

<div class="col ps-0">

<header class="header-top d-flex justify-content-between align-items-center px-5 py-4">

<div>
    <h1 class="h3 mb-1 fw-bold text-white">
        Mpanazava FJKM Ankadimbahoaka
    </h1>
    <small class="text-white-50">
        Accueil
    </small>
</div>

<div class="d-flex align-items-center gap-4">
<div class="text-end">
    <div class="fw-semibold text-white">
        Voronkely
    </div>
    <small class="text-white-50">
        Sampana Mavo
    </small>
</div>

<img src="${pageContext.request.contextPath}/images/logo-voronkely.png"
     width="90"
     height="90"
     class="rounded-circle border shadow-sm">
</div>

</header>

<main class="p-4">
<div class="row g-4">
    <div class="col-12 col-xl-4">
        <section class="card card-dashboard card-member p-4 h-100">
            <a href="${pageContext.request.contextPath}/membres" class="text-decoration-none text-reset d-block">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <p class="text-uppercase text-muted small mb-2">Membre</p>
                        <h2 class="h1 fw-bold mb-0">${totalMembres}</h2>
                    </div>
                    <span class="badge bg-warning text-dark">Membres</span>
                </div>
                <p class="mb-0 text-muted">Nombre total de membres enregistrés.</p>
            </a>
        </section>
    </div>

    <div class="col-12 col-xl-8">
        <section class="card card-dashboard card-visit p-4 h-100">
            <div class="d-flex justify-content-between align-items-start mb-3">
                <div>
                    <p class="text-uppercase text-muted small mb-2">Visite de parents</p>
                    <h2 class="h1 fw-bold mb-0">${visitesEnAttente}</h2>
                </div>
                <span class="badge bg-success">En attente</span>
            </div>
            <div class="row g-3">
                <div class="col-md-6 col-lg-3">
                    <a href="${pageContext.request.contextPath}/visite/visite-parent" class="text-decoration-none text-reset d-block">
                        <div class="p-3 rounded border border-primary border-3 bg-white h-100">
                            <div class="small text-muted">Visites</div>
                            <div class="fw-semibold fs-5">${visitesEnAttente}</div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 col-lg-3">
                    <a href="${pageContext.request.contextPath}/assurance" class="text-decoration-none text-reset d-block">
                        <div class="p-3 rounded border border-info border-3 bg-white h-100">
                            <div class="small text-muted">Assurance</div>
                            <div class="fw-semibold fs-5">${montantAssurance} Ar</div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 col-lg-3">
                    <a href="${pageContext.request.contextPath}/adidy" class="text-decoration-none text-reset d-block">
                        <div class="p-3 rounded border border-success border-3 bg-white h-100">
                            <div class="small text-muted">Adidy</div>
                            <div class="fw-semibold fs-5">${montantAdidy} Ar</div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 col-lg-3">
                    <a href="${pageContext.request.contextPath}/tarika" class="text-decoration-none text-reset d-block">
                        <div class="p-3 rounded border border-secondary border-3 bg-white h-100">
                            <div class="small text-muted">Tarika</div>
                            <div class="fw-semibold fs-5">${nombreTarika}</div>
                        </div>
                    </a>
                </div>
            </div>
        </section>
    </div>
</div>
</main>

</div>

</div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
