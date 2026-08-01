<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Activités Fiche Technique</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <style>
        .table-prewrap td {
            white-space: pre-wrap;
            word-break: break-word;
            vertical-align: top;
        }
        .table-prewrap th {
            vertical-align: bottom;
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
<div class="d-flex justify-content-between align-items-start mb-4 gap-2 flex-wrap">
                        <div>
                            <h2>Activités pour ${fiche.titre}</h2>
                            <p class="text-muted">Année : ${fiche.annee}</p>
                        </div>
                        <div class="btn-toolbar gap-2">
                            <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}" class="btn btn-secondary">Retour</a>
                            <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/activites/nouveau" class="btn btn-success">Créer une activité</a>
                            <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/export/pdf" class="btn btn-outline-primary">Export PDF</a>
                            <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/activites/export/excel" class="btn btn-outline-success">Export Excel</a>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h5>Liste des activités</h5>
                    <c:if test="${not empty activites}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover align-middle table-prewrap">
                                <thead class="table-light">
                                    <tr>
                                        <th>Daty</th>
                                        <th>Lohahevitra</th>
                                        <th>Fomba fampitana</th>
                                        <th>Sahanasa</th>
                                        <th>Tomponandraikitra</th>
                                        <th>Fanamarihana</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${activites}" var="act">
                                    <tr>
                                        <td>${act.daty}</td>
                                        <td>${act.lohahevitra}</td>
                                        <td style="min-width: 220px; white-space: normal;">${act.fombaFampiasa}</td>
                                        <td style="min-width: 220px; white-space: normal;">${act.sahanasa}</td>
                                        <td>${act.tomponandraikitra}</td>
                                        <td style="min-width: 220px; white-space: normal;">${act.fanamarihana}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/activites/${act.id}/edit" class="btn btn-sm btn-outline-primary mb-1">Modifier</a>
                                            <a href="${pageContext.request.contextPath}/fiche-technique/${fiche.id}/activites/${act.id}/supprimer" class="btn btn-sm btn-outline-danger" onclick="return confirm('Supprimer cette activité ?');">Supprimer</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
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
