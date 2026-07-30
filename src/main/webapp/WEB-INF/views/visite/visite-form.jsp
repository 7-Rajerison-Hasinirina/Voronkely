<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="fr">
<head>

    <meta charset="UTF-8">

    <title>Nouvelle visite</title>

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

    </style>

</head>

<body class="bg-light">

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-lg-9">

            <div class="card shadow">

                <div class="card-header bg-success text-white">

                    <h4 class="mb-0">
                        Nouvelle visite de parents
                    </h4>

                </div>

                <div class="card-body">

                    <form:form method="post"
                               action="${pageContext.request.contextPath}/visite"
                               modelAttribute="visite">

                        <div class="row">

                            <!-- Formulaire -->

                            <div class="col-md-6">

                                <!-- id membre -->

                                <form:hidden
                                        path="idMembre"
                                        id="idMembre"/>

                                <!-- référence -->

                                <div class="mb-3">

                                    <label class="form-label">

                                        Référence

                                    </label>

                                    <input
                                            id="reference"
                                            type="text"
                                            class="form-control"
                                            placeholder="Ex : M000125"
                                            autocomplete="off">

                                    <div class="form-text">

                                        Saisissez la référence du membre.

                                    </div>

                                </div>

                                <!-- date -->

                                <div class="mb-3">

                                    <label class="form-label">

                                        Date de visite

                                    </label>

                                    <form:input
                                            path="dateVisite"
                                            type="date"
                                            cssClass="form-control"/>

                                </div>

                                <!-- statut -->

                                <div class="mb-4">

                                    <label class="form-label">

                                        Statut

                                    </label>

                                    <form:select
                                            path="statut"
                                            cssClass="form-select">

                                        <form:option value="En attente">
                                            En attente
                                        </form:option>

                                        <form:option value="Termine">
                                            Termine
                                        </form:option>

                                    </form:select>

                                </div>

                            </div>


                            <!-- Aperçu du membre -->

                            <div class="col-md-6">

                                <div
                                        class="preview-card d-flex flex-column justify-content-center align-items-center text-center p-4">

                                    <img
                                            id="photo"
                                            class="preview-image mb-3"
                                            style="display:none;">

                                    <h5 id="nomPrenom"
                                        class="mb-1 text-success">

                                        Aucun membre

                                    </h5>

                                    <p id="referenceAffiche"
                                       class="text-muted mb-0">

                                        --

                                    </p>

                                </div>

                            </div>

                        </div>

                        <hr>

                        <div class="d-flex justify-content-end">

                            <a href="${pageContext.request.contextPath}/visite/visite-parent"
                               class="btn btn-secondary me-2">

                                Annuler

                            </a>

                            <button
                                    id="btnCreer"
                                    class="btn btn-success"
                                    disabled>

                                Créer

                            </button>

                        </div>

                    </form:form>

                </div>

            </div>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/javascript/visite-form.js"></script>

</body>
</html>