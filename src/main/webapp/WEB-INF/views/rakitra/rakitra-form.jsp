<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="UTF-8">

    <title>Nouveau Rakitra</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

</head>


<body class="bg-light">


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


</body>

</html>