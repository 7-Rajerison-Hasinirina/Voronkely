<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Présence des membres</title>

    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">


    <style>

        body {
            background-color:#f1fdf6;
        }

        .presence-header {
            background-color:#0f5132;
        }


        .avatar-placeholder {
            width:90px;
            height:90px;
            background:linear-gradient(135deg,#198754,#0f5132);
            color:white;
            font-size:2rem;
            font-weight:700;
        }


        .member-photo {
            width:90px;
            height:90px;
            object-fit:cover;
            border:3px solid #d6eadc;
        }


        .presence-check {
            width:1.4rem;
            height:1.4rem;
            cursor:pointer;
        }


    </style>

</head>


<body>


<div class="container py-5">


    <!-- HEADER -->

    <div class="bg-success text-white rounded-4 shadow p-4 mb-5"
         style="background-color:#0f5132!important;">


        <div class="d-flex flex-column flex-md-row 
                    justify-content-between 
                    align-items-md-center">


            <div>

                <h1 class="h3 mb-2">
                    Présence des membres
                </h1>

                <p class="mb-0 text-white-50">
                    Enregistrement de la présence du jour
                </p>

            </div>



            <div class="mt-3 mt-md-0 text-md-end">

                <small class="text-white-50">
                    Date
                </small>

                <div class="fs-5 fw-bold">
                    ${date}
                </div>

            </div>


        </div>


    </div>




    <form id="presence-form"
          method="post"
          action="/presence/save">


        <input type="hidden"
               name="datePresence"
               value="${date}">


        <div id="presence-data"></div>



        <div class="row g-4">


            <c:forEach items="${membres}" var="membre">


                <div class="col-12 col-md-6 col-lg-4">


                    <div class="card shadow-sm border-0 rounded-4 h-100">


                        <div class="card-body text-center p-4">


                            <!-- PHOTO -->

                            <c:choose>


                                <c:when test="${not empty images[membre.id]}">

                                    <img src="${pageContext.request.contextPath}/images/${images[membre.id]}"
                                         alt="${membre.nomPrenom}"
                                         class="member-photo rounded-circle mb-3 shadow-sm">


                                </c:when>


                                <c:otherwise>

                                    <div class="avatar-placeholder 
                                                rounded-circle 
                                                d-flex 
                                                align-items-center 
                                                justify-content-center 
                                                mx-auto 
                                                mb-3 
                                                shadow-sm">

                                        ${fn:substring(membre.nomPrenom,0,1)}

                                    </div>

                                </c:otherwise>


                            </c:choose>




                            <h5 class="fw-bold mb-2">

                                ${membre.nomPrenom}

                            </h5>



                            <p class="text-muted mb-4">

                                Référence :
                                <strong>${membre.reference}</strong>

                            </p>




                            <div class="bg-light rounded-3 p-3">


                                <label class="d-flex 
                                              justify-content-center 
                                              align-items-center 
                                              gap-3 
                                              mb-0">


                                    <span class="fw-semibold">
                                        Présent
                                    </span>


                                    <input type="checkbox"
                                           class="form-check-input presence-check"
                                           data-id="${membre.id}">


                                </label>
                                <a href="/presence/detail/${membre.id}"
                                    class="btn btn-outline-success btn-sm mt-3">

                                        Voir présence

                                </a>


                            </div>



                        </div>


                    </div>


                </div>


            </c:forEach>


        </div>




    <div class="text-center mt-5 d-flex justify-content-center gap-3">


        <a href="/" 
        class="btn btn-secondary btn-lg px-5 shadow">
            Retour vers dashboard
        </a>

        <a href="${pageContext.request.contextPath}/presence/gestion-absence"
        class="btn btn-warning btn-lg px-5 shadow">
            Gestion des absences
        </a>


        <button type="submit"
                class="btn btn-primary btn-lg px-5 shadow">
            Enregistrer la présence
        </button>


    </div>
    </form>


</div>



<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/javascript/presence.js"></script>


</body>

</html>