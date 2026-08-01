<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Nouvelle activité camp</title>
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
            <div class="card shadow">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">${not empty activite.id ? 'Modifier' : 'Créer'} une activité camp</h5>
                </div>
                <div class="card-body">
                    <c:url var="formAction" value="${pageContext.request.contextPath}/camp/${camp.id}/activites" />
                    <c:if test="${not empty activite.id}">
                        <c:url var="formAction" value="${pageContext.request.contextPath}/camp/${camp.id}/activites/${activite.id}/edit" />
                    </c:if>
                    <form method="post" action="${formAction}">
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Antony</label>
                                <textarea name="antony" class="form-control" rows="3">${activite.antony}</textarea>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Quantité</label>
                                <input name="quantite" type="number" step="0.01" value="${activite.quantite}" class="form-control" id="quantite" />
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Prix unitaire (Ar)</label>
                                <input name="prixUnitaire" type="number" step="0.01" value="${activite.prixUnitaire}" class="form-control" id="prixUnitaire" />
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Montant (Ar)</label>
                                <input name="montant" type="number" step="0.01" value="${activite.montant}" class="form-control" id="montant" readonly />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Type mouvement</label>
                                <select name="typeMouvement" class="form-select">
                                    <option value="" ${empty activite.typeMouvement ? 'selected' : ''}>Choisir</option>
                                    <option value="entree" ${activite.typeMouvement == 'entree' ? 'selected' : ''}>Entrée</option>
                                    <option value="sortie" ${activite.typeMouvement == 'sortie' ? 'selected' : ''}>Sortie</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <a href="${pageContext.request.contextPath}/camp/${camp.id}/activites" class="btn btn-secondary">Retour</a>
                            <button type="submit" class="btn btn-success">${not empty activite.id ? 'Modifier' : 'Ajouter'}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    const quantite = document.getElementById('quantite');
    const prixUnitaire = document.getElementById('prixUnitaire');
    const montant = document.getElementById('montant');

    function calculerMontant() {
        const q = parseFloat(quantite.value) || 0;
        const p = parseFloat(prixUnitaire.value) || 0;
        montant.value = (q * p).toFixed(2);
    }

    if (quantite && prixUnitaire && montant) {
        quantite.addEventListener('input', calculerMontant);
        prixUnitaire.addEventListener('input', calculerMontant);
        calculerMontant();
    }
</script>

</body>

</html>
