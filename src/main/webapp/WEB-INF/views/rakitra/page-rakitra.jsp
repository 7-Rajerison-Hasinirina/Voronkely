<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="UTF-8">

    <title>Gestion Rakitra</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        body { min-height: 100vh; }
        .page-shell {
            background: rgba(255,255,255,0.93);
            border-radius: 1.25rem;
            box-shadow: 0 1rem 2rem rgba(15,81,50,.12);
            backdrop-filter: blur(6px);
        }
    </style>

</head>

<body>

<div class="container-fluid px-0">
    <div class="row g-0">
        <div class="col-auto px-0">
            <div class="position-sticky top-0" style="height:100vh;">
                <jsp:include page="../dashboard/navbar.jsp"/>
            </div>
        </div>
        <div class="col p-3 p-lg-4">
            <div class="page-shell p-4 p-lg-5">
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div>
                        <h2 class="mb-1 text-success">Gestion Rakitra</h2>
                        <small class="text-muted">Historique des Rakitra</small>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/rakitra/nouveau" class="btn btn-success">Nouvel Rakitra</a>
                    </div>
                </div>

                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <form method="get" action="${pageContext.request.contextPath}/rakitra">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="form-label">Date minimum</label>
                                    <input type="date" name="dateMin" class="form-control" value="${dateMin}">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Date maximum</label>
                                    <input type="date" name="dateMax" class="form-control" value="${dateMax}">
                                </div>
                                <div class="col-md-4 d-grid">
                                    <label>&nbsp;</label>
                                    <button class="btn btn-primary">Rechercher</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="alert alert-success mb-4">
                    <div class="row">
                        <div class="col-md-6">
                            <strong>Montant global restant</strong>
                        </div>
                        <div class="col-md-6 text-end">
                            <h4 class="mb-0">${montantGlobal}</h4>
                        </div>
                    </div>
                </div>

                <div class="card shadow-sm">
                    <div class="card-body">
                        <table class="table table-bordered table-hover align-middle">
                            <thead class="table-success">
                            <tr>
                                <th>Date</th>
                                <th>Montant</th>
                                <th>Montant restant</th>
                                <th>Etat</th>
                                <th width="150">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${rakitras}" var="rakitra">
                                <tr>
                                    <td>${rakitra.dateAjout}</td>
                                    <td>${rakitra.montant}</td>
                                    <td>${rakitra.montantRestant}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${rakitra.montantRestant>0}">
                                                <span class="badge bg-success">Disponible</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Epuisé</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                        <td>

                            <a
                                    href="${pageContext.request.contextPath}/rakitra/${rakitra.id}"
                                    class="btn btn-primary btn-sm">

                                Voir détail

                            </a>

                        </td>

                    </tr>

                </c:forEach>

                <c:if test="${empty rakitras}">

                    <tr>

                        <td colspan="5"
                            class="text-center">

                            Aucun Rakitra disponible.

                        </td>

                    </tr>

                </c:if>

                </tbody>

            </table>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>