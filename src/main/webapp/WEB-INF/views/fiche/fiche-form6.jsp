<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle - Form 6</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h1 class="h4 mb-4">Form 6 - Fifampidinihana tamin'ny Ray aman-dReny</h1>
            <form action="/fiche6" method="post">
                <input type="hidden" name="idMembre" value="${idMembre}">
                <div class="mb-3">
                    <label class="form-label">Daty</label>
                    <input type="date" class="form-control" name="daty">
                </div>
                <div class="mb-3">
                    <label class="form-label">Votoatin-draharaha</label>
                    <textarea class="form-control" name="votoatinDraharaha"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Fanamarihana</label>
                    <textarea class="form-control" name="fanamarihana"></textarea>
                </div>
                <button type="submit" class="btn btn-success">Terminé</button>
            </form>
        </div>
    </div>
</div>
<script src="/javascript/fiche-individuelle.js"></script>
</body>
</html>
