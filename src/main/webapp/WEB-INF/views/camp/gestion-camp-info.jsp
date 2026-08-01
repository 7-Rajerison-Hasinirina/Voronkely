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
        .info-label { width: 170px; font-weight: 600; }
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-auto px-0">
            <jsp:include page="../dashboard/navbar.jsp" />
        </div>
        <div class="col p-4">
            <div class="d-flex justify-content-between align-items-start mb-4 flex-wrap gap-2">
                <div>
                    <h2>${camp.titre}</h2>
                    <p class="text-muted mb-1">Lieu : ${camp.lieu}</p>
                    <p class="text-muted mb-0">Début : ${camp.dateDebut} - Fin : ${camp.dateFin}</p>
                </div>
                <div class="d-flex gap-2 flex-wrap">
                    <a href="${pageContext.request.contextPath}/camp/${camp.id}/activites" class="btn btn-primary">Activités</a>
                    <a href="${pageContext.request.contextPath}/camp/${camp.id}/info/nouveau" class="btn btn-success">Ajouter / modifier infos camp</a>
                </div>
            </div>

            <div class="card shadow">
                <div class="card-header bg-light">
                    <h5 class="mb-0">Informations camp</h5>
                </div>
                <div class="card-body">
                    <c:if test="${not empty campInfo}">
                        <div class="row gy-3">
                            <div class="col-12 d-flex gap-2"><span class="info-label">Sampana :</span> ${campInfo.sampana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Faritany :</span> ${campInfo.faritany}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Faritra :</span> ${campInfo.faritra}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Fivondronana :</span> ${campInfo.fivondronana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Andiany :</span> ${campInfo.andiany}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Isa mpilasy :</span> ${campInfo.isaMpilasy}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Tarigetra :</span> ${campInfo.tarigetra}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Tenin'Andriamanitra :</span> ${campInfo.teninAndriamanitra}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Objectif :</span> ${campInfo.objectif}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Fandraharahana :</span> ${campInfo.fandraharahana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Fitaovana :</span> ${campInfo.fitaovana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Ara-panahy :</span> ${campInfo.araPanahy}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Fientanana :</span> ${campInfo.fientanana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Fahasalamana :</span> ${campInfo.fahasalamana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Fitaterana :</span> ${campInfo.fitanterana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Toerana hiaingana :</span> ${campInfo.toeranaHiaingana}</div>
                            <div class="col-12 d-flex gap-2"><span class="info-label">Toerana hiverenana :</span> ${campInfo.toeranaHiverenana}</div>
                        </div>
                    </c:if>
                    <c:if test="${empty campInfo}">
                        <div class="alert alert-info mb-0">Aucune information de camp pour le moment.</div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
