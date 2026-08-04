<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Gestion des absences</title>

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
                <div class="container py-5">


<h3 class="mb-4">
Gestion des absences
</h3>



<div class="row g-4">



<c:forEach items="${membres}" var="membre">



<div class="col-lg-4 col-md-6">


<div class="card shadow-sm rounded-4">


<div class="card-body text-center">



<!-- IMAGE -->

<c:choose>


<c:when test="${not empty fiches[membre.id].image}">


<img src="${pageContext.request.contextPath}/images/${fiches[membre.id].image}"
     class="rounded-circle shadow-sm mb-3"
     style="width:100px;height:100px;object-fit:cover;">


</c:when>



<c:otherwise>


<div class="bg-success text-white rounded-circle mx-auto mb-3
            d-flex align-items-center justify-content-center"
     style="width:100px;height:100px;font-size:40px">


${fn:substring(membre.nomPrenom,0,1)}


</div>


</c:otherwise>


</c:choose>




<!-- INFORMATIONS MEMBRE -->


<h5 class="mb-2">

${membre.nomPrenom}

</h5>



<p class="text-muted mb-2">

Référence :

<strong>
${membre.reference}
</strong>

</p>



<span class="badge bg-warning mb-3">


${nombrePresence[membre.id]} présence(s)

le mois dernier


</span>





<!-- BOUTON FICHE -->

<div class="mb-3">



                        <a href="/membres/${membre.id}/fiche"
                        class="btn btn-outline-success btn-sm">
                            Fiche individuelle
                        </a>


</div>




<!-- FACEBOOK -->

<!-- FACEBOOK -->



</div>


</div>


</div>



</c:forEach>



</div>



</div>



</body>

</html>