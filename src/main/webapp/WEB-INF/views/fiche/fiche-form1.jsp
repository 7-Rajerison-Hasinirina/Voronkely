<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle - Form 1</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../common/background.jsp" />
    <style>
        body { min-height: 100vh; }
        .page-shell {
            background: rgba(255,255,255,0.93);
            border-radius: 1.25rem;
            box-shadow: 0 1rem 2rem rgba(15,81,50,.12);
            backdrop-filter: blur(6px);
        }
    </style>
</head>
<body>
<div class="container-fluid px-0">
    <div class="row g-0">
        <div class="col-auto px-0">
            <div class="position-sticky top-0" style="height:100vh;">
                <jsp:include page="../dashboard/navbar.jsp" />
            </div>
        </div>
        <div class="col p-3 p-lg-4">
            <div class="page-shell p-4 p-lg-5">
                <div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h1 class="h4 mb-4">Création de la fiche individuelle - Form 1</h1>
            <form action="${formAction}" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${fiche.id}">
                <input type="hidden" name="idMembre" value="${fiche.idMembre}">

                <h2 class="h5 mb-3">Mikasika azy manokana</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Image</label>
                        <input type="file" class="form-control" name="imageFile" accept="image/*">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Fiantsoana</label>
                        <input type="text" class="form-control" name="fiantsoana" maxlength="100" value="${fiche.fiantsoana}">
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Adresse</label>
                        <input type="text" class="form-control" name="adresse" maxlength="100" value="${fiche.adresse}">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nom père</label>
                        <textarea class="form-control" name="nomPere">${fiche.nomPere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Profession père</label>
                        <textarea class="form-control" name="professionPere">${fiche.professionPere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Téléphone père</label>
                        <textarea class="form-control" name="telephonePere">${fiche.telephonePere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Facebook père</label>
                        <textarea class="form-control" name="fbPere">${fiche.fbPere}</textarea>
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Lien Facebook père</label>
                        <textarea class="form-control" name="lienFbPere">${fiche.lienFbPere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nom mère</label>
                        <textarea class="form-control" name="nomMere">${fiche.nomMere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Profession mère</label>
                        <textarea class="form-control" name="professionMere">${fiche.professionMere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Téléphone mère</label>
                        <textarea class="form-control" name="telephoneMere">${fiche.telephoneMere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Facebook mère</label>
                        <textarea class="form-control" name="fbMere">${fiche.fbMere}</textarea>
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Lien Facebook mère</label>
                        <textarea class="form-control" name="lienFbMere">${fiche.lienFbMere}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nb ray tampo</label>
                        <input type="number" class="form-control" name="nbRayTampo" required value="${fiche.nbRayTampo}">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Rang ray tampo</label>
                        <input type="number" class="form-control" name="rangRayTampo" required value="${fiche.rangRayTampo}">
                    </div>
                </div>

                <h2 class="h5 mt-4 mb-3">Mikasika ny fitaizam-pinoana</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Religion</label>
                        <input type="text" class="form-control" name="religion" maxlength="50" value="${fiche.religion}">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Fiangonana</label>
                        <input type="text" class="form-control" name="fiangonana" maxlength="100" value="${fiche.fiangonana}">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Sekoly alahady</label>
                        <select class="form-select" name="sekolyAlahady">
                            <option value="false" ${!fiche.sekolyAlahady ? 'selected' : ''}>Non</option>
                            <option value="true" ${fiche.sekolyAlahady ? 'selected' : ''}>Oui</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Kilasy</label>
                        <input type="text" class="form-control" name="kilasy" maxlength="50" value="${fiche.kilasy}">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Batisa</label>
                        <select class="form-select" name="batisa">
                            <option value="false" ${!fiche.batisa ? 'selected' : ''}>Non</option>
                            <option value="true" ${fiche.batisa ? 'selected' : ''}>Oui</option>
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
                        <textarea class="form-control" name="famarihanaHafa">${fiche.famarihanaHafa}</textarea>
                <h2 class="h5 mt-4 mb-3">Mikasika ny fikambanana</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty nidirana</label>
                        <input type="date" class="form-control" name="datyNidirana" value="${fiche.datyNidirana}">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty fanekena</label>
                        <input type="date" class="form-control" name="datyFanekena" value="${fiche.datyFanekena}">
                    </div>
                    <div class="col-12 mb-3">
                        <label class="form-label">Toerana nanaovana fanekena</label>
                        <textarea class="form-control" name="toeranaNanaovanaFanekena">${fiche.toeranaNanaovanaFanekena}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Daty nialana</label>
                        <input type="date" class="form-control" name="datyNialana" value="${fiche.datyNialana}">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Antony nialana</label>
                        <textarea class="form-control" name="antonyNialana">${fiche.antonyNialana}</textarea>
                    </div>
                </div>

                <button type="submit" class="btn btn-success">Suivant</button>
            </form>
        </div>
    </div>
</div>
<script src="/javascript/fiche-individuelle.js"></script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
