<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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



        <a
        href="${pageContext.request.contextPath}/membre-tarika/${tarika.id}/nouveau"
        class="btn btn-success">


            Ajouter un membre


        </a>



    </div>





    <div class="card shadow">


        <div class="card-body">



            <table class="table table-bordered table-striped">


                <thead class="table-success">


                <tr>

                    <th>
                        Image
                    </th>


                    <th>
                        Nom
                    </th>


                    <th>
                        Role
                    </th>


                    <th>
                        Date
                    </th>


                </tr>


                </thead>



                <tbody>



                <c:forEach items="${membresTarika}" var="mt">


                    <tr>


                        <td>


                            <img
                            src="${pageContext.request.contextPath}/images/${mt.membre.id != null ? mt.membre.image : 'profile-female.png'}"
                            width="70"
                            height="70"
                            class="rounded-circle"
                            style="object-fit:cover;">


                        </td>



                        <td>

                            ${mt.membre.nomPrenom}

                        </td>




                        <td>

                            ${mt.roleTarika.role}

                        </td>




                        <td>

                            ${mt.date}

                        </td>


                    </tr>



                </c:forEach>




                </tbody>



            </table>



            <c:if test="${empty membresTarika}">


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