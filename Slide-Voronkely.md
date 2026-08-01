# Application de Gestion de Voronkely
Technologies:
    - Framework Spring Boot MVC
    - JS, java, jsp, html, CSS, SQL 
    - SQLite

## 1- Preparation de l'evironnement :
- Creation de repository 
- Implementation de framework Spring Boot MVC 
- Creation de la base avec SQLite : voronkely.db
- Realisation de fonctionnement : connexion avec la base + migration 
- Depot sur git
[ok] ---------------

## 2- Conception relationnelle:
- Creation des tables necessaires : 
    - Tables.sql
        - role
[ok]        - membre ( manana reference : REF + id , ex: REF1)
        - status ( actif , inactif )
        - talenta
[ok]        - fiche_presence
        - agenda ( listes des activites )
[ok]        - visite_parent
[ok]        - type_assurance ( ex: RAD, beazina, mpiandraikitra )
[ok]        - type_adidy
[ok]        - assurance
[ok]        - adidy
[ok]        - rakitra 
[ok]        - type_mouvement
[ok]        - mouvement_rakitra
        - mouvement_assurance
[ok]        - mouvement_adidy
[ok]        - fiche_form1
[ok]        - fiche_form2
[ok]        - fiche_form3
[ok]        - fiche_form4
[ok]        - fiche_form5
[ok]        - fiche_form6
        - numero_trimestre
        - fiche_technique
        - fiche_technique_info
        - activite_fiche_technique
        - grade
        - camp 
        - camp_info
        - tarika ( misy sary, ex: Voromailala)
        - role_tarika 
        - membre_tarika
        - fichier ( sary, pdf, docx, excel ,...)
        - agenda 
    - Data.sql
    - Syntaxe.sql
    - Nettoyage.sql


## 3- Debut des fonctionnalites a realiser 

### PART 01:
- Module 1: 
    - utilisation complete pour design : bootstrap :
        - theme verte + background blanc 
    - navbar : barre de navigation laterale gauche
    - header: 
        - Titre : Voronkely Ankadimbahoaka 
        - Gauche: Logo Voronkely
        - Droite: Logo Mpanazava 
    - epacement d'affichage : a droite 
[ok]



- Module 2: Formulaire insertion nouvel membre
    - Tables.sql:
        - membre 
    - Membre.java
    - MembreReposiory.java
    - MembreService.java
    - MembreController.java
    * Fonctionnalites: 
        - Creation de bouton ( dans le navbar ) : membre : /membres 
        - Creation de la formulaire en jsp : membre-form.jsp
        - Insertion
[ok]



- Module 3: Affichage par defaut de la liste des membres dans le dashboard 
    - photo en card : avec (profile feminine par defaut )
    - Nom et prenom 
[ok]



- Module 4: membre en format card -> afficahge de fiche individuelle , sinon : ajouter une fiche individuelle : fiche-membre.jsp 
[ok]



- Module 5: 
    - Creation de la fiche individuelle 
        - Form 1:
            * mikasika azy manokana
                - id_membre ( reference )
                - image  varchar 200( nullable )
                - fiantsoana varchar 100
                - adresse varchar 100
                - nom_pere text
                - profession_pere text
                - telephone_pere text
                - fb_pere text 
                - lien_fb_pere ( nullable ) text
                - nom_mere text
                - profession_mere text
                - telephone_mere text 
                - fb_mere text 
                - lien_fb_mere  text ( nullable )
                - nb_ray_tampo int not null
                - rang_ray_tampo int not null
            * mikasika ny fitaizam-pinoana
                - religion varchar 50 
                - fiangonana varchar 100
                - sekoly_alahady boolen 
                - kilasy varchar 50 
                - batisa boolean 
            * mikasika ny toe-tena sy ny fahasalaman 
                - sakafo_tsy_zaka text 
                - fanafody_tsy_zaka text 
                - famarihana_hafa text 
            * mikasika ny fikambanana
                - daty_nidirana date
                - daty_fanekena date
                - toerana_nanaovana_fanekena text 
                - daty_nialana date
                - antony_nialana text 
                Bouton : Suivant -> enregistrement dans la table fiche_form1

        - Form 2: ( saisie multiple )
            * mikasika ny toe-tena sy ny fahasalamana
                - aretina_mpahazo varchar 100
                - fanafody_fanmpiasa varchar 100
                ( on va utilsier un javascript permettant de faire un saisie multiple )
                Bouton Suivant dans table fiche_form2

        - Form 3: 
            * toetra amam-pihetsika fototra
                - toetra_mahafinaritra text
                - toetra_manahirana text
                - zavatra_tiana text
                - zavatra_tsy_tiana text
                 ( on va utilsier un javascript permettant de faire un saisie multiple )
                Bouton Suivant -> table fiche_form3

        - Form 4:
            * mikasika ny fianarana
                - taona int
                - sekoly varchar 50 
                - kilasy varchar 50 
                - taranja_manavanana text
                - taranja_manahirana text 
              ( on va utilsier un javascript permettant de faire un saisie multiple )
                Bouton Suivant -> table fiche_form4

        - Form 5:
            * mikasika ny talenta
                - anarana varchar 100
                - daty_nanomezana date
                - talenta_nomena text
                ( on va utilsier un javascript permettant de faire un saisie multiple )
                Bouton Suivant -> fiche_form5

        - Form 6:
            * mikasika ny fifampidinihana tamin'ny Ray amann-dReny
                - daty date 
                - votoatin-draharaha text 
                - fanamarihana text
                Bouton Terminé -> fiche_form6 

fiche-form1.jsp -> fiche-form2 ->...... -> fiche-form6.jsp 
[ok]



- Module 6: Affichage et restructuration de la fiche 
[ok]


- Module 7: Modification de la fiche individuelle :
    - Creation de bouton Modifier
    - Affichage de tous les 6 fiche_form : -> reviens au debut de la creation 


- Module 8: Export en PDF nom_prenom.PDF de la fiche sous forme de la fiche comme dans un papier
[ok]



### PART 02:
- Module 1: Presence hebdomadaire 
    - fiche_presence:
        * id
        * id_membre
        * date_presence
        * present ( true / false ) 

    - Creation de bouton Suivi de presence  dans le navbar 
    - Dans la page de presence: 
        - date
        - affichage de la liste des membre : status beazina 
            - eleve1: []
            - eleve2: []
            - eleve3: []
            ...
        - bouton Sauvegarder -> enregistrement dans la table fiche_presence
[ok]



- Module 2: Presence via une formulaire ( dans la page de presence )
    - Ajout de bouton : Presence particuliere
        - reference 
        - Affichge par javascript de l'information de cet membre
            - image ( profile feminine par defaut s'il n'y en a pas )
            - nom et prenom
        - date 
        - presente : []   ( true/false)
        - bouoton Sauvegarder -> enregistrement dans la table fiche_presence
[ok]



- Module 3: Consultation de presence + filtre 
    - recherche par reference 
        -> DROITE affiche sa fiche de presence ( grouper par mois si possible )
        -> GAUCHE affiche la graphe ( x: mois , y: nombre de presence: )
    - filtre date min et date max 
    1- ajout de bouoton: Voir presence jsute au bas de 'checkbox' dans le card: dans la page-presence
    2- creation de page presence/detail-presence.jsp :
        - affichage de l'information de membre ( nomprenom, reference, image )
[ok]



- Module 4: Liste des eleves ayant le nombre de presence <= 2 pour le mois dernier
    - affichge en card :
        - images 
        - nom et prenom
        - bouton : Fiche individuelle

[ok]


- Module 5: Visite de parents
    - creation de table 'visite_parent' :
        - id
        - id_membre
        - date_visite
        - statut ( En attente , Termine )
    - Ajout de bouton : 'Visite de parents' dans la fiche-membre.jsp 
    - Creation de la page pour la visite de parents 
        - filtre :
            - par reference
            - reherche multicritere par nom
        - affichage des eleves en card 
            - images 
            - nom et prenom
            - bouton 'Voir plus'
                Voir plus -> ouvre une page affichant le tableua de presnece pour cet eleve : fiche_form6 
[ok]



### PART 03: 
- Module 1: Rakitra
    - table a creer: 'rakitra':
        - rakitra:
            * id
            * montant
            * montant_restant
            * date_ajout
        - mouvement_rakitra: 
            * id
            * id_rakitra
            * montant_a_deduire
            * motif_utilisation
            * type_mouvement 'ENTREE', "SORTIE"
    - ajout de bouton 'Rakitra' dans le navbar
    - on affiche un bouton : 'Nouvel rakitra' dans rakitra/page-rakitra.jsp qui ouvre rakitra/rakitra-form.jsp 
    - Creation de la page pour le gestion de rakitra rakitra/rakitra-form.jsp 

        - bouton 'Nouvel rakitra' -> ouvre une form_rakitra ( formulaire pour isnerer le montant de rakitra )
        - form_rakitra:
            * date 
            * montant
            * montant_restant
            * bouton : enregistrer -> table rakitra 
[ok]


- Module 2: Affichge de tabelau historique rakitra : dans rakitra/page-rakitra.jsp
    - date 
    - montant
    - montant_restante : montant - SUM montant_a_deduire dans la table mouvement_rakitra  ( s'il n'y en a pas, on prend 0 le montant_a_deduire)
    - 'Voir detail'
[ok]



- Module 3: Si rakitra : tsy lany 
    - Clique sur bouton 'Voir detail' -> ouvre une mouvement-rakira.jsp 
    - Creation de la formulaire mouvement rakitra: ( en recuperation de cet id_rakitra )
        - montant actuel ( le montant restant )
        - montant a deduire
        - montant restant : calculer par JS ( erreur: 'montant insuffisant' si  montant actuel - montant a deduire < 0 )
        - motif_utilisation
        - type_mouvement
        - bouton: Enregistrer -> mouvement_rakitra 
[ok]


- Module 4: Montant global via rakitra 
    - filtre date min max
    - affichge de montant globaal 
[ok]



### PART 04:
- Module 1 : Gestion assurance
    - ajout de bouton 'Assurance' dans le navbar
    - Creation de la page pour le gestion de assurance
        - bouton 'Nouvel assurance' -> ouvre une form_assurance ( formulaire pour isnerer le montant de assurance )
        - form_assurance:
            * reference_membre : 
                - Affichge par javascript de l'information de cet membre
                    - image ( profile feminine par defaut s'il n'y en a pas )
                    - nom et prenom
            * montant
            * type_assurance 
            * date 
            * bouton : enregistrer -> table assurance 
0- Creation de la table 
- type_assurance:
    * id 
    * libelle
- assurance:
    * id 
    * id_membre 
    * montant
    * id_type_assurance
    * date
- creer les entity , controler, service, repository de ces tables 
1- on va regler le bouton Assurance dans le navbar.jsp 
2- creer: assurance/page-assurance.jsp:
    contenant le bouton : 'Nouvel assurance' -> ouvre une assurance-form.jsp
        - form_assurance:
            * reference_membre : 
                - Affichge par javascript de l'information de cet membre
                    - image ( profile feminine par defaut s'il n'y en a pas )
                    - nom et prenom
            * montant
            * type_assurance 
            * date 
            * bouton : enregistrer -> table assurance 
3- le js se trouve dans javascript/assurance.js
[ok]



- Module 2: Affichge de tabelau historique assurance
    - filtre date min max + recherceh multicritere
        - nom_prenom
        - date 
        - montant


- Module 3: Montant global via assurance         - assurance globale
    - filtre date min max 
    - affichge de montant de assurance  ( groupé par id_type_assurance)
        - assurance beazina
        - assurance mpiandraikitra
        - assurance RAD
[OK]


### PART 05:
- Module 1 : Gestion adidy
    1- creation de table adidy:
        - id
        - id_membre  ( on va faire la meme maniere la reecuperation de id_membre a partir de reference dans l'affichage , et  affichage a droit3 de image , nom prenom et reference de membre trouves )
        - montant 
        - montant_restant ( qui est par defaut = monant au moment d'insertion )
        - date_ajout 
    2- creation de mouvement_adidy :
        - id
        - id_adidy
        - motif_utilisation
        - type_mouvement
        - date_mouvement

    - ajout de bouton 'adidy' dans le navbar
    - Creation de la page pour le gestion de adidy
        - bouton 'Nouvel adidy' -> ouvre une form_adidy ( formulaire pour isnerer le montant de adidy )
        - form_adidy:
            * reference_membre : 
                - Affichge par javascript de l'information de cet membre
                    - image ( profile feminine par defaut s'il n'y en a pas )
                    - nom et prenom
            * montant
            * type_adidy 
            * date 
            * bouton : enregistrer -> table adidy 
[ok]


- Module 2: Affichge de tabelau historique adidy
    - filtre date min max + recherche multicritere
        - nom_prenom
        - date 
        - montant
[ok]


- Module 3: Montant global via adidy
    - filtre date min max 
    - affichge de montant de adidy  ( groué)
        - adidy globale
        - adidy beazina
        - adidy mpiandraikitra
        - adidy RAD
[ok]


- Module 4: Si adidy : si montant > 0
    - Clique sur bouton 'Mouvement adidy ' 
    - Creation de la formulaire mouvement adidy:
        - type_adidy : ex ( beazina )
        - montant actuel ( le montant restant )
        - montant a deduire
        - montant restant : calculer par JS ( erreur: 'montant insuffisant' si  montant actuel - montant a deduire < 0 )
        - motif_utilisation
        - type_mouvement ( toujours sortie )
        - bouton: Enregistrer -> mouvement_adidy 
[ok]


- Module 5: Voir historique de l'utilisaiton de adidy:
    - tableau affichant les mouvement_adidy 
[ok]


### PART 06: 
- Module 1: Export Excel
        - liste des eleves
        - lsite des cheftaine
        - historique datées
            - rakitra
            - assurance
            - adidy 


- Module 2: Export CSV
        - liste des eleves
        - lsite des cheftaine
        - historique datées
            - rakitra
            - assurance
            - adidy 


- Module 3: Export PDF
        - liste des eleves
        - lsite des cheftaine
        - historique datées
            - rakitra
            - assurance
            - adidy 


- Module 4: Liste de Tarika 
    - Creer les tables: 
        - role_tarika:
            * id
            * role varchar 100 ( LT, ZT , kibony )
        - tarika:
            * id 
            * nom varchar 100 not null
            * image varchar 100 not null 
            * date_creation 
        - membre_tarika:
            * id 
            * id_tarika
            * id_membre
            * id_role_tarika
            * date 
    - creer son entity, repository, service, controler 
    - Ajout de menu 'Tarika' dans le navbar ( la barre de navigation laterale gauche ) 
    - Creation de la page gestion de Tarika: page-tarika.jsp
    - Ajout de bouton 'Nouvel Tarika' -> creation de nouvel nom tarika : tarika-form.jsp
        - Nom
        - images ( parcourir ) -> et on recupere le nom : exemple ( photo.jpg ) ( images se trouves dans src/main/resources/static/images)
        - date de creation : 
        - Bpitpm 'Creer' -> insertion dans la table  dans la table tarika 
[ok]


- Module 5:
        - Affichage en card des Tarika
            - Image de Tarika
            - Nom de tarika 
            - Effectif 
            - Bouton 'Membre Tarika'
[ok]


- Module 6: Membre Tarika
    - Ajout de bouton 'Membre Tarika' -> ouvre la page-membre-tarika.jsp  ( recuperation de id_tarika ):
    - ajout de bouton 'Ajouter un membre' -> recuperer cet id_tarike et ouvre membre-tarika-form.jsp: ( si on doit utiliser javascript, on va peut creer membre-tarika.js a mettre dans src/main/resources/static/javascript
 mmembre-tarika.js ):
        * reference_membre : 
            - Affichge par javascript ( membre-tarika.js )de l'information de cet membre ( en recuperant le id_membre )
                - image ( profile feminine par defaut s'il n'y en a pas )
                - nom et prenom 
        * role_tarika : zokin tarika, zandrin tarika , kibony ( le id_role_tarika )
        * Bouton Ajouter ( saisie multiple ) 
        * Bouton enregistrer:
[ok]



- Module 7: Affichage des membre d'un Tarika par son role_tarika ( image, nom et prenom )
    - Affichage nom de tarika 
        - zokin'ny tarika
        - kibony
        - zandrin'ny tarika
[ok]



### PART 07
- Module 1: Gestion de Fiche technique
    - Ajout de bouton 'Fiche technique' dans le navbar ( la barre de navigation laterale gauche )
    - Creation de la page gestion de Fiche technique 
    - Ajout de bouton 'Nouvelle fiche technique' -> creation de nouvel nom fiche technique
        - fiche_technique:
            - titre
            - annee
            - numero_trimestre
            * Bouton 'Creer' -> creation de nouvel nom fiche_technique

- Module 2: Affichage en card de toutes les fiche technique ( titre + annee + numero_trimestre )
    - Bouton 'Voir plus' -> ouvre la page de gestion de cette fiche technique


- Module 2:apres clique de ce card -> ouvre Gestion des informations completes d'une fiche technique ( info_fiche_technique )
    - Fiche_technique_info:
        - id_fiche_technique
        - faritra
        - tenin_andriamanitra
        - tarigetra 
        - toerana_ivoriana
        - andro_ivoriana
        - ora_fvoriana ( varchar )
        - ny_tonia
        - komitim_pivondronana
        - filoha 
        - daty_iraisana textArea
        - objectif textArea
        - tompon_andraikitra text
        * Bouton : 'Enregistrer' -> creation de nouvel nom fiche_technique_info


- Module 3: Gestion des activites d'une fiche technique
    - activite_fiche_technique: ( saisie multiple )
        - id_fiche_technique
        - daty
        - lohahevitra
        - fomba_fampiasa
        - sahanasa
        - tomponandraikitra
        - fanamarihana
        * Bouton : 'Ajouter' -> creation de nouvelle activite_fiche_technique


- Module 4: ajout de bouton : Voir fiche technique:
    - affchage en mise en forme de la fiche technique:
        - informations de la fiche technique en haut
        - tableau des activites en bas


- Module 5: modification et suppression possible pour chaque ligne de activite_fiche_technique
    - Modification: ouvre la form pour modifier les informations de cette activite_fiche_technique
    - Suppression: supprime cette activite_fiche_technique


- Module 6: Export PDF de la fiche technique ( informations + tableau des activites )


### PART 08:
- Module 1: Gestion de Camp ( Lasy )
    - Ajout de bouton 'Gestion de Camp' dans le navbar ( la barre de navigation laterale gauche )
    - Creation de la page gestion de Camp 
    - Ajout de bouton 'Nouvelle Camp' -> creation de nouvel nom Camp
        - titre
        - date_debut
        - date_fin
        - lieu
        * Bouton 'Creer' -> creation de nouvel camp dans la table camp

    
- Module 2: gestion informatiion d'un camp
    - camp_info:
        - id_camp
        - sampana
        - faritany
        - faritra
        - fivondronana
        - andiany
        - tarigetra
        - tenin_andriamanitra
        - objectif text
        - fandraharahana
        - fitaovana
        - ara_panahy
        - fientanana
        - fahasalamana
        - isa_mpilasy
        - fitanterana
        - toerana_hiaingana
        - toerana_hiverenana
        * Bouton : enregistrer -> creation de nouvel nom camp_info


- Module 3: gestion activite d'un camps ( ajout multiple )
    - activite_camp:
        - id_camp_info
        - antony
        - quantite
        - prix_unitaire
        - montant ( affiche automatiquement par un JS )
        - type_mouvement ( entree / sortie )
        * Bouton : 'Ajouter' -> creation de nouvelle activite_camp


- Module 4: ajout de bouton : Voir fiche camp:
    - affchage en mise en forme de la fiche camp:
        - informations de la fiche camp en haut
        - tableau des activites en bas


- Module 5: modification et suppression possible pour chaque ligne de activite_camp
    - Modification: ouvre la form pour modifier les informations de cette activite_camp
    - Suppression: supprime cette activite_camp


- Module 6: Export PDF de la fiche camp ( informations + tableau des activites )


### PART 09:
- Module 1: Gestion de Agenda ( Activites )
    - Ajout de bouton 'Gestion de Agenda' dans le navbar ( la barre de navigation laterale gauche )
    - Creation de la page gestion de Agenda
    - Ajout de bouton 'Nouvelle Activite' -> creation de nouvel nom Activite
        - titre
        - date_creation
        - date_utilisation
        - contenu 
        * Bouton 'Creer' -> creation de nouvel Activite dans la table agenda


- Module 2: Dans agenda.jsp par exmeple, affichage en card rectangulaire de toutes les acitvites dans agenda :
    - titre, date_utilisation , 
    - affichage 3 jours avant la date_utilisation : couleur orange
    - affichage 1 jour avant la date_utilisation : couleur rouge
    - sinon , on affiche pas 
    + filtre date min max pour voir les activites deja passées


### PART 10:
- Module 1: Gestion de Background
    - ajout de theme :
        - theme sombre : activer ou desactiver


=======================================
# ANALYSE DES BESOINS ET DE L'EXISTANT
=======================================
- Adhesion de nouvelle membre 
    - Gestion de role pour chaque membre:
        - Cheftaine
        - Eleves
[ok]


- Fiche individuelle ( hon ankizy )
[ok]


- Suivi de presence:
    - Hebdomadaire
    - Mensuel 
[ok]


- Visites des parents 
[ok]


- Gestion de 
    - Rakitra 
[ok]


- Gestion 
    - Assurance:
        - Assurance voronkely
        - Assurance mpiandraikitra
        - Assurance RAD
[ok]


- gestion 
    - Adidy:
        - Adidy voronkely
        - Adidy mpiandraikitra
        - Adidy RAD
[ok]


- Tarika et ses membres
[ok]


- Fiche technique
- Gestion des Activites: ( Agenda )
    - Activite mensuelle 
    - - Fandharana herintaona 
[ok]

- Gestion de Camp ( Lasy )
[ok]


### SURPLUS ( BONUS )
- Mode dark / mode light 

- photo ( format galerie de voronkely )

- Bloc note ( notification ) agenda 

- Statistique;  ( graphe )
    - variation du nombre des eleves presents pour chaque seance 
    - Variation de cotisation 

- 


# IREO MIANDRY KELY
- PART : 01
    - Module : 7
    - Fonctionnalite: Modificaiton de la fiche -> revenir a la formulaire + Suppression
--------------------------------------------------------------
- PART : 04
    - Module : 2 
    - Fonctionnalite: rehcerhce de membre multiciritere 
--------------------------------------------------------------
- PART : 06
    - Module : 1, 2, 3
    - Fonctionnalite:  Export en EXCEL, CSV, PDF des lsite eleves, cheftaines , etc.... 
--------------------------------------------------------------
- PART : 
    - Module : 
    - Fonctionnalite: 
--------------------------------------------------------------
- PART : 
    - Module : 
    - Fonctionnalite: 
--------------------------------------------------------------