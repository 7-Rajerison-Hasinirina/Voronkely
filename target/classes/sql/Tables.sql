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