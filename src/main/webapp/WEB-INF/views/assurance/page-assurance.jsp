<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Gestion Assurance</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

<style>

body {
    background-color: #f1fdf6;
}

.card-dashboard {
    border-radius: 12px;
    border: 1px solid #e9ecef;
    box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

.header-page {
    background-color: #0f5132;
    color: white;
    padding: 20px 30px;
    border-radius: 10px;
}

.table thead th {
    background-color: #198754;
    color: white;
}

</style>

</head>


<body>


<div class="container-fluid">


<div class="row">


<div class="col-auto px-0">

    <jsp:include page="../dashboard/navbar.jsp"/>

</div>



<div class="col p-4">



<div class="header-page mb-4">


<div class="d-flex justify-content-between align-items-center">


<div>

<h2 class="mb-1">
Gestion Assurance
</h2>

<small>
Suivi des assurances des membres
</small>

</div>



<div>

<a href="${pageContext.request.contextPath}/assurance/nouveau"
   class="btn btn-light">

Nouvelle assurance

</a>

</div>


</div>


</div>






<div class="card card-dashboard">


<div class="card-body">



<table class="table table-bordered table-hover align-middle">


<thead>


<tr>

<th>
Date
</th>


<th>
Référence membre
</th>


<th>
Membre
</th>


<th>
Type assurance
</th>


<th>
Montant
</th>


<th width="150">
Action
</th>


</tr>


</thead>




<tbody>



<c:forEach items="${assurances}" var="assurance">


<tr>


<td>

${assurance.date}

</td>



<td>

${assurance.membre.reference}

</td>




<td>

${assurance.membre.nomPrenom}

</td>




<td>

${assurance.typeAssurance.libelle}

</td>




<td>

${assurance.montant} Ar

</td>





<td>


<a href="${pageContext.request.contextPath}/assurance/${assurance.id}"
   class="btn btn-primary btn-sm">

Voir

</a>



<a href="${pageContext.request.contextPath}/assurance/supprimer/${assurance.id}"
   class="btn btn-danger btn-sm"
   onclick="return confirm('Supprimer cette assurance ?');">

Supprimer

</a>



</td>



</tr>



</c:forEach>







<c:if test="${empty assurances}">


<tr>


<td colspan="6"
    class="text-center text-muted">


Aucune assurance enregistrée.


</td>


</tr>


</c:if>




</tbody>


</table>



</div>


</div>




</div>


</div>


</div>




<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>


</html>