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
            background-color: #f1fdf6;
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
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle info-table">
                        <tbody>
                        <tr>
                            <th scope="row">Nom et prénoms</th>
                            <td>${membre.nomPrenom}</td>
                        </tr>
                        <tr>
                            <th scope="row">Référence</th>
                            <td>${membre.reference}</td>
                        </tr>
                        <tr>
                            <th scope="row">Image</th>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty fiche1.image}">${fiche1.image}</c:when>
                                    <c:otherwise>Aucune image</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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
                            <tr><th scope="row">Lien Facebook père</th><td>${fiche1.lienFbPere}</td></tr>
                            <tr><th scope="row">Nom mère</th><td>${fiche1.nomMere}</td></tr>
                            <tr><th scope="row">Profession mère</th><td>${fiche1.professionMere}</td></tr>
                            <tr><th scope="row">Téléphone mère</th><td>${fiche1.telephoneMere}</td></tr>
                            <tr><th scope="row">Facebook mère</th><td>${fiche1.fbMere}</td></tr>
                            <tr><th scope="row">Lien Facebook mère</th><td>${fiche1.lienFbMere}</td></tr>
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
                            <tbody>
                            <tr><th scope="row">Sakafo tsy zaka</th><td>${fiche1.sakafoTsyZaka}</td></tr>
                            <tr><th scope="row">Fanafody tsy zaka</th><td>${fiche1.fanafodyTsyZaka}</td></tr>
                            <tr><th scope="row">Famarihana hafa</th><td>${fiche1.famarihanaHafa}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>

            <c:if test="${not empty fiche2}">
                <section class="info-section">
                    <h2 class="h5 section-title">Aretina sy fanafody</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <tbody>
                            <tr><th scope="row">Aretina mpahazo</th><td>${fiche2.aretinaMpahazo}</td></tr>
                            <tr><th scope="row">Fanafody fampiasa</th><td>${fiche2.fanafodyFampiasa}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>

            <c:if test="${not empty fiche3}">
                <section class="info-section">
                    <h2 class="h5 section-title">Toetra sy zavatra tiany</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <tbody>
                            <tr><th scope="row">Toetra mahafinaritra</th><td>${fiche3.toetraMahafinaritra}</td></tr>
                            <tr><th scope="row">Toetra manahirana</th><td>${fiche3.toetraManahirana}</td></tr>
                            <tr><th scope="row">Zavatra tiana</th><td>${fiche3.zavatraTiana}</td></tr>
                            <tr><th scope="row">Zavatra tsy tiana</th><td>${fiche3.zavatraTsyTiana}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>

            <c:if test="${not empty fiche4}">
                <section class="info-section">
                    <h2 class="h5 section-title">Scolarité</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <tbody>
                            <tr><th scope="row">Taona</th><td>${fiche4.taona}</td></tr>
                            <tr><th scope="row">Sekoly</th><td>${fiche4.sekoly}</td></tr>
                            <tr><th scope="row">Kilasy</th><td>${fiche4.kilasy}</td></tr>
                            <tr><th scope="row">Taranja manavanana</th><td>${fiche4.taranjaManavanana}</td></tr>
                            <tr><th scope="row">Taranja manahirana</th><td>${fiche4.taranjaManahirana}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>

            <c:if test="${not empty fiche5}">
                <section class="info-section">
                    <h2 class="h5 section-title">Talenta</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <tbody>
                            <tr><th scope="row">Anarana</th><td>${fiche5.anarana}</td></tr>
                            <tr><th scope="row">Daty nanomezana</th><td>${fiche5.datyNanomezana}</td></tr>
                            <tr><th scope="row">Talenta nomena</th><td>${fiche5.talentaNomena}</td></tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </c:if>

            <c:if test="${not empty fiche6}">
                <section class="info-section mb-0">
                    <h2 class="h5 section-title">Fifampidinihana tamin'ny Ray aman-dReny</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle info-table">
                            <tbody>
                            <tr><th scope="row">Daty</th><td>${fiche6.daty}</td></tr>
                            <tr><th scope="row">Votoatin-draharaha</th><td>${fiche6.votoatinDraharaha}</td></tr>
                            <tr><th scope="row">Fanamarihana</th><td>${fiche6.fanamarihana}</td></tr>
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
