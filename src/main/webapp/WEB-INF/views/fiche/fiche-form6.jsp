<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle - Form 6</title>
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
                <div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h1 class="h4 mb-4">Form 6 - Fifampidinihana tamin'ny Ray aman-dReny</h1>
            <form action="${formAction}" method="post">
                <input type="hidden" name="id" value="${fiche.id}">
                <input type="hidden" name="idMembre" value="${idMembre}">
                <div class="mb-3">
                    <label class="form-label">Daty</label>
                    <input type="date" class="form-control" name="daty" value="${fiche.daty}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Votoatin-draharaha</label>
                    <textarea class="form-control" name="votoatinDraharaha">${fiche.votoatinDraharaha}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Fanamarihana</label>
                    <textarea class="form-control" name="fanamarihana">${fiche.fanamarihana}</textarea>
                </div>
                <button type="submit" class="btn btn-success">${submitLabel}</button>
            </form>
        </div>
    </div>
</div>
<script src="/javascript/fiche-individuelle.js"></script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
