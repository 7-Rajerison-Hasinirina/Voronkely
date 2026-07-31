<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Gestion Adidy</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

</head>


<body class="bg-light">


<div class="container py-4">


<div class="d-flex justify-content-between align-items-center mb-4">


<div>

<h2>
Gestion Adidy
</h2>

<small class="text-muted">
Historique des Adidy
</small>

</div>



<a href="${pageContext.request.contextPath}/adidy/nouveau"
class="btn btn-success">

Nouvel Adidy

</a>


</div>





<div class="alert alert-success">


<div class="row">


<div class="col-md-6">

<strong>
Montant global restant
</strong>

</div>



<div class="col-md-6 text-end">

<h4>
${montantGlobal}
</h4>

</div>


</div>


</div>






<div class="card shadow">


<div class="card-body">


<table class="table table-bordered table-hover">


<thead class="table-success">


<tr>

<th>Date</th>

<th>Membre</th>

<th>Type Adidy</th>

<th>Montant</th>

<th>Restant</th>

<th>Etat</th>

<th>Action</th>


</tr>


</thead>




<tbody>


<c:forEach items="${adidys}" var="adidy">


<tr>


<td>

${adidy.dateAjout}

</td>



<td>

${adidy.membre.nomPrenom}


<br>

<small>
${adidy.membre.reference}
</small>

</td>




<td>

${adidy.typeAdidy.libelle}

</td>




<td>

${adidy.montant}

</td>



<td>

${adidy.montantRestant}

</td>



<td>


<c:choose>


<c:when test="${adidy.montantRestant > 0}">


<span class="badge bg-success">

Disponible

</span>


</c:when>



<c:otherwise>


<span class="badge bg-danger">

Epuisé

</span>


</c:otherwise>


</c:choose>


</td>





<td>


<a href="${pageContext.request.contextPath}/adidy/${adidy.id}"
class="btn btn-primary btn-sm">

Voir détail

</a>


</td>



</tr>



</c:forEach>




<c:if test="${empty adidys}">


<tr>

<td colspan="7"
class="text-center">

Aucun Adidy disponible.

</td>

</tr>


</c:if>



</tbody>



</table>


</div>


</div>


</div>


<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>