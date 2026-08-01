<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Nouveau Tarika</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

</head>

<body class="bg-light">

<div class="container py-4">

    <div class="card shadow">

        <div class="card-header bg-success text-white">

            <h4 class="mb-0">
                Nouveau Tarika
            </h4>

        </div>


        <div class="card-body">


            <form:form
                    method="post"
                    modelAttribute="tarika"
                    enctype="multipart/form-data"
                    action="${pageContext.request.contextPath}/tarika">


                <div class="mb-3">

                    <label class="form-label">
                        Nom du Tarika
                    </label>

                    <form:input
                            path="nom"
                            cssClass="form-control"
                            required="true"/>

                </div>



                <div class="mb-3">

                    <label class="form-label">
                        Image
                    </label>


                    <input
                            type="file"
                            name="imageFile"
                            class="form-control"
                            accept=".jpg,.jpeg,.png,.gif,.webp"
                            required>


                    <small class="text-muted">
                        Sélectionnez une image depuis votre ordinateur.
                    </small>


                </div>



                <div class="mb-3">

                    <label class="form-label">
                        Date de création
                    </label>


                    <form:input
                            path="dateCreation"
                            type="date"
                            cssClass="form-control"
                            required="true"/>

                </div>



                <div class="d-flex justify-content-between">


                    <a
                            href="${pageContext.request.contextPath}/tarika"
                            class="btn btn-secondary">

                        Retour

                    </a>



                    <button
                            type="submit"
                            class="btn btn-success">

                        Créer

                    </button>


                </div>


            </form:form>


        </div>

    </div>

</div>


<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>