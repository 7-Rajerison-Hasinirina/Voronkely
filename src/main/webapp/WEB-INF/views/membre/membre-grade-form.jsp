<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un grade</title>
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
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="h4 mb-3">Ajouter un grade à ${membre.nomPrenom}</h2>
                    <form method="post" action="${pageContext.request.contextPath}/membres/${membre.id}/grades">
                        <div class="mb-3">
                            <label class="form-label">Date</label>
                            <input type="date" name="date" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Grade</label>
                            <select name="idGrade" class="form-select" required>
                                <option value="">Choisir un grade</option>
                                <c:forEach items="${grades}" var="grade">
                                    <option value="${grade.id}">${grade.grade}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Enregistrer</button>
                        <a href="${pageContext.request.contextPath}/membres/${membre.id}/grades" class="btn btn-secondary ms-2">Annuler</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
