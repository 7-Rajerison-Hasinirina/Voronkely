<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="fr">


<head>

    <meta charset="UTF-8">

    <title>Mouvement Rakitra</title>


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



    <div class="d-flex justify-content-between align-items-center mb-4">


        <div>

            <h2>
                Mouvement Rakitra
            </h2>


            <small class="text-muted">

                Gestion des mouvements

            </small>


        </div>


        <a href="${pageContext.request.contextPath}/rakitra"
           class="btn btn-secondary">

            Retour

        </a>


    </div>






    <div class="card shadow mb-4">


        <div class="card-header bg-primary text-white">

            <h5 class="mb-0">
                Nouveau mouvement
            </h5>

        </div>



        <div class="card-body">



            <form method="post"
                  action="${pageContext.request.contextPath}/mouvement-rakitra">



                <input type="hidden"
                       name="idRakitra"
                       value="${rakitra.id}">





                <div class="mb-3">

                    <label class="form-label">

                        Montant actuel

                    </label>


                    <input type="number"
                           step="0.01"
                           id="montantActuel"
                           class="form-control"
                           value="${rakitra.montantRestant}"
                           readonly>

                </div>







                <div class="mb-3">


                    <label class="form-label">

                        Montant à déduire

                    </label>


                    <input type="number"
                           step="0.01"
                           min="0"
                           id="montantADeduire"
                           name="montantADeduire"
                           class="form-control"
                           required>


                    <div id="erreurMontant"
                         class="text-danger">

                    </div>


                </div>






                <div class="mb-3">


                    <label class="form-label">

                        Montant restant

                    </label>


                    <input type="number"
                           step="0.01"
                           id="nouveauMontant"
                           class="form-control"
                           readonly>


                </div>







                <div class="mb-3">


                    <label class="form-label">

                        Motif utilisation

                    </label>


                    <textarea name="motifUtilisation"
                              class="form-control"
                              rows="3"
                              required></textarea>


                </div>






                <div class="mb-3">


                    <label class="form-label">

                        Type mouvement

                    </label>


                    <select name="typeMouvement"
                            class="form-select">


                        <option value="SORTIE">
                            SORTIE
                        </option>


                        <option value="ENTREE">
                            ENTREE
                        </option>


                    </select>


                </div>







                <button type="submit"
                        id="btnEnregistrer"
                        class="btn btn-primary">

                    Enregistrer

                </button>



                <a href="${pageContext.request.contextPath}/rakitra"
                   class="btn btn-secondary">

                    Annuler

                </a>



            </form>


        </div>


    </div>








    <div class="card shadow">


        <div class="card-header bg-success text-white">


            <h5 class="mb-0">

                Historique mouvement

            </h5>


        </div>





        <div class="card-body">


            <table class="table table-bordered table-hover">


                <thead>


                <tr>

                    <th>
                        Date
                    </th>


                    <th>
                        Montant
                    </th>


                    <th>
                        Motif
                    </th>


                    <th>
                        Type
                    </th>


                </tr>


                </thead>





                <tbody>


                <c:forEach items="${mouvements}"
                           var="m">


                    <tr>


                        <td>
                            ${m.dateMouvement}
                        </td>


                        <td>
                            ${m.montantADeduire}
                        </td>


                        <td>
                            ${m.motifUtilisation}
                        </td>


                        <td>

                            <c:choose>


                                <c:when test="${m.typeMouvement == 'SORTIE'}">

                                    <span class="badge bg-danger">
                                        SORTIE
                                    </span>

                                </c:when>


                                <c:otherwise>

                                    <span class="badge bg-success">
                                        ENTREE
                                    </span>

                                </c:otherwise>


                            </c:choose>


                        </td>


                    </tr>


                </c:forEach>





                <c:if test="${empty mouvements}">


                    <tr>

                        <td colspan="4"
                            class="text-center">

                            Aucun mouvement enregistré.

                        </td>


                    </tr>


                </c:if>


                </tbody>


            </table>



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