<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Informations Fiche Technique</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
</head>

<body>

<div class="container-fluid">

    <div class="row">

        <div class="col-auto px-0">

            <jsp:include page="../dashboard/navbar.jsp"/>

        </div>

        <div class="col p-4">

            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2>${fiche.titre}</h2>
                    <p class="text-muted">Année : ${fiche.annee}</p>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/fiche-technique" class="btn btn-secondary">Retour</a>
                    <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/info/nouveau" class="btn btn-success">Ajouter information</a>
                    <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/activites" class="btn btn-primary">Activités</a>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-body">
                    <h5>Informations</h5>
                    <c:if test="${not empty info}">
                        <div class="row g-3">
                            <div class="col-md-6"><strong>Faritra:</strong> ${info.faritra}</div>
                            <div class="col-md-6"><strong>Filoha:</strong> ${info.filoha}</div>
                            <div class="col-12"><strong>Tenin Andriamanitra:</strong> ${info.teninAndriamanitra}</div>
                            <div class="col-12"><strong>Tarigetra:</strong> ${info.tarigetra}</div>
                            <div class="col-md-6"><strong>Toerana ivoriana:</strong> ${info.toeranaIvoriana}</div>
                            <div class="col-md-6"><strong>Andro ivoriana:</strong> ${info.androIvoriana}</div>
                            <div class="col-md-6"><strong>Ora ivoriana:</strong> ${info.oraIvoriana}</div>
                            <div class="col-md-6"><strong>Ny tonia:</strong> ${info.nyTonia}</div>
                            <div class="col-md-6"><strong>Komitim pivondronana:</strong> ${info.komitimPivondronana}</div>
                            <div class="col-md-6"><strong>Daty iraisana:</strong> ${info.datyIraisana}</div>
                            <div class="col-12"><strong>Objectif:</strong> ${info.objectif}</div>
                            <div class="col-12"><strong>Tompon andraikitra:</strong> ${info.tomponAndraikitra}</div>
                        </div>
                    </c:if>
                    <c:if test="${empty info}">
                        <div class="alert alert-warning">Aucune information enregistrée.</div>
                    </c:if>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h5>Activités</h5>
                    <c:forEach items="${activites}" var="act">
                        <div class="mb-3 border rounded p-3">
                            <div><strong>${act.daty}</strong> - ${act.lohahevitra}</div>
                            <div class="text-muted">${act.fombaFampiasa}</div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty activites}">
                        <div class="alert alert-info">Aucune activité enregistrée.</div>
                    </c:if>
                </div>
            </div>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
