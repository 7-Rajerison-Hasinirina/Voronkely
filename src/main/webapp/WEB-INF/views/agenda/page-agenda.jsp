<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Gestion Agenda</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        .agenda-card {
            transition: transform 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .agenda-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.08);
        }

        .agenda-card.near3 {
            border: 2px solid #fd7e14;
            background-color: rgba(253, 126, 20, 0.08);
        }

        .agenda-card.near1 {
            border: 2px solid #dc3545;
            background-color: rgba(220, 53, 69, 0.08);
        }
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-auto px-0">
            <jsp:include page="../dashboard/navbar.jsp" />
        </div>
        <div class="col p-4">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <div>
                    <h2>Gestion Agenda</h2>
                    <small class="text-muted">Liste des activités</small>
                </div>
                <div class="d-flex gap-2 flex-wrap">
                    <a href="${pageContext.request.contextPath}/agenda/nouveau" class="btn btn-success">Nouvelle activité</a>
                    <a href="${pageContext.request.contextPath}/agenda" class="btn btn-outline-secondary">Rafraîchir</a>
                    <a href="${pageContext.request.contextPath}/agenda/export/pdf?dateMin=${dateMin}&dateMax=${dateMax}" class="btn btn-outline-primary">Export PDF</a>
                </div>
            </div>

            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <form method="get" action="${pageContext.request.contextPath}/agenda">
                        <div class="row g-3 align-items-end">
                            <div class="col-md-4">
                                <label class="form-label">Date min</label>
                                <input type="date" name="dateMin" class="form-control" value="${dateMin}" />
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Date max</label>
                                <input type="date" name="dateMax" class="form-control" value="${dateMax}" />
                            </div>
                            <div class="col-md-4 d-grid">
                                <button type="submit" class="btn btn-primary">Filtrer</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <c:if test="${not empty agendas}">
                <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">
                    <c:forEach items="${agendas}" var="agenda">
                        <div class="col">
                            <div class="card h-100 agenda-card" data-date="${agenda.dateUtilisation}">
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title">${agenda.titre}</h5>
                                    <p class="card-text text-truncate">${agenda.contenu}</p>
                                    <div class="mt-auto">
                                        <p class="mb-1 text-muted">Date utilisation: ${agenda.dateUtilisation}</p>
                                        <p class="mb-0 text-muted">Création: ${agenda.dateCreation}</p>
                                    </div>
                                </div>
                                <div class="card-footer bg-white border-top-0 d-flex justify-content-between align-items-center">
                                    <a href="${pageContext.request.contextPath}/agenda/${agenda.id}/supprimer" class="btn btn-sm btn-outline-danger" onclick="return confirm('Supprimer cette activité ?');">Supprimer</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${empty agendas}">
                <div class="alert alert-info">Aucune activité dans l'agenda.</div>
            </c:if>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    const today = new Date('${today}');
    document.querySelectorAll('.agenda-card').forEach(card => {
        const dateValue = card.getAttribute('data-date');
        if (!dateValue) return;
        const targetDate = new Date(dateValue);
        const diffTime = targetDate.getTime() - today.getTime();
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        if (diffDays === 1) {
            card.classList.add('near1');
        } else if (diffDays <= 3 && diffDays > 1) {
            card.classList.add('near3');
        }
    });
</script>

</body>

</html>
