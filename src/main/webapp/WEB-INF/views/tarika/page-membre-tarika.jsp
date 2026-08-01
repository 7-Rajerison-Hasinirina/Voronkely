<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="fr">


<head>

<meta charset="UTF-8">

<title>Membre Tarika</title>


<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">


</head>



<body class="bg-light">


<div class="container py-4">



    <div class="d-flex justify-content-between align-items-center mb-4">


        <div>

            <h2>
                Membres du Tarika
            </h2>


            <p class="text-muted">

                ${tarika.nom}

            </p>


        </div>



        <a
        href="${pageContext.request.contextPath}/membre-tarika/${tarika.id}/nouveau"
        class="btn btn-success">


            Ajouter un membre


        </a>



    </div>





    <div class="card shadow">


        <div class="card-body">



            <div class="row g-4">

                <c:forEach items="${membresTarikaDto}" var="mt">

                    <div class="col-12 col-md-6 col-lg-4">

                        <div class="card h-100 shadow-sm">

                            <div class="card-body text-center">

                                <c:choose>
                                    <c:when test="${not empty mt.image}">
                                        <img src="${pageContext.request.contextPath}/images/${mt.image}"
                                             alt="${mt.nomPrenom}"
                                             class="rounded-circle mx-auto d-block mb-3 shadow-sm"
                                             style="width:90px; height:90px; object-fit:cover; border:3px solid #d6eadc;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="rounded-circle avatar-placeholder d-flex align-items-center justify-content-center mx-auto mb-3"
                                             style="width:90px;height:90px;background:linear-gradient(135deg,#198754 0%,#0f5132 100%);color:#fff;font-size:2rem;font-weight:700;">
                                            ${fn:substring(mt.nomPrenom,0,1)}
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <h5 class="card-title mb-1">${mt.nomPrenom}</h5>

                                <p class="text-muted mb-1">Réf : <strong>${mt.reference}</strong></p>

                                <p class="text-success mb-2">${mt.role}</p>

                            </div>

                        </div>

                    </div>

                </c:forEach>


            </div>


            <c:if test="${empty membresTarikaDto}">

                <div class="alert alert-warning text-center">

                    Aucun membre dans ce Tarika.

                </div>

            </c:if>



        </div>


    </div>



</div>



<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>


</html>