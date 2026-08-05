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
                Membres du Tarika
            </h2>


            <p class="text-muted">

                ${tarika.nom}

            </p>


        </div>


        <div class="d-flex gap-2">
            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">Retour</button>
            <a href="${pageContext.request.contextPath}/tarika" class="btn btn-outline-primary">Liste Tarika</a>
            <a href="${pageContext.request.contextPath}/" class="btn btn-outline-dark">Dashboard</a>
            <a href="${pageContext.request.contextPath}/membre-tarika/${tarika.id}/nouveau" class="btn btn-success">Ajouter un membre</a>
        </div>



    </div>





    <div class="card shadow">


        <div class="card-body">

            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">
                    ${successMessage}
                </div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    ${errorMessage}
                </div>
            </c:if>




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

                                <div class="d-flex justify-content-center gap-2">
                                    <a href="${pageContext.request.contextPath}/membre-tarika/${mt.membreTarikaId}/changer"
                                       class="btn btn-outline-primary btn-sm">
                                        Changement Tarika
                                    </a>
                                </div>

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

            </div>
        </div>
    </div>
</div>

</body>


</html>