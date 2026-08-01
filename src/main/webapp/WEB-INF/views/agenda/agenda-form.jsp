<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Nouvelle activité agenda</title>
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
                    <h5 class="mb-0">Nouvelle activité agenda</h5>
                </div>
                <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath}/agenda">
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Titre</label>
                                <input name="titre" type="text" class="form-control" value="${agenda.titre}" required />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Date utilisation</label>
                                <input name="dateUtilisation" type="date" class="form-control" value="${agenda.dateUtilisation}" required />
                            </div>
                            <div class="col-12">
                                <label class="form-label">Contenu</label>
                                <textarea name="contenu" class="form-control" rows="5">${agenda.contenu}</textarea>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <a href="${pageContext.request.contextPath}/agenda" class="btn btn-secondary">Retour</a>
                            <button type="submit" class="btn btn-success">Créer</button>
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
