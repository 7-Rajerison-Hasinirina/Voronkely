<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Nouvelle activité fiche technique</title>
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
                    <h5 class="mb-0">Créer une activité fiche technique</h5>
                </div>
                <div class="card-body">
                    <c:url var="formAction" value="${pageContext.request.contextPath}/fiche-technique/${ficheId}/activites" />
                    <c:if test="${not empty activite.id}">
                        <c:url var="formAction" value="${pageContext.request.contextPath}/fiche-technique/${ficheId}/activites/${activite.id}/edit" />
                    </c:if>
                    <form method="post" action="${formAction}">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">Daty</label>
                                <input name="daty" type="date" value="${activite.daty}" class="form-control" />
                            </div>
                            <div class="col-md-8">
                                <label class="form-label">Lohahevitra</label>
                                <input name="lohahevitra" value="${activite.lohahevitra}" class="form-control" />
                            </div>
                            <div class="col-12">
                                <label class="form-label">Fomba fampitana</label>
                                <textarea name="fombaFampiasa" class="form-control" rows="3">${activite.fombaFampiasa}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Sahanasa</label>
                                <textarea name="sahanasa" class="form-control" rows="3">${activite.sahanasa}</textarea>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Tomponandraikitra</label>
                                <input name="tomponandraikitra" value="${activite.tomponandraikitra}" class="form-control" />
                            </div>
                            <div class="col-12">
                                <label class="form-label">Fanamarihana</label>
                                <textarea name="fanamarihana" class="form-control" rows="3">${activite.fanamarihana}</textarea>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <a href="${pageContext.request.contextPath}/fiche-technique/${ficheId}/activites" class="btn btn-secondary">Retour</a>
                            <button type="submit" class="btn btn-success">
                                <c:choose>
                                    <c:when test="${not empty activite.id}">Modifier</c:when>
                                    <c:otherwise>Ajouter</c:otherwise>
                                </c:choose>
                            </button>
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
