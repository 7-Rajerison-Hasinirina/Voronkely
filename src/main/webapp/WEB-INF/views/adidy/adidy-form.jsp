<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <title>Nouveau Adidy</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">

</head>

<body>


<div class="container mt-4">


    <h3>
        Ajouter un Adidy
    </h3>


    <form method="post" action="/adidy">


        <div class="mb-3">

            <label class="form-label">
                Référence membre
            </label>


            <input type="text"
                   id="referenceMembre"
                   name="referenceMembre"
                   class="form-control"
                   autocomplete="off"
                   required>

        </div>





        <div class="mb-3">

            <label class="form-label">
                Type Adidy
            </label>


            <select name="idTypeAdidy"
                    class="form-control"
                    required>


                <option value="">
                    -- Choisir --
                </option>


                <c:forEach items="${typesAdidy}" var="type">


                    <option value="${type.id}">
                        ${type.libelle}
                    </option>


                </c:forEach>


            </select>


        </div>





        <div class="mb-3">

            <label class="form-label">
                Montant
            </label>


            <input type="number"
                   step="0.01"
                   name="montant"
                   class="form-control"
                   value="${adidy.montant}"
                   required>

        </div>





        <div class="mb-3">

            <label class="form-label">
                Date ajout
            </label>


            <input type="date"
                   name="dateAjout"
                   class="form-control"
                   value="${adidy.dateAjout}"
                   required>


        </div>





        <button type="submit"
                class="btn btn-primary">

            Enregistrer

        </button>


        <a href="/adidy"
           class="btn btn-secondary">

            Annuler

        </a>


    </form>


</div>





<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.min.js"></script>



<script>


$(function(){


    $("#referenceMembre").autocomplete({


        source:function(request,response){


            $.ajax({


                url:"/adidy/recherche-membre",


                data:{
                    reference: request.term
                },


                success:function(data){


                    response(

                        $.map(data,function(item){


                            return {

                                label:
                                item.reference
                                +" - "
                                +item.nomPrenom,


                                value:
                                item.reference

                            };


                        })

                    );


                }


            });


        },


        minLength:2


    });



});



</script>



</body>
</html>