<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Fiche individuelle - Form 1</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-white">
<div class="container py-4">
    <h3>Création de la fiche individuelle — Form 1</h3>
    <form id="fiche1Form" action="/fiche1" method="post">
        <div class="mb-3">
            <label class="form-label">Référence membre</label>
            <input name="idMembre" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Image (URL ou chemin)</label>
            <input name="image" class="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">Fiantsoana</label>
            <input name="fiantsoana" class="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">Adresse</label>
            <input name="adresse" class="form-control" />
        </div>
        <h5>Parents</h5>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Nom père</label>
                <input name="nomPere" class="form-control" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Profession père</label>
                <input name="professionPere" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Téléphone père</label>
                <input name="telephonePere" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Facebook père</label>
                <input name="fbPere" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Lien FB père</label>
                <input name="lienFbPere" class="form-control" />
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Nom mère</label>
                <input name="nomMere" class="form-control" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Profession mère</label>
                <input name="professionMere" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Téléphone mère</label>
                <input name="telephoneMere" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Facebook mère</label>
                <input name="fbMere" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Lien FB mère</label>
                <input name="lienFbMere" class="form-control" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Nombre ray tampo</label>
                <input type="number" name="nbRayTampo" class="form-control" required />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Rang ray tampo</label>
                <input type="number" name="rangRayTampo" class="form-control" required />
            </div>
        </div>

        <h5>Fitaizam-pinoana</h5>
        <div class="row">
            <div class="col-md-4 mb-3">
                <label class="form-label">Religion</label>
                <input name="religion" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Fiangonana</label>
                <input name="fiangonana" class="form-control" />
            </div>
            <div class="col-md-2 mb-3 form-check">
                <input type="checkbox" name="sekolyAlahady" class="form-check-input" id="sekolyAlahady" />
                <label class="form-check-label" for="sekolyAlahady">Sekoly alahady</label>
            </div>
            <div class="col-md-2 mb-3 form-check">
                <input type="checkbox" name="batisa" class="form-check-input" id="batisa" />
                <label class="form-check-label" for="batisa">Batisa</label>
            </div>
        </div>

        <h5>Toe-tena sy fahasalamana</h5>
        <div class="mb-3">
            <label class="form-label">Sakafo tsy zaka</label>
            <textarea name="sakafoTsyZaka" class="form-control"></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Fanafody tsy zaka</label>
            <textarea name="fanafodyTsyZaka" class="form-control"></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Famarihana hafa</label>
            <textarea name="famarihanaHafa" class="form-control"></textarea>
        </div>

        <h5>Fikambanana</h5>
        <div class="row">
            <div class="col-md-4 mb-3">
                <label class="form-label">Date niditra</label>
                <input type="date" name="datyNidirana" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Date fanekena</label>
                <input type="date" name="datyFanekena" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Toerana nanaovana fanekena</label>
                <input name="toeranaFanekena" class="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Date nialana</label>
                <input type="date" name="datyNialana" class="form-control" />
            </div>
            <div class="col-md-8 mb-3">
                <label class="form-label">Antony nialana</label>
                <input name="antonyNialana" class="form-control" />
            </div>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <a href="/membres" class="btn btn-secondary">Annuler</a>
            <button type="submit" class="btn btn-primary" data-next="/fiche2/new">Suivant</button>
        </div>
    </form>
</div>
<script src="/javascript/fiche-individuelle.js"></script>
</body>
</html>
