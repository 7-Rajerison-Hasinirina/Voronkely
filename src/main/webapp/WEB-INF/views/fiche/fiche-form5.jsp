<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle - Form 5</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h1 class="h4 mb-4">Form 5 - Mikasika ny talenta</h1>
            <form action="/fiche5" method="post" data-repeatable>
                <input type="hidden" name="idMembre" value="${idMembre}">
                <div data-repeatable-rows>
                    <div class="row g-3 align-items-end mb-3" data-repeatable-row>
                        <div class="col-md-4">
                            <label class="form-label">Anarana</label>
                            <input type="text" class="form-control" name="anarana" maxlength="100">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Daty nanomezana</label>
                            <input type="date" class="form-control" name="datyNanomezana">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Talenta nomena</label>
                            <textarea class="form-control" name="talentaNomena"></textarea>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-outline-danger w-100" data-remove-row>Supprimer</button>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between mt-4">
                    <button type="button" class="btn btn-outline-success" data-add-row>Ajouter</button>
                    <button type="submit" class="btn btn-success">Suivant</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/javascript/fiche-individuelle.js"></script>
</body>
</html>
