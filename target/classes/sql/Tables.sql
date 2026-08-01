CREATE TABLE membre (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_prenom TEXT NOT NULL,
    reference TEXT GENERATED ALWAYS AS ('REF' || id) STORED
);


CREATE TABLE fiche_form1 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER,
    image VARCHAR(200),
    fiantsoana VARCHAR(100),
    adresse VARCHAR(100),
    nom_pere TEXT,
    profession_pere TEXT,
    telephone_pere TEXT,
    fb_pere TEXT,
    lien_fb_pere TEXT,
    nom_mere TEXT,
    profession_mere TEXT,
    telephone_mere TEXT,
    fb_mere TEXT,
    lien_fb_mere TEXT,
    nb_ray_tampo INTEGER NOT NULL,
    rang_ray_tampo INTEGER NOT NULL,
    religion VARCHAR(50),
    fiangonana VARCHAR(100),
    sekoly_alahady BOOLEAN,
    kilasy VARCHAR(50),
    batisa BOOLEAN,
    sakafo_tsy_zaka TEXT,
    fanafody_tsy_zaka TEXT,
    famarihana_hafa TEXT,
    daty_nidirana DATE,
    daty_fanekena DATE,
    toerana_nanaovana_fanekena TEXT,
    daty_nialana DATE,
    antony_nialana TEXT,

    FOREIGN KEY (id_membre) REFERENCES membre(id)
);


CREATE TABLE fiche_form2 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER,
    aretina_mpahazo VARCHAR(100),
    fanafody_fampiasa VARCHAR(100),
    FOREIGN KEY (id_membre) REFERENCES membre(id)
);


CREATE TABLE fiche_form3 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER,
    toetra_mahafinaritra TEXT,
    toetra_manahirana TEXT,
    zavatra_tiana TEXT,
    zavatra_tsy_tiana TEXT,
    FOREIGN KEY (id_membre) REFERENCES membre(id)
);


CREATE TABLE fiche_form4 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER,
    taona INTEGER,
    sekoly VARCHAR(50),
    kilasy VARCHAR(50),
    taranja_manavanana TEXT,
    taranja_manahirana TEXT,
    FOREIGN KEY (id_membre) REFERENCES membre(id)
);


CREATE TABLE fiche_form5 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER,
    anarana VARCHAR(100),
    daty_nanomezana DATE,
    talenta_nomena TEXT,
    FOREIGN KEY (id_membre) REFERENCES membre(id)
);


CREATE TABLE fiche_form6 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER,
    daty DATE,
    votoatin_draharaha TEXT,
    fanamarihana TEXT,
    FOREIGN KEY (id_membre) REFERENCES membre(id)
);


CREATE TABLE fiche_presence (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER NOT NULL,
    date_presence DATE NOT NULL,
    present BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (id_membre) REFERENCES membre(id)
);


CREATE TABLE visite_parent (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_membre BIGINT NOT NULL,
    date_visite DATE NOT NULL,
    statut VARCHAR(30) NOT NULL DEFAULT 'En attente',
    CONSTRAINT fk_visite_parent_membre
    FOREIGN KEY (id_membre)
    REFERENCES membre(id)
);


CREATE TABLE rakitra (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    montant DECIMAL(12,2) NOT NULL,
    montant_restant DECIMAL(12,2) NOT NULL,
    date_ajout DATE NOT NULL
);


CREATE TABLE mouvement_rakitra (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_rakitra INTEGER NOT NULL,
    montant_a_deduire DECIMAL(12,2) NOT NULL,
    motif_utilisation TEXT NOT NULL,
    type_mouvement VARCHAR(20) NOT NULL,
    date_mouvement DATE NOT NULL,
    CONSTRAINT fk_mouvement_rakitra
        FOREIGN KEY(id_rakitra)
        REFERENCES rakitra(id)
);


CREATE TABLE type_assurance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    libelle TEXT NOT NULL
);


CREATE TABLE assurance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER NOT NULL,
    montant DECIMAL(12,2) NOT NULL,
    id_type_assurance INTEGER NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT fk_assurance_membre
        FOREIGN KEY(id_membre)
        REFERENCES membre(id),
    CONSTRAINT fk_assurance_type
        FOREIGN KEY(id_type_assurance)
        REFERENCES type_assurance(id)
);


CREATE TABLE type_adidy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    libelle TEXT NOT NULL UNIQUE
);


CREATE TABLE adidy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membre INTEGER NOT NULL,
    id_type_adidy INTEGER NOT NULL,
    montant DOUBLE NOT NULL,
    montant_restant DOUBLE NOT NULL,
    date_ajout DATE NOT NULL,
    FOREIGN KEY (id_membre)
        REFERENCES membre(id),
    FOREIGN KEY (id_type_adidy)
        REFERENCES type_adidy(id)
);


CREATE TABLE mouvement_adidy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_adidy INTEGER NOT NULL,
    motif_utilisation TEXT NOT NULL,
    type_mouvement VARCHAR(30) NOT NULL,
    montant DOUBLE NOT NULL,
    date_mouvement DATE NOT NULL,
    FOREIGN KEY (id_adidy)
        REFERENCES adidy(id)
);


CREATE TABLE role_tarika (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    role VARCHAR(100) NOT NULL
);


CREATE TABLE tarika (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(100) NOT NULL,
    image VARCHAR(200) NOT NULL,
    date_creation DATE NOT NULL
);


CREATE TABLE membre_tarika (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_tarika INTEGER NOT NULL,
    id_membre INTEGER NOT NULL,
    id_role_tarika INTEGER NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (id_tarika)
    REFERENCES tarika(id),
    FOREIGN KEY (id_membre)
    REFERENCES membre(id),
    FOREIGN KEY (id_role_tarika)
    REFERENCES role_tarika(id)
);


CREATE TABLE numero_trimestre (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    numero_trimestre VARCHAR(50) NOT NULL
);


CREATE TABLE fiche_technique (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre VARCHAR(200) NOT NULL,
    annee INTEGER NOT NULL,
    id_numero_trimestre INTEGER,
    FOREIGN KEY (id_numero_trimestre) REFERENCES numero_trimestre(id)
);


CREATE TABLE fiche_technique_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_fiche_technique INTEGER NOT NULL,
    faritra VARCHAR(100),
    tenin_andriamanitra TEXT,
    tarigetra TEXT,
    toerana_ivoriana VARCHAR(200),
    andro_ivoriana VARCHAR(100),
    ora_fvoriana VARCHAR(100),
    ny_tonia VARCHAR(200),
    komitim_pivondronana VARCHAR(200),
    filoha VARCHAR(200),
    daty_iraisana TEXT,
    objectif TEXT,
    tompon_andraikitra TEXT,
    FOREIGN KEY (id_fiche_technique) REFERENCES fiche_technique(id)
);


CREATE TABLE activite_fiche_technique (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_fiche_technique INTEGER NOT NULL,
    daty DATE,
    lohahevitra VARCHAR(200),
    fomba_fampiasa TEXT,
    sahanasa TEXT,
    tomponandraikitra VARCHAR(200),
    fanamarihana TEXT,
    FOREIGN KEY (id_fiche_technique) REFERENCES fiche_technique(id)
);

CREATE TABLE camp (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre VARCHAR(200) NOT NULL,
    date_debut DATE,
    date_fin DATE,
    lieu VARCHAR(200)
);

CREATE TABLE camp_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_camp INTEGER NOT NULL,
    sampana VARCHAR(100),
    faritany VARCHAR(100),
    faritra VARCHAR(100),
    fivondronana VARCHAR(100),
    andiany VARCHAR(100),
    tarigetra TEXT,
    tenin_andriamanitra TEXT,
    objectif TEXT,
    fandraharahana TEXT,
    fitaovana TEXT,
    ara_panahy TEXT,
    fientanana TEXT,
    fahasalamana TEXT,
    isa_mpilasy INTEGER,
    fitanterana TEXT,
    toerana_hiaingana VARCHAR(200),
    toerana_hiverenana VARCHAR(200),
    FOREIGN KEY (id_camp) REFERENCES camp(id)
);


CREATE TABLE activite_camp (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_camp INTEGER NOT NULL,
    antony TEXT,
    quantite DECIMAL(10,2),
    prix_unitaire DECIMAL(10,2),
    montant DECIMAL(10,2),
    type_mouvement VARCHAR(20),
    FOREIGN KEY (id_camp) REFERENCES camp(id)
);