<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouvelle fiche membre</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">

            <h1 class="h4 mb-4">Créer une fiche membre</h1>

            <form action="/fiche1" method="post" enctype="multipart/form-data">

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">ID membre</label>
                        <input type="number" class="form-control" name="idMembre">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Image</label>
                        <input type="file" class="form-control" name="imageFile" accept="image/*">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Fiantsoana</label>
                    <input type="text" class="form-control" name="fiantsoana">
                </div>

                <div class="mb-3">
                    <label class="form-label">Adresse</label>
                    <input type="text" class="form-control" name="adresse">
                </div>

                <hr>

                <h5>Informations du père</h5>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nom</label>
                        <input type="text" class="form-control" name="nomPere">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Profession</label>
                        <input type="text" class="form-control" name="professionPere">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Téléphone</label>
                        <input type="text" class="form-control" name="telephonePere">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Facebook</label>
                        <input type="text" class="form-control" name="fbPere">
                    </div>

                    <div class="col-12 mb-3">
                        <label class="form-label">Lien Facebook</label>
                        <input type="text" class="form-control" name="lienFbPere">
                    </div>
                </div>

                <hr>

                <h5>Informations de la mère</h5>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nom</label>
                        <input type="text" class="form-control" name="nomMere">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Profession</label>
                        <input type="text" class="form-control" name="professionMere">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Téléphone</label>
                        <input type="text" class="form-control" name="telephoneMere">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Facebook</label>
                        <input type="text" class="form-control" name="fbMere">
                    </div>

                    <div class="col-12 mb-3">
                        <label class="form-label">Lien Facebook</label>
                        <input type="text" class="form-control" name="lienFbMere">
                    </div>
                </div>

                <hr>

                <h5>Famille</h5>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nombre de frères/sœurs</label>
                        <input type="number" class="form-control" name="nbRayTampo" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Rang</label>
                        <input type="number" class="form-control" name="rangRayTampo" required>
                    </div>
                </div>

                <hr>

                <h5>Religion</h5>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Religion</label>
                        <input type="text" class="form-control" name="religion">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Fiangonana</label>
                        <input type="text" class="form-control" name="fiangonana">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Sekoly Alahady</label>
                        <select class="form-select" name="sekolyAlahady">
                            <option value="true">Oui</option>
                            <option value="false">Non</option>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Kilasy</label>
                        <input type="text" class="form-control" name="kilasy">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Batisa</label>
                        <select class="form-select" name="batisa">
                            <option value="true">Oui</option>
                            <option value="false">Non</option>
                        </select>
                    </div>
                </div>

                <hr>

                <h5>Santé</h5>

                <div class="mb-3">
                    <label class="form-label">Sakafo tsy zaka</label>
                    <input type="text" class="form-control" name="sakafoTsyZaka">
                </div>

                <div class="mb-3">
                    <label class="form-label">Fanafody tsy zaka</label>
                    <input type="text" class="form-control" name="fanafodyTsyZaka">
                </div>

                <div class="mb-3">
                    <label class="form-label">Famarihana hafa</label>
                    <textarea class="form-control" rows="3" name="famarihanaHafa"></textarea>
                </div>

                <hr>

                <h5>Historique</h5>

                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty nidirana</label>
                        <input type="date" class="form-control" name="datyNidirana">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty fanekena</label>
                        <input type="date" class="form-control" name="datyFanekena">
                    </div>

                    <div class="col-md-12 mb-3">
                        <label class="form-label">Toerana nanaovana fanekena</label>
                        <input type="text" class="form-control" name="toeranaNanaovanaFanekena">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty nialana</label>
                        <input type="date" class="form-control" name="datyNialana">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Antony nialana</label>
                        <input type="text" class="form-control" name="antonyNialana">
                    </div>

                </div>

                <button type="submit" class="btn btn-success">
                    Enregistrer
                </button>

                <a href="/fiche1" class="btn btn-secondary ms-2">
                    Annuler
                </a>

            </form>

        </div>
    </div>
</div>

<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
