<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="UTF-8">

    <title>Nouvelle fiche technique</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
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
                    <h4 class="mb-0">Nouvelle fiche technique</h4>
                </div>

                <div class="card-body">

                    <form:form method="post" modelAttribute="ficheTechnique" action="${pageContext.request.contextPath}/fiche-technique">

                        <div class="mb-3">
                            <label class="form-label">Titre</label>
                            <form:input path="titre" cssClass="form-control" required="true" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Année</label>
                            <form:input path="annee" type="number" cssClass="form-control" required="true" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Numéro trimestre</label>
                            <form:select path="numeroTrimestre.id" cssClass="form-select" required="true">
                                <form:option value="">Choisir un trimestre</form:option>
                                <form:options items="${numeroTrimestres}" itemValue="id" itemLabel="numeroTrimestre" />
                            </form:select>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/fiche-technique" class="btn btn-secondary">Retour</a>
                            <button type="submit" class="btn btn-success">Créer</button>
                        </div>

                    </form:form>

                </div>

            </div>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
