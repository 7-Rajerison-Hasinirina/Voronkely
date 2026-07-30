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

</head>

<body class="bg-light">

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

</body>

</html>