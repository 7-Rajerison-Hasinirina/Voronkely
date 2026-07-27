<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouvel membre</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h1 class="h4 mb-4">Créer un nouveau membre</h1>
            <form action="/membres" method="post">
                <div class="mb-3">
                    <label for="nomPrenom" class="form-label">Nom et prénoms</label>
                    <input type="text" class="form-control" id="nomPrenom" name="nomPrenom" required>
                </div>
                <button type="submit" class="btn btn-success">Créer</button>
                <a href="/membres" class="btn btn-secondary ms-2">Annuler</a>
            </form>
        </div>
    </div>
</div>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
