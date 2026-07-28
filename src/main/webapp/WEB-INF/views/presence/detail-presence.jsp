<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Détail présence</title>

<link rel="stylesheet"
      href="/bootstrap/css/bootstrap.min.css">

</head>


<body class="bg-light">


<div class="container py-5">


<!-- HEADER MEMBRE -->

<div class="card shadow-sm rounded-4 mb-4">

<div class="card-body">

<div class="d-flex align-items-center gap-4">


<c:choose>


<c:when test="${not empty fiche1.image}">

<img src="${pageContext.request.contextPath}/images/${fiche1.image}"
     alt="${membre.nomPrenom}"
     class="rounded-circle shadow-sm"
     style="width:100px;height:100px;object-fit:cover;border:3px solid #d6eadc;">

</c:when>


<c:otherwise>

<div class="bg-success text-white rounded-circle 
            d-flex align-items-center justify-content-center"
     style="width:100px;height:100px;font-size:40px">

${fn:substring(membre.nomPrenom,0,1)}

</div>

</c:otherwise>


</c:choose>



<div>

<h2 class="h4 mb-2">
${membre.nomPrenom}
</h2>


<p class="text-muted mb-0">

Référence :
<strong>${membre.reference}</strong>

</p>


</div>


</div>

</div>

</div>





<div class="row g-4">



<!-- STATISTIQUE -->

<div class="col-lg-6">


<div class="card shadow-sm rounded-4">


<div class="card-body">


<h5 class="mb-4">
Statistique de présence
</h5>



<!-- GRAPHE BOOTSTRAP -->

<c:forEach items="${moisLabels}" 
           var="mois"
           varStatus="i">


<div class="mb-3">


<div class="d-flex justify-content-between mb-1">


<span class="fw-semibold">

${mois}

</span>


<span>

${nombrePresence[i.index]}

</span>


</div>



<div class="progress"
     style="height:25px;">


<div class="progress-bar bg-success"
     role="progressbar"
     style="width:${nombrePresence[i.index] * 10}%">


${nombrePresence[i.index]} présence(s)


</div>


</div>


</div>


</c:forEach>



</div>


</div>


</div>






<!-- HISTORIQUE -->

<div class="col-lg-6">


<div class="card shadow-sm rounded-4">


<div class="card-body">


<h5 class="mb-4">
Historique présence
</h5>




<form class="row g-3 mb-4"
      method="get"
      action="${pageContext.request.contextPath}/presence/detail/${membre.id}">


<div class="col-md-5">

<label class="form-label">
Date début
</label>

<input type="date"
       class="form-control"
       name="dateMin"
       value="${dateMin}">

</div>



<div class="col-md-5">

<label class="form-label">
Date fin
</label>

<input type="date"
       class="form-control"
       name="dateMax"
       value="${dateMax}">

</div>



<div class="col-md-2 d-flex align-items-end">

<button type="submit"
        class="btn btn-success w-100">

Filtrer

</button>

</div>


</form>





<table class="table table-hover align-middle">


<thead class="table-success">


<tr>

<th>
Date
</th>


<th>
Statut
</th>


</tr>


</thead>



<tbody>



<c:forEach items="${presences}"
           var="presence">



<tr>


<td>

${presence.datePresence}

</td>



<td>



<c:choose>



<c:when test="${presence.present}">


<span class="badge bg-success">

Présent

</span>


</c:when>



<c:otherwise>


<span class="badge bg-danger">

Absent

</span>


</c:otherwise>



</c:choose>



</td>


</tr>



</c:forEach>



</tbody>


</table>



</div>


</div>


</div>



</div>


</div>



</body>

</html>