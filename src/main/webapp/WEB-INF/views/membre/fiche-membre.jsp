<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche individuelle</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background-image: linear-gradient(135deg, rgba(241, 253, 246, 0.88), rgba(255, 255, 255, 0.86)), url('/images/tente.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #24342c;
        }

        .page-header {
            background-color: #0f5132;
            color: #ffffff;
            border-radius: 0.75rem;
            padding: 1.5rem;
            box-shadow: 0 0.75rem 1.75rem rgba(15, 81, 50, 0.16);
        }

        .page-header .member-reference {
            color: rgba(255, 255, 255, 0.76);
        }

        .fiche-card {
            border: 1px solid #dbe9df;
            border-radius: 0.75rem;
            box-shadow: 0 0.75rem 1.5rem rgba(33, 37, 41, 0.06);
            overflow: hidden;
        }

        .section-title {
            color: #0f5132;
            font-weight: 700;
            margin-bottom: 0.75rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #d6eadc;
        }

        .info-section {
            margin-bottom: 1.75rem;
        }

        .info-table {
            margin-bottom: 0;
            border: 1px solid #e3ece6;
        }

        .info-table th {
            width: 34%;
            background-color: #f6fbf8;
            color: #345444;
            font-weight: 700;
            white-space: nowrap;
        }

        .info-table td {
            color: #212529;
            word-break: break-word;
        }

        .info-table th,
        .info-table td {
            padding: 0.8rem 1rem;
            vertical-align: top;
        }

        .toolbar {
            gap: 0.75rem;
        }

        @media (max-width: 575.98px) {
            .page-header {
                padding: 1.25rem;
            }

            .info-table th,
            .info-table td {
                display: block;
                width: 100%;
            }

            .info-table th {
                border-bottom: 0;
                padding-bottom: 0.35rem;
            }

            .info-table td {
                padding-top: 0.35rem;
            }
        }

        @media print {
            .no-print {
                display: none !important;
            }

            body {
                background: #fff !important;
            }

            .container {
                max-width: 100% !important;
                padding: 0 !important;
            }

            .page-header {
                background: #fff !important;
                color: #000 !important;
                border: 1px solid #000;
                box-shadow: none !important;
            }

            .page-header .member-reference {
                color: #333 !important;
            }

            .fiche-card {
                border: 0 !important;
                box-shadow: none !important;
            }

            .info-section {
                break-inside: avoid;
            }
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="d-flex flex-column flex-lg-row justify-content-between align-items-lg-center mb-4 no-print toolbar">
        <a href="/membres" class="btn btn-outline-secondary">Retour</a>
        <div class="d-flex flex-column flex-sm-row gap-2">
            <a href="/fiche1/new?idMembre=${membre.id}" class="btn btn-success">Créer une fiche individuelle</a>
            <button type="button" class="btn btn-primary" onclick="window.print()">Export PDF</button>
        </div>
        <div class="d-flex flex-wrap gap-2 mt-3">
            <a href="/fiche1/edit?idMembre=${membre.id}" class="btn btn-outline-primary btn-sm">Modifier Information</a>
            <a href="/fiche2/edit?idMembre=${membre.id}" class="btn btn-outline-primary btn-sm">Modifier Fahasalamana</a>
            <a href="/fiche3/edit?idMembre=${membre.id}" class="btn btn-outline-primary btn-sm">Modifier Toe-tena</a>
            <a href="/fiche4/edit?idMembre=${membre.id}" class="btn btn-outline-primary btn-sm">Modifier Fianarana</a>
            <a href="/fiche5/edit?idMembre=${membre.id}" class="btn btn-outline-primary btn-sm">Modifier Maha Voronkely</a>
            <a href="/fiche6/edit?idMembre=${membre.id}" class="btn btn-outline-primary btn-sm">Modifier Rendu visite parent</a>
        </div>
    </div>

    <header class="page-header mb-4">
        <div class="d-flex flex-column flex-md-row justify-content-between gap-3">
            <div>
                <p class="text-uppercase fw-semibold mb-2 member-reference">Fiche membre</p>
                <h1 class="h2 mb-2">Fiche individuelle</h1>
                <p class="mb-0 member-reference">${membre.nomPrenom} - ${membre.reference}</p>
            </div>
            <div class="text-md-end">
                <div class="small text-uppercase member-reference">Référence</div>
                <div class="h5 mb-0">${membre.reference}</div>
            </div>
        </div>
    </header>

    <div class="card fiche-card">
        <div class="card-body p-4 p-lg-5">
            <section class="info-section">
                <h2 class="h5 section-title">Membre</h2>
                <div class="row g-4 align-items-start">
                    <div class="col-lg-8">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover align-middle info-table mb-0">
                                <tbody>
                                <tr>
                                    <th scope="row">Nom et prénoms</th>
                                    <td>${membre.nomPrenom}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Référence</th>
                                    <td>${membre.reference}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center">
                        <c:choose>
                            <c:when test="${not empty fiche1.image}">
                                <img src="${pageContext.request.contextPath}/images/${fiche1.image}"
                                    alt="Photo du membre"
                                    class="img-fluid img-thumbnail shadow-sm"
                                    style="max-width:220px; max-height:260px; object-fit:cover;">
                            </c:when>
                            <c:otherwise>
                                <div class="border rounded p-5 bg-light text-muted">
                                    Aucune image
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </section>

            <c:if test="${empty fiche1}">
                <div class="alert alert-info no-print">
                    Aucune fiche individuelle complète n'a encore été créée pour ce membre.
                </div>
            </c:if>

            <c:if test="${not empty fiche1}">
                <section class="info-section">
                    <h2 class="h5 section-title">Informations personnelles</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <tbody>
                            <tr><th scope="row">Fiantsoana</th><td>${fiche1.fiantsoana}</td></tr>
                            <tr><th scope="row">Adresse</th><td>${fiche1.adresse}</td></tr>
                            <tr><th scope="row">Nom père</th><td>${fiche1.nomPere}</td></tr>
                            <tr><th scope="row">Profession père</th><td>${fiche1.professionPere}</td></tr>
                            <tr><th scope="row">Téléphone père</th><td>${fiche1.telephonePere}</td></tr>
                            <tr><th scope="row">Facebook père</th><td>${fiche1.fbPere}</td></tr>
                            <tr>
                            <th scope="row">Lien Facebook père</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty fiche1.lienFbPere}">
                                            <a href="${fiche1.lienFbPere}" target="_blank" rel="noopener noreferrer">
                                                ${fiche1.lienFbPere}
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            Aucun lien
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr><th scope="row">Nom mère</th><td>${fiche1.nomMere}</td></tr>
                            <tr><th scope="row">Profession mère</th><td>${fiche1.professionMere}</td></tr>
                            <tr><th scope="row">Téléphone mère</th><td>${fiche1.telephoneMere}</td></tr>
                            <tr><th scope="row">Facebook mère</th><td>${fiche1.fbMere}</td></tr>
                            <tr>
                                <th scope="row">Lien Facebook mère</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty fiche1.lienFbMere}">
                                            <a href="${fiche1.lienFbMere}" target="_blank" rel="noopener noreferrer">
                                                ${fiche1.lienFbMere}
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            Aucun lien
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr><th scope="row">Nb ray tampo</th><td>${fiche1.nbRayTampo}</td></tr>
                            <tr><th scope="row">Rang ray tampo</th><td>${fiche1.rangRayTampo}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </section>

                <section class="info-section">
                    <h2 class="h5 section-title">Finoana sy fikambanana</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <tbody>
                            <tr><th scope="row">Religion</th><td>${fiche1.religion}</td></tr>
                            <tr><th scope="row">Fiangonana</th><td>${fiche1.fiangonana}</td></tr>
                            <tr><th scope="row">Sekoly alahady</th><td>${fiche1.sekolyAlahady}</td></tr>
                            <tr><th scope="row">Kilasy</th><td>${fiche1.kilasy}</td></tr>
                            <tr><th scope="row">Batisa</th><td>${fiche1.batisa}</td></tr>
                            <tr><th scope="row">Daty nidirana</th><td>${fiche1.datyNidirana}</td></tr>
                            <tr><th scope="row">Daty fanekena</th><td>${fiche1.datyFanekena}</td></tr>
                            <tr><th scope="row">Toerana nanaovana fanekena</th><td>${fiche1.toeranaNanaovanaFanekena}</td></tr>
                            <tr><th scope="row">Daty nialana</th><td>${fiche1.datyNialana}</td></tr>
                            <tr><th scope="row">Antony nialana</th><td>${fiche1.antonyNialana}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </section>

                <section class="info-section">
                    <h2 class="h5 section-title">Santé</h2>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <thead class="table-light">
                                <tr>
                                    <th>Sakafo tsy zaka</th>
                                    <th>Fanafody tsy zaka</th>
                                    <th>Famarihana hafa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${fiche1.sakafoTsyZaka}</td>
                                    <td>${fiche1.fanafodyTsyZaka}</td>
                                    <td>${fiche1.famarihanaHafa}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>


            <c:if test="${not empty fiche2List}">
                <section class="info-section">
                    <h2 class="h5 section-title">Aretina sy fanafody</h2>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <thead class="table-light">
                            <tr>
                                <th>Aretina mpahazo</th>
                                <th>Fanafody fampiasa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${fiche2List}" var="f">
                                <tr>
                                    <td>${f.aretinaMpahazo}</td>
                                    <td>${f.fanafodyFampiasa}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>


            <c:if test="${not empty fiche3List}">
                <section class="info-section">
                    <h2 class="h5 section-title">Toetra sy zavatra tiany</h2>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <thead class="table-light">
                            <tr>
                                <th>Toetra mahafinaritra</th>
                                <th>Toetra manahirana</th>
                                <th>Zavatra tiana</th>
                                <th>Zavatra tsy tiana</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${fiche3List}" var="f">
                                <tr>
                                    <td>${f.toetraMahafinaritra}</td>
                                    <td>${f.toetraManahirana}</td>
                                    <td>${f.zavatraTiana}</td>
                                    <td>${f.zavatraTsyTiana}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>


            <c:if test="${not empty fiche4List}">
                <section class="info-section">
                    <h2 class="h5 section-title">Scolarité</h2>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <thead class="table-light">
                            <tr>
                                <th>Taona</th>
                                <th>Sekoly</th>
                                <th>Kilasy</th>
                                <th>Taranja manavanana</th>
                                <th>Taranja manahirana</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${fiche4List}" var="f">
                                <tr>
                                    <td>${f.taona}</td>
                                    <td>${f.sekoly}</td>
                                    <td>${f.kilasy}</td>
                                    <td>${f.taranjaManavanana}</td>
                                    <td>${f.taranjaManahirana}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>


            <c:if test="${not empty fiche5List}">
                <section class="info-section">
                    <h2 class="h5 section-title">Talenta</h2>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <thead class="table-light">
                            <tr>
                                <th>Anarana</th>
                                <th>Daty nanomezana</th>
                                <th>Talenta nomena</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${fiche5List}" var="f">
                                <tr>
                                    <td>${f.anarana}</td>
                                    <td>${f.datyNanomezana}</td>
                                    <td>${f.talentaNomena}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>


            <c:if test="${not empty fiche6List}">
                <section class="info-section">
                    <h2 class="h5 section-title">Fifampidinihana tamin'ny Ray aman-dReny</h2>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <thead class="table-light">
                            <tr>
                                <th>Daty</th>
                                <th>Votoatin-draharaha</th>
                                <th>Fanamarihana</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${fiche6List}" var="f">
                                <tr>
                                    <td>${f.daty}</td>
                                    <td>${f.votoatinDraharaha}</td>
                                    <td>${f.fanamarihana}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>
        </div>
    </div>
</div>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
