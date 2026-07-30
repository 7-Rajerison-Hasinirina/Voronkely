<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Nouvelle Assurance</title>


<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">


<style>

body{
    background:#f1fdf6;
}


.header-page{

    background:#0f5132;
    color:white;
    padding:20px;
    border-radius:10px;

}


.card-form{

    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,0.05);

}



.preview-card{

    min-height:220px;
    border:2px dashed #198754;
    border-radius:12px;
    background:#f8f9fa;

}



.preview-image{

    width:120px;
    height:120px;
    object-fit:cover;
    border-radius:50%;
    border:3px solid #198754;

}

</style>


</head>


<body>


<div class="container-fluid">


<div class="row">


<div class="col-auto px-0">

<jsp:include page="/WEB-INF/views/dashboard/navbar.jsp"/>

</div>



<div class="col p-4">



<div class="header-page mb-4">

<h2>
Nouvelle assurance
</h2>

</div>



<div class="card card-form">


<div class="card-body">



<form method="post"
action="${pageContext.request.contextPath}/assurance">



<div class="row">


<div class="col-md-6">


<input type="hidden"
       name="idMembre"
       id="idMembre">



<div class="mb-3">

<label class="form-label">
Référence membre
</label>


<input type="text"
       id="reference"
       class="form-control"
       placeholder="Entrer la référence membre">


</div>




<div class="mb-3">

<label class="form-label">
Type assurance
</label>


<select name="idTypeAssurance"
        class="form-select"
        required>


<option value="">
Choisir un type
</option>


<c:forEach items="${typesAssurance}" var="type">


<option value="${type.id}">

${type.libelle}

</option>


</c:forEach>


</select>


</div>




<div class="mb-3">

<label class="form-label">
Date
</label>


<input type="date"
       name="date"
       class="form-control"
       required>


</div>




<div class="mb-3">

<label class="form-label">
Montant
</label>


<input type="number"
       name="montant"
       class="form-control"
       required>


</div>


</div>





<div class="col-md-6">


<div class="preview-card 
d-flex flex-column 
justify-content-center 
align-items-center 
text-center p-4">



<img id="photo"
     class="preview-image mb-3"
     style="display:none;">



<h5 id="nomPrenom"
class="text-success">

Aucun membre

</h5>



<p id="referenceAffiche"
class="text-muted">

--

</p>



</div>



</div>


</div>





<hr>


<div class="d-flex justify-content-end">


<a href="${pageContext.request.contextPath}/assurance"
class="btn btn-secondary me-2">

Annuler

</a>



<button id="btnCreer"
class="btn btn-success"
disabled>

Enregistrer

</button>


</div>



</form>



</div>


</div>



</div>


</div>


</div>



<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


<script src="${pageContext.request.contextPath}/javascript/assurance-form.js"></script>


</body>

</html>