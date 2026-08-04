<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Grades du membre</title>
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
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2>Grades de ${membre.nomPrenom}</h2>
                    <p class="text-muted">Historique des grades attribués à ce membre.</p>
                </div>
                <a href="${pageContext.request.contextPath}/membres/${membre.id}/grades/nouveau" class="btn btn-success">Ajouter un grade</a>
            </div>

            <c:if test="${empty gradesMembre}">
                <div class="alert alert-warning">Aucun grade attribué pour le moment.</div>
            </c:if>

            <div class="row g-4">
                <c:forEach items="${gradesMembre}" var="assignation">
                    <div class="col-md-4">
                        <div class="card h-100 shadow-sm">
                            <c:if test="${not empty assignation.grade.imageName}">
                                <img src="${pageContext.request.contextPath}/images/grade/${assignation.grade.imageName}" class="card-img-top" alt="${assignation.grade.grade}" style="height:220px;object-fit:cover;">
                            </c:if>
                            <div class="card-body">
                                <h5 class="card-title">${assignation.grade.grade}</h5>
                                <p class="mb-0"><strong>Date :</strong> ${assignation.date}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
