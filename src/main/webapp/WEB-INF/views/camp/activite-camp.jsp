<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Activités Camp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        .table-prewrap td {
            white-space: pre-wrap;
            word-break: break-word;
            vertical-align: top;
        }
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
                    <h2>Activités du camp</h2>
                    <p class="text-muted mb-0">${camp.titre} • ${camp.dateDebut} - ${camp.dateFin}</p>
                    <p class="text-muted">Lieu : ${camp.lieu}</p>
                </div>
                <div class="btn-toolbar gap-2">
                    <a href="${pageContext.request.contextPath}/camp/${camp.id}" class="btn btn-secondary">Retour</a>
                    <a href="${pageContext.request.contextPath}/camp/${camp.id}/activites/nouveau" class="btn btn-success">Créer une activité</a>
                    <a href="${pageContext.request.contextPath}/camp/${camp.id}/export/pdf" class="btn btn-outline-primary">Export PDF</a>
                    <a href="${pageContext.request.contextPath}/camp/${camp.id}/activites/export/excel" class="btn btn-outline-success">Export Excel</a>
                </div>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">
                        <h5 class="card-title mb-0">Liste des activités</h5>
                        <form method="get" class="row gx-2 gy-2 align-items-end mb-0">
                            <div class="col-auto">
                                <label class="form-label mb-1">Filtrer</label>
                                <select name="typeMouvement" class="form-select">
                                    <option value="" ${empty selectedTypeMouvement ? 'selected' : ''}>Tous</option>
                                    <option value="entree" ${selectedTypeMouvement == 'entree' ? 'selected' : ''}>Entrée</option>
                                    <option value="sortie" ${selectedTypeMouvement == 'sortie' ? 'selected' : ''}>Sortie</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary">Appliquer</button>
                            </div>
                            <div class="col-auto">
                                <a href="${pageContext.request.contextPath}/camp/${camp.id}/activites" class="btn btn-outline-secondary">Réinitialiser</a>
                            </div>
                        </form>
                    </div>
                    <div class="row row-cols-1 row-cols-md-2 g-3 mb-4">
                        <div class="col">
                            <div class="alert alert-success mb-0">
                                <strong>Total entrée :</strong> ${totalEntree}
                            </div>
                        </div>
                        <div class="col">
                            <div class="alert alert-danger mb-0">
                                <strong>Total sortie :</strong> ${totalSortie}
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty activites}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover align-middle table-prewrap">
                                <thead class="table-light">
                                <tr>
                                    <th>Antony</th>
                                    <th>Quantité</th>
                                    <th>Prix unitaire</th>
                                    <th>Montant</th>
                                    <th>Type</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${activites}" var="act">
                                    <tr class="${act.typeMouvement == 'entree' || act.typeMouvement == 'ENTREE' ? 'table-success' : (act.typeMouvement == 'sortie' || act.typeMouvement == 'SORTIE' ? 'table-warning' : '')}">
                                        <td>${act.antony}</td>
                                        <td>${act.quantite}</td>
                                        <td>${act.prixUnitaire}</td>
                                        <td>${act.montant}</td>
                                        <td>${act.typeMouvement}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/camp/${camp.id}/activites/${act.id}/edit" class="btn btn-sm btn-outline-primary mb-1">Modifier</a>
                                            <a href="${pageContext.request.contextPath}/camp/${camp.id}/activites/${act.id}/supprimer" class="btn btn-sm btn-outline-danger" onclick="return confirm('Supprimer cette activité ?');">Supprimer</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${empty activites}">
                        <div class="alert alert-info mb-0">Aucune activité enregistrée pour le moment.</div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
