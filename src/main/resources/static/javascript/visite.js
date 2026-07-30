const input = document.getElementById("recherche");
const liste = document.getElementById("listeMembres");

input.addEventListener("keyup", function () {

    const mot = input.value.trim();

    fetch("/visite/recherche?mot=" + encodeURIComponent(mot))
        .then(r => r.json())
        .then(data => afficher(data));

});

function afficher(membres){

    liste.innerHTML="";

    membres.forEach(function(m){

        let image;

        if(m.image){

            image=
            `<img src="/images/${m.image}"
                 class="rounded-circle"
                 style="width:90px;height:90px;object-fit:cover;">`;

        }else{

            image=
            `<div
                class="rounded-circle bg-success text-white
                d-flex align-items-center justify-content-center"
                style="width:90px;height:90px;font-size:32px;">
                ${m.nomPrenom.substring(0,1)}
            </div>`;
        }

        liste.innerHTML +=

        `<div class="col-md-4">

            <div class="card shadow-sm">

                <div class="card-body text-center">

                    ${image}

                    <h5 class="mt-3">

                        ${m.nomPrenom}

                    </h5>

                    <p>

                        ${m.reference}

                    </p>

                    <a
                        href="/visite/nouvelle/${m.id}"
                        class="btn btn-success">

                        Sélectionner

                    </a>

                </div>

            </div>

        </div>`;

    });

}