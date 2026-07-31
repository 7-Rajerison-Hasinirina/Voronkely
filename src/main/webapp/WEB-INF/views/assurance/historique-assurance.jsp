<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Historique assurance</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

<style>

body{
    background:#f1fdf6;
}

.header-page{
    background:#0f5132;
    color:white;
    padding:20px;
    border-radius:10px;
}

.card-dashboard{
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,.05);
}

.table thead th{
    background:#198754;
    color:white;
}

.total-card{
    border-left:6px solid #198754;
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

<div class="header-page mb-4">

<h2>

Historique assurance

</h2>

</div>

<div class="card card-dashboard mb-4">

<div class="card-body">

<form method="get"
      action="${pageContext.request.contextPath}/assurance/historique">

    <div class="row">

        <div class="col-md-4">

            <label class="form-label">
                Référence membre
            </label>

            <input type="text"
                   name="reference"
                   value="${reference}"
                   class="form-control"
                   placeholder="Ex : M000001">

        </div>

        <div class="col-md-3">

            <label class="form-label">
                Date minimum
            </label>

            <input type="date"
                   name="dateMin"
                   value="${dateMin}"
                   class="form-control">

        </div>

        <div class="col-md-3">

            <label class="form-label">
                Date maximum
            </label>

            <input type="date"
                   name="dateMax"
                   value="${dateMax}"
                   class="form-control">

        </div>

        <div class="col-md-2 d-flex align-items-end">

            <button class="btn btn-success me-2">
                Filtrer
            </button>

            <a href="${pageContext.request.contextPath}/assurance/historique"
               class="btn btn-secondary">

                Réinitialiser

            </a>

        </div>

    </div>

</form>
</div>

</div>

<div class="card total-card mb-4">

<div class="card-body">

<h4 class="text-success mb-3">

Montant global par type d'assurance

</h4>

<table class="table table-bordered">

<thead>

<tr>

<th>

Type assurance

</th>

<th>

Montant total

</th>

</tr>

</thead>

<tbody>

<c:forEach items="${totaux}" var="t">

<tr>

<td>

${t.typeAssurance}

</td>

<td>

${t.montant} Ar

</td>

</tr>

</c:forEach>

<c:if test="${empty totaux}">

<tr>

<td colspan="2" class="text-center">

Aucune donnée.

</td>

</tr>

</c:if>

</tbody>

</table>

</div>

</div>

<div class="card card-dashboard">

<div class="card-body">

<table class="table table-bordered table-hover">

<thead>

<tr>

<th>

Date

</th>

<th>

Référence

</th>

<th>

Membre

</th>

<th>

Type

</th>

<th>

Montant

</th>

</tr>

</thead>

<tbody>

<c:forEach items="${assurances}" var="assurance">

<tr>

<td>

${assurance.date}

</td>

<td>

${assurance.membre.reference}

</td>

<td>

${assurance.membre.nomPrenom}

</td>

<td>

${assurance.typeAssurance.libelle}

</td>

<td>

${assurance.montant} Ar

</td>

</tr>

</c:forEach>

<c:if test="${empty assurances}">

<tr>

<td colspan="5"
class="text-center text-muted">

Aucune donnée.

</td>

</tr>

</c:if>

</tbody>

</table>

</div>

</div>

</div>

</div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>