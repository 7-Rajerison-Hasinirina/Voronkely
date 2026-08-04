<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Changer Tarika</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
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
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2>Changer de Tarika</h2>
                            <p class="text-muted">Modifier le tarika et le rôle du membre sélectionné.</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/membre-tarika/${membreTarika.tarika.id}" class="btn btn-outline-secondary">Retour</a>
                    </div>

                    <div class="card shadow-sm">
                        <div class="card-body">
                            <form method="post" action="${pageContext.request.contextPath}/membre-tarika/changer">
                                <input type="hidden" name="membreTarikaId" value="${membreTarika.id}">

                                <div class="mb-3">
                                    <label class="form-label">Membre</label>
                                    <input type="text" class="form-control" value="${membreTarika.membre.nomPrenom}" disabled>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Tarika</label>
                                    <select name="idTarika" class="form-select" required>
                                        <option value="">Choisir une tarika</option>
                                        <c:forEach items="${tarikas}" var="t">
                                            <option value="${t.id}" ${membreTarika.tarika != null && membreTarika.tarika.id == t.id ? 'selected' : ''}>${t.nom}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Rôle</label>
                                    <select name="idRoleTarika" class="form-select" required>
                                        <option value="">Choisir un rôle</option>
                                        <c:forEach items="${roles}" var="r">
                                            <option value="${r.id}" ${membreTarika.roleTarika != null && membreTarika.roleTarika.id == r.id ? 'selected' : ''}>${r.role}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">Confirmer</button>
                                    <a href="${pageContext.request.contextPath}/membre-tarika/${membreTarika.tarika.id}" class="btn btn-secondary">Annuler</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
