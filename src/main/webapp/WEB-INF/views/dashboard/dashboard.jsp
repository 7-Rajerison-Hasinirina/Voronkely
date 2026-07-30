<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<div class="col-12 col-lg-8">

<section class="card card-dashboard p-4 mb-4">

<h2 class="h5 mb-3">
Résumé du dashboard
</h2>

<div class="row row-cols-1 row-cols-md-2 g-3">

<div class="col">
<div class="p-3 bg-white rounded shadow-sm">
<h3 class="h6 text-success">Membres</h3>
<p class="mb-0 text-muted">Nombre total, statut et informations essentielles.</p>
</div>
</div>

<div class="col">
<div class="p-3 bg-white rounded shadow-sm">
<h3 class="h6 text-success">Assurance</h3>
<p class="mb-0 text-muted">Suivi des assurances beazina, mpiandraikitra, RAD.</p>
</div>
</div>

<div class="col">
<div class="p-3 bg-white rounded shadow-sm">
<h3 class="h6 text-success">Présence</h3>
<p class="mb-0 text-muted">Historique et présence hebdomadaire.</p>
</div>
</div>

<div class="col">
<div class="p-3 bg-white rounded shadow-sm">
<h3 class="h6 text-success">Rakitra</h3>
<p class="mb-0 text-muted">Gestion des montants et mouvements.</p>
</div>
</div>

</div>

</section>

</div>


<div class="col-12 col-lg-4">

<section class="card card-dashboard p-4 mb-4">

<h2 class="h5 mb-3">
Actions rapides
</h2>

<div class="list-group">

<a href="#" class="list-group-item list-group-item-action">
Nouvel membre
</a>

<a href="#" class="list-group-item list-group-item-action">
Nouvelle assurance
</a>

<a href="#" class="list-group-item list-group-item-action">
Suivi de présence
</a>

<a href="${pageContext.request.contextPath}/rakitra/nouveau"
   class="list-group-item list-group-item-action">
Nouvelle rakitra
</a>

</div>

</section>


<section class="card card-dashboard p-4">

<h2 class="h5 mb-3">
Statut
</h2>

<p class="mb-0 text-muted">
Le tableau de bord est accessible sans authentification.
</p>

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