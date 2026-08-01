<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Ajouter information fiche technique</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
</head>

<body>

<div class="container-fluid">

    <div class="row">

        <div class="col-auto px-0">

            <jsp:include page="../dashboard/navbar.jsp"/>

        </div>

        <div class="col p-4">

            <div class="card shadow">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">Informations fiche technique</h5>
                </div>
                <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath}/fiche-technique/${ficheId}/info">
                        <div class="mb-3">
                            <label class="form-label">Faritra</label>
                            <input name="faritra" class="form-control" required />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tarigetra</label>
                            <textarea name="tarigetra" class="form-control" rows="3"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Filoha</label>
                            <input name="filoha" class="form-control" />
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/fiche-technique/${ficheId}" class="btn btn-secondary">Retour</a>
                            <button type="submit" class="btn btn-success">Enregistrer</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
