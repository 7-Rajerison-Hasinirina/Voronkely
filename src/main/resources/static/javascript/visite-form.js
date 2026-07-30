document.addEventListener("DOMContentLoaded", () => {

    const reference = document.getElementById("reference");
    const idMembre = document.getElementById("idMembre");

    const photo = document.getElementById("photo");
    const nomPrenom = document.getElementById("nomPrenom");
    const referenceAffiche = document.getElementById("referenceAffiche");

    const btnCreer = document.getElementById("btnCreer");

    /**
     * Remet le formulaire à zéro
     */
    function vider() {

        idMembre.value = "";

        photo.style.display = "none";
        photo.src = "";

        nomPrenom.textContent = "Aucun membre";
        referenceAffiche.textContent = "--";

        btnCreer.disabled = true;
    }

    /**
     * Recherche lorsqu'on tape une référence
     */
    reference.addEventListener("keyup", function () {

        const valeur = this.value.trim();

        if (valeur.length === 0) {

            vider();
            return;

        }

        fetch("/visite/recherche?reference=" + encodeURIComponent(valeur))

            .then(response => {

                if (!response.ok) {
                    throw new Error();
                }

                return response.json();

            })

            .then(membre => {

                if (membre == null) {

                    vider();
                    return;

                }

                idMembre.value = membre.id;

                nomPrenom.textContent = membre.nomPrenom;

                referenceAffiche.textContent = membre.reference;

                if (membre.image != null && membre.image !== "") {

                    photo.src = "/images/" + membre.image;

                    photo.style.display = "block";

                } else {

                    photo.style.display = "none";

                }

                btnCreer.disabled = false;

            })

            .catch(() => {

                vider();

            });

    });

});