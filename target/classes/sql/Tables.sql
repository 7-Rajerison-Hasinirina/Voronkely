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