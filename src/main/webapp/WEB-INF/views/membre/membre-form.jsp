<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouvel membre</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        body {
            min-height: 100vh;
        }

        .page-shell {
            background: rgba(255, 255, 255, 0.94);
            border-radius: 1.25rem;
            box-shadow: 0 1rem 2rem rgba(15, 81, 50, 0.12);
            backdrop-filter: blur(6px);
        }
    </style>
</head>
<body>
<div class="container-fluid px-0">
    <div class="row g-0">
        <div class="col-auto px-0">
            <div class="position-sticky top-0" style="height:100vh;">
                <jsp:include page="../dashboard/navbar.jsp" />
            </div>
        </div>
        <div class="col p-3 p-lg-4">
            <div class="page-shell p-4 p-lg-5">
                <h1 class="h4 mb-4 text-success">Créer un nouveau membre</h1>
                <form action="${pageContext.request.contextPath}/membres" method="post">
                    <div class="mb-3">
                        <label for="nomPrenom" class="form-label">Nom et prénoms</label>
                        <input type="text" class="form-control" id="nomPrenom" name="nomPrenom" required>
                    </div>
                    <button type="submit" class="btn btn-success">Créer</button>
                    <a href="${pageContext.request.contextPath}/membres" class="btn btn-secondary ms-2">Annuler</a>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
