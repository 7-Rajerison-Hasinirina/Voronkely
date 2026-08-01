<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Ajouter information fiche technique</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
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
                            <input name="faritra" class="form-control" value="${info.faritra}" required />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tenin Andriamanitra</label>
                            <textarea name="teninAndriamanitra" class="form-control" rows="3">${info.teninAndriamanitra}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tarigetra</label>
                            <textarea name="tarigetra" class="form-control" rows="3">${info.tarigetra}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Toerana ivoriana</label>
                            <input name="toeranaIvoriana" class="form-control" value="${info.toeranaIvoriana}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Andro ivoriana</label>
                            <input name="androIvoriana" class="form-control" value="${info.androIvoriana}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ora ivoriana</label>
                            <input name="oraIvoriana" class="form-control" value="${info.oraIvoriana}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ny tonia</label>
                            <input name="nyTonia" class="form-control" value="${info.nyTonia}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Komitim pivondronana</label>
                            <input name="komitimPivondronana" class="form-control" value="${info.komitimPivondronana}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Filoha</label>
                            <input name="filoha" class="form-control" value="${info.filoha}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Daty iraisana</label>
                            <input name="datyIraisana" type="text" class="form-control" value="${info.datyIraisana}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Objectif</label>
                            <textarea name="objectif" class="form-control" rows="3">${info.objectif}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tompon andraikitra</label>
                            <input name="tomponAndraikitra" class="form-control" value="${info.tomponAndraikitra}" />
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
