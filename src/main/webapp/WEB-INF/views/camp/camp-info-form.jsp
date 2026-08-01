<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Informations du camp</title>
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
                    <h4 class="mb-0">Informations du camp</h4>
                </div>
                <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath}/camp/${camp.id}/info">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Sampana</label>
                                <input name="sampana" value="${campInfo.sampana}" class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Faritany</label>
                                <input name="faritany" value="${campInfo.faritany}" class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Faritra</label>
                                <input name="faritra" value="${campInfo.faritra}" class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Fivondronana</label>
                                <input name="fivondronana" value="${campInfo.fivondronana}" class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Andiany</label>
                                <input name="andiany" value="${campInfo.andiany}" class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Isa mpilasy</label>
                                <input name="isaMpilasy" type="number" value="${campInfo.isaMpilasy}" class="form-control" />
                            </div>
                            <div class="col-12">
                                <label class="form-label">Tarigetra</label>
                                <textarea name="tarigetra" rows="3" class="form-control">${campInfo.tarigetra}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Tenin'Andriamanitra</label>
                                <textarea name="teninAndriamanitra" rows="3" class="form-control">${campInfo.teninAndriamanitra}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Objectif</label>
                                <textarea name="objectif" rows="3" class="form-control">${campInfo.objectif}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Fandraharahana</label>
                                <textarea name="fandraharahana" rows="3" class="form-control">${campInfo.fandraharahana}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Fitaovana</label>
                                <textarea name="fitaovana" rows="3" class="form-control">${campInfo.fitaovana}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Ara-panahy</label>
                                <textarea name="araPanahy" rows="3" class="form-control">${campInfo.araPanahy}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Fientanana</label>
                                <textarea name="fientanana" rows="3" class="form-control">${campInfo.fientanana}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Fahasalamana</label>
                                <textarea name="fahasalamana" rows="3" class="form-control">${campInfo.fahasalamana}</textarea>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Toerana hiaingana</label>
                                <input name="toeranaHiaingana" value="${campInfo.toeranaHiaingana}" class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Toerana hiverenana</label>
                                <input name="toeranaHiverenana" value="${campInfo.toeranaHiverenana}" class="form-control" />
                            </div>
                        </div>

                        <div class="d-flex justify-content-between mt-4">
                            <a href="${pageContext.request.contextPath}/camp/${camp.id}" class="btn btn-secondary">Retour</a>
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
