<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle - Form 1</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h1 class="h4 mb-4">Création de la fiche individuelle - Form 1</h1>
            <form action="/fiche1" method="post" enctype="multipart/form-data">
                <input type="hidden" name="idMembre" value="${fiche.idMembre}">

                <h2 class="h5 mb-3">Mikasika azy manokana</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Image</label>
                        <input type="file" class="form-control" name="imageFile" accept="image/*">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Fiantsoana</label>
                        <input type="text" class="form-control" name="fiantsoana" maxlength="100">
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Adresse</label>
                        <input type="text" class="form-control" name="adresse" maxlength="100">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nom père</label>
                        <textarea class="form-control" name="nomPere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Profession père</label>
                        <textarea class="form-control" name="professionPere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Téléphone père</label>
                        <textarea class="form-control" name="telephonePere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Facebook père</label>
                        <textarea class="form-control" name="fbPere"></textarea>
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Lien Facebook père</label>
                        <textarea class="form-control" name="lienFbPere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nom mère</label>
                        <textarea class="form-control" name="nomMere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Profession mère</label>
                        <textarea class="form-control" name="professionMere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Téléphone mère</label>
                        <textarea class="form-control" name="telephoneMere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Facebook mère</label>
                        <textarea class="form-control" name="fbMere"></textarea>
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Lien Facebook mère</label>
                        <textarea class="form-control" name="lienFbMere"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nb ray tampo</label>
                        <input type="number" class="form-control" name="nbRayTampo" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Rang ray tampo</label>
                        <input type="number" class="form-control" name="rangRayTampo" required>
                    </div>
                </div>

                <h2 class="h5 mt-4 mb-3">Mikasika ny fitaizam-pinoana</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Religion</label>
                        <input type="text" class="form-control" name="religion" maxlength="50">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Fiangonana</label>
                        <input type="text" class="form-control" name="fiangonana" maxlength="100">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Sekoly alahady</label>
                        <select class="form-select" name="sekolyAlahady">
                            <option value="false">Non</option>
                            <option value="true">Oui</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Kilasy</label>
                        <input type="text" class="form-control" name="kilasy" maxlength="50">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Batisa</label>
                        <select class="form-select" name="batisa">
                            <option value="false">Non</option>
                            <option value="true">Oui</option>
                        </select>
                    </div>
                </div>

                <h2 class="h5 mt-4 mb-3">Mikasika ny toe-tena sy ny fahasalamana</h2>
                <div class="mb-3">
                    <label class="form-label">Sakafo tsy zaka</label>
                    <textarea class="form-control" name="sakafoTsyZaka"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Fanafody tsy zaka</label>
                    <textarea class="form-control" name="fanafodyTsyZaka"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Famarihana hafa</label>
                    <textarea class="form-control" name="famarihanaHafa"></textarea>
                </div>

                <h2 class="h5 mt-4 mb-3">Mikasika ny fikambanana</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty nidirana</label>
                        <input type="date" class="form-control" name="datyNidirana">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty fanekena</label>
                        <input type="date" class="form-control" name="datyFanekena">
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Toerana nanaovana fanekena</label>
                        <textarea class="form-control" name="toeranaNanaovanaFanekena"></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty nialana</label>
                        <input type="date" class="form-control" name="datyNialana">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Antony nialana</label>
                        <textarea class="form-control" name="antonyNialana"></textarea>
                    </div>
                </div>

                <button type="submit" class="btn btn-success">Suivant</button>
            </form>
        </div>
    </div>
</div>
<script src="/javascript/fiche-individuelle.js"></script>
</body>
</html>
