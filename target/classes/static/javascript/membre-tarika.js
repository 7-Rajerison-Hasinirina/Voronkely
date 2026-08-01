function chercherMembre(input){


    let reference = input.value.trim();


    let ligne = input.closest(".ligne");


    if(reference.length === 0){

        ligne.querySelector(".idMembre").value="";
        ligne.querySelector(".nom").innerHTML="";
        ligne.querySelector(".image-membre").src =
            "/images/profile-female.png";

        return;
    }



    fetch(
        "/membre-tarika/recherche/" + reference
    )

    .then(response => response.json())

    .then(data => {



        if(data.id){


            ligne.querySelector(".idMembre").value =
                data.id;



            ligne.querySelector(".nom").innerHTML =
                data.nomPrenom;



            ligne.querySelector(".image-membre").src =
                "/images/" + data.image;



        }
        else{


            ligne.querySelector(".idMembre").value="";


            ligne.querySelector(".nom").innerHTML =
                "Membre introuvable";


            ligne.querySelector(".image-membre").src =
                "/images/profile-female.png";


        }



    });



}





function ajouterLigne(){


    let modele =
        document.querySelector(".ligne");



    let clone =
        modele.cloneNode(true);



    clone.querySelector(".reference").value="";

    clone.querySelector(".idMembre").value="";

    clone.querySelector(".nom").innerHTML="";


    clone.querySelector(".image-membre").src =
        "/images/profile-female.png";



    document
    .getElementById("liste")
    .appendChild(clone);


}







document.addEventListener("DOMContentLoaded", () => {

    const liste = document.getElementById("listeMembres");
    const ajouterBtn = document.getElementById("ajouter");
    const btnEnregistrer = document.getElementById("btnEnregistrer");

    function anyValid() {
        return Array.from(liste.querySelectorAll('.idMembre')).some(i => i.value && i.value.trim() !== '');
    }

    function updateSubmitState() {
        if (!btnEnregistrer) return;
        btnEnregistrer.disabled = !anyValid();
    }

    function setupRow(row) {
        const reference = row.querySelector('.reference');
        const idMembreHidden = row.querySelector('.idMembre');
        const photo = row.querySelector('.photo');
        const nomPrenom = row.querySelector('.nomPrenom');
        const referenceAffiche = row.querySelector('.referenceAffiche');

        function vider() {
            if (idMembreHidden) idMembreHidden.value = '';
            if (photo) {
                photo.style.display = 'none';
                photo.src = '';
            }
            if (nomPrenom) nomPrenom.textContent = 'Aucun membre';
            if (referenceAffiche) referenceAffiche.textContent = '--';
            updateSubmitState();
        }

        if (!reference) return;

        reference.addEventListener('keyup', () => {
            const valeur = reference.value.trim();

            if (valeur.length === 0) {
                vider();
                return;
            }

            fetch('/membre-tarika/recherche?reference=' + encodeURIComponent(valeur))
                .then(response => {
                    if (!response.ok) throw new Error();
                    return response.json();
                })
                .then(membre => {
                    if (membre == null) {
                        vider();
                        return;
                    }

                    if (idMembreHidden) {
                        idMembreHidden.value = membre.id;
                        idMembreHidden.disabled = false;
                    }
                    if (nomPrenom) nomPrenom.textContent = membre.nomPrenom;
                    if (referenceAffiche) referenceAffiche.textContent = membre.reference;

                    if (membre.image && membre.image !== '') {
                        if (photo) {
                            photo.src = '/images/' + membre.image;
                            photo.style.display = 'block';
                        }
                    } else {
                        if (photo) {
                            photo.style.display = 'none';
                            photo.src = '';
                        }
                    }

                    // enable role select in this row
                    const select = row.querySelector('select[name="idRoleTarika"]');
                    if (select) select.disabled = false;

                    updateSubmitState();

                })
                .catch(() => {
                    vider();
                });

        });

    }

    // initialize existing rows
    if (liste) {
        liste.querySelectorAll('.membre-row').forEach(setupRow);
    }

    if (ajouterBtn) {
        ajouterBtn.addEventListener('click', () => {
            const first = liste.querySelector('.membre-row');
            if (!first) return;

            const clone = first.cloneNode(true);

            // clear inputs in clone and disable hidden id and role select until member found
            clone.querySelectorAll('input').forEach(i => {
                if (i.type === 'hidden') { i.value = ''; i.disabled = true; }
                else if (i.type === 'text') i.value = '';
            });

            clone.querySelectorAll('select').forEach(s => { s.selectedIndex = 0; s.disabled = true; });

            clone.querySelectorAll('.photo').forEach(p => { p.style.display = 'none'; p.src = ''; });

            clone.querySelectorAll('.nomPrenom').forEach(n => n.textContent = 'Aucun membre');
            clone.querySelectorAll('.referenceAffiche').forEach(r => r.textContent = '--');

            liste.appendChild(clone);

            setupRow(clone);

            updateSubmitState();
        });
    }

    updateSubmitState();

});