<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Ajouter membre Tarika</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">


<style>

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


.membre-row{

    border:1px solid #ddd;
    border-radius:10px;
    padding:15px;
    margin-bottom:15px;

}


</style>

</head>


<body class="bg-light">


<div class="container py-4">


<div class="card shadow">


<div class="card-header bg-success text-white">

<h4 class="mb-0">
Ajouter des membres au Tarika
</h4>

</div>

<div class="p-3">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">Retour</button>
            <a href="${pageContext.request.contextPath}/tarika" class="btn btn-outline-primary">Liste Tarika</a>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/membre-tarika/${idTarika}" class="btn btn-secondary">Retour au Tarika</a>
        </div>
    </div>
</div>



<div class="card-body">



<form method="post"
    action="${pageContext.request.contextPath}/membre-tarika/save">



<input type="hidden"
       name="idTarika"
       value="${idTarika}">





<div id="listeMembres">



<div class="membre-row">



<div class="row">



<div class="col-md-6">


<label class="form-label">

Référence membre

</label>


<input type="text"
       class="form-control reference"
       placeholder="Ex : REF0001"
       autocomplete="off">



<input type="hidden"
    name="idMembre"
    class="idMembre"
    disabled>



<div class="mt-3 preview-card d-flex flex-column justify-content-center align-items-center text-center p-3">


<img class="preview-image photo"
     style="display:none;">


<h5 class="nomPrenom text-success">

Aucun membre

</h5>


<p class="referenceAffiche text-muted">

--

</p>


</div>



</div>





<div class="col-md-6">


<label class="form-label">

Rôle Tarika

</label>


<select name="idRoleTarika"
    class="form-select"
    required
    disabled>


<option value="">
Choisir rôle
</option>


<c:forEach items="${roles}" var="role">


<option value="${role.id}">

${role.role}

</option>


</c:forEach>


</select>



</div>



</div>



</div>



</div>





<div class="d-flex justify-content-between mt-3">


<button type="button"
        id="ajouter"
        class="btn btn-primary">

Ajouter un autre membre

</button>



<div>


<a href="${pageContext.request.contextPath}/membre-tarika/${idTarika}"
   class="btn btn-secondary">

Annuler

</a>


                            <button id="btnEnregistrer" type="submit"
        			class="btn btn-success" disabled>

            Enregistrer

        </button>


</div>


</div>



</form>


</div>


</div>


</div>





<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


<script src="${pageContext.request.contextPath}/javascript/membre-tarika.js"></script>


</body>

</html>