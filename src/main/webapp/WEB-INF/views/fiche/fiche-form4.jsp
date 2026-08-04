<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle - Form 4</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h1 class="h4 mb-4">Form 4 - Mikasika ny fianarana</h1>
            <form action="${formAction}" method="post" data-repeatable>
                <input type="hidden" name="id" value="${fiche.id}">
                <input type="hidden" name="idMembre" value="${idMembre}">
                <div data-repeatable-rows>
                    <div class="row g-3 align-items-end mb-3" data-repeatable-row>
                        <div class="col-md-2">
                            <label class="form-label">Taona</label>
                            <input type="number" class="form-control" name="taona" value="${fiche.taona}">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Sekoly</label>
                            <input type="text" class="form-control" name="sekoly" maxlength="50" value="${fiche.sekoly}">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Kilasy</label>
                            <input type="text" class="form-control" name="kilasy" maxlength="50" value="${fiche.kilasy}">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Taranja manavanana</label>
                            <textarea class="form-control" name="taranjaManavanana">${fiche.taranjaManavanana}</textarea>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Taranja manahirana</label>
                            <textarea class="form-control" name="taranjaManahirana">${fiche.taranjaManahirana}</textarea>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-outline-danger" data-remove-row>Supprimer</button>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between mt-4">
                    <button type="button" class="btn btn-outline-success" data-add-row>Ajouter</button>
                    <button type="submit" class="btn btn-success">${submitLabel}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/javascript/fiche-individuelle.js"></script>
</body>
</html>
