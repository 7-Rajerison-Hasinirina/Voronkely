<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="UTF-8">

    <title>Nouveau Rakitra</title>

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


    <div class="card shadow">

        <div class="card-header bg-success text-white">

            <h4>
                Nouvel Rakitra
            </h4>

        </div>


        <div class="card-body">


            <form method="post"
                  action="${pageContext.request.contextPath}/rakitra">


                <div class="mb-3">

                    <label class="form-label">
                        Date
                    </label>


                    <input type="date"
                           name="dateAjout"
                           class="form-control"
                           value="${rakitra.dateAjout}"
                           required>

                </div>



                <div class="mb-3">

                    <label class="form-label">
                        Montant
                    </label>


                    <input type="number"
                           step="0.01"
                           id="montant"
                           name="montant"
                           class="form-control"
                           value="${rakitra.montant}"
                           required>

                </div>



                <div class="mb-3">

                    <label class="form-label">
                        Montant restant
                    </label>


                    <input type="number"
                           step="0.01"
                           id="montantRestant"
                           name="montantRestant"
                           class="form-control"
                           value="${rakitra.montantRestant}"
                           readonly>

                </div>



                <button type="submit"
                        class="btn btn-success">

                    Enregistrer

                </button>


                <a href="${pageContext.request.contextPath}/rakitra"
                   class="btn btn-secondary">

                    Retour

                </a>


            </form>


        </div>

    </div>


</div>



<script src="${pageContext.request.contextPath}/javascript/rakitra.js"></script>

            </div>
        </div>
    </div>
</div>

</body>

</html>