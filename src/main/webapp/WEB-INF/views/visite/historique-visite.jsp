<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Historique des visites</title>

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
                <jsp:include page="../dashboard/navbar.jsp" />
            </div>
        </div>
        <div class="col p-3 p-lg-4">
            <div class="page-shell p-4 p-lg-5">
                <div class="container py-4">

    <div class="d-flex justify-content-between mb-4">

        <h2>

            Historique des visites

        </h2>

        <a
        href="${pageContext.request.contextPath}/visite/visite-parent"
        class="btn btn-secondary">

            Retour

        </a>

    </div>

    <form
    method="get"
    action="${pageContext.request.contextPath}/visite/historique"
    class="row g-3 mb-4">

        <div class="col-md-4">

            <label>

                Référence

            </label>

            <input
            type="text"
            class="form-control"
            name="reference"
            value="${reference}">

        </div>

        <div class="col-md-3">

            <label>

                Date minimum

            </label>

            <input
            type="date"
            class="form-control"
            name="dateMin"
            value="${dateMin}">

        </div>

        <div class="col-md-3">

            <label>

                Date maximum

            </label>

            <input
            type="date"
            class="form-control"
            name="dateMax"
            value="${dateMax}">

        </div>

        <div class="col-md-2 d-grid">

            <label>&nbsp;</label>

            <button
            class="btn btn-primary">

                Rechercher

            </button>

        </div>

    </form>


    <table class="table table-bordered table-hover bg-white">

        <thead class="table-success">

        <tr>

            <th>Référence</th>

            <th>Nom et prénom</th>

            <th>Date visite</th>

            <th>Statut</th>

            <th></th>

        </tr>

        </thead>

        <tbody>

        <c:forEach
        items="${historiques}"
        var="h">

            <tr>

                <td>

                    ${h.reference}

                </td>

                <td>

                    ${h.nomPrenom}

                </td>

                <td>

                    ${h.dateVisite}

                </td>

                <td>

                    <c:choose>

                        <c:when test="${h.statut=='En attente'}">

                            <span class="badge bg-warning text-dark">

                                En attente

                            </span>

                        </c:when>

                        <c:otherwise>

                            <span class="badge bg-success">

                                Terminée

                            </span>

                        </c:otherwise>

                    </c:choose>

                </td>

                <td>

                    <a
                    href="${pageContext.request.contextPath}/membres/${h.idMembre}/fiche"
                    class="btn btn-success btn-sm">

                        Voir fiche

                    </a>

                </td>

            </tr>

        </c:forEach>

        </tbody>

    </table>

</div>
            </div>
        </div>
    </div>
</div>
</body>

</html>