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

            <!-- Modal: Changement Tarika -->
            <div class="modal fade" id="changerModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form method="post" action="${pageContext.request.contextPath}/membre-tarika/changer">
                            <div class="modal-header">
                                <h5 class="modal-title">Changement Tarika</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-center">
                                <input type="hidden" name="membreTarikaId" id="mtId">

                                <img id="modalImage" src="" class="rounded-circle mb-3" style="width:90px;height:90px;object-fit:cover;display:block;margin:0 auto;border:3px solid #d6eadc;">

                                <h5 id="modalNom" class="mb-1 text-success">Nom</h5>
                                <p id="modalRef" class="text-muted mb-3">Réf : --</p>

                                <div class="mb-3 text-start">
                                    <label class="form-label">Tarika</label>
                                    <select name="idTarika" id="selectTarika" class="form-select" required>
                                        <option value="">Choisir une tarika</option>
                                        <c:forEach items="${tarikas}" var="t">
                                            <option value="${t.id}">${t.nom}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3 text-start">
                                    <label class="form-label">Rôle</label>
                                    <select name="idRoleTarika" id="selectRole" class="form-select" required>
                                        <option value="">Choisir un rôle</option>
                                        <c:forEach items="${roles}" var="r">
                                            <option value="${r.id}">${r.role}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                <button type="submit" class="btn btn-primary">Confirmer</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function(){
                    const modalEl = document.getElementById('changerModal');
                    const modal = new bootstrap.Modal(modalEl);
                    const mtIdInput = document.getElementById('mtId');
                    const modalImage = document.getElementById('modalImage');
                    const modalNom = document.getElementById('modalNom');
                    const modalRef = document.getElementById('modalRef');
                    const selectTarika = document.getElementById('selectTarika');
                    const selectRole = document.getElementById('selectRole');

                    document.querySelectorAll('.changer-btn').forEach(btn => {
                        btn.addEventListener('click', () => {
                            const mtId = btn.getAttribute('data-mt-id');
                            const nom = btn.getAttribute('data-nom');
                            const reference = btn.getAttribute('data-reference');
                            const image = btn.getAttribute('data-image');
                            const currentTarika = btn.getAttribute('data-current-tarika');
                            const role = btn.getAttribute('data-role');

                            mtIdInput.value = mtId;
                            modalNom.textContent = nom || 'Nom';
                            modalRef.textContent = 'Réf : ' + (reference || '--');
                            if(image && image !== 'profile-female.png'){
                                modalImage.src = '${pageContext.request.contextPath}/images/' + image;
                                modalImage.style.display = 'block';
                            } else {
                                modalImage.src = '${pageContext.request.contextPath}/images/profile-female.png';
                                modalImage.style.display = 'block';
                            }

                            if(currentTarika){
                                selectTarika.value = currentTarika;
                            } else {
                                selectTarika.selectedIndex = 0;
                            }

                            // select role if matches
                            if(role){
                                Array.from(selectRole.options).forEach(o => {
                                    if(o.text === role) o.selected = true;
                                });
                            }

                            modal.show();
                        });
                    });
                });
            </script>



        <div class="d-flex gap-2">
            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">Retour</button>
            <a href="${pageContext.request.contextPath}/tarika" class="btn btn-outline-primary">Liste Tarika</a>
            <a href="${pageContext.request.contextPath}/" class="btn btn-outline-dark">Dashboard</a>
            <a href="${pageContext.request.contextPath}/membre-tarika/${tarika.id}/nouveau" class="btn btn-success">Ajouter un membre</a>
        </div>



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

                                <div class="d-flex justify-content-center gap-2">
                                    <button type="button"
                                            class="btn btn-outline-primary btn-sm changer-btn"
                                            data-mt-id="${mt.membreTarikaId}"
                                            data-membre-id="${mt.membreId}"
                                            data-nom="${mt.nomPrenom}"
                                            data-reference="${mt.reference}"
                                            data-image="${mt.image}"
                                            data-role="${mt.role}"
                                            data-current-tarika="${mt.tarikaId}">
                                        Changement Tarika
                                    </button>
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


</body>


</html>