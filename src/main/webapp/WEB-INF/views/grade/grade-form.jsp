<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Nouvel grade</title>
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
    <h2>Ajouter un grade</h2>

    <form id="gradeForm" action="${pageContext.request.contextPath}/grade/save" method="post" enctype="multipart/form-data">
        <div id="formStatus" class="mb-3"></div>
        <div class="mb-3">
            <label for="grade" class="form-label">Grade</label>
            <input type="text" id="grade" name="grade" class="form-control" value="${grade.grade}" required />
        </div>
        <div class="mb-3">
            <label for="imageFile" class="form-label">Fichier image</label>
            <input type="file" id="imageFile" name="imageFile" class="form-control" accept="image/*" required />
        </div>
        <button id="submitButton" type="submit" class="btn btn-success">Enregistrer</button>
        <a href="${pageContext.request.contextPath}/grade" class="btn btn-secondary">Annuler</a>
    </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('gradeForm').addEventListener('submit', function (event) {
        const submitButton = document.getElementById('submitButton');
        const formStatus = document.getElementById('formStatus');
        submitButton.disabled = true;
        submitButton.textContent = 'Enregistrement...';
        formStatus.innerHTML = '<div class="alert alert-info">Chargement en cours...</div>';
    });
</script>
</body>
</html>
