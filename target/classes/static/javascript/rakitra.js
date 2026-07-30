document.addEventListener("DOMContentLoaded", function(){


    const montant = document.getElementById("montant");

    const montantRestant = document.getElementById("montantRestant");


    if(montant && montantRestant){


        montant.addEventListener("input", function(){


            montantRestant.value = montant.value;


        });


    }




    const actuel = document.getElementById("montantActuel");

    const deduire = document.getElementById("montantADeduire");

    const nouveau = document.getElementById("nouveauMontant");

    const erreur = document.getElementById("erreurMontant");

    const bouton = document.getElementById("btnEnregistrer");



    if(actuel && deduire){


        deduire.addEventListener("input", function(){



            let montantActuel =
                parseFloat(actuel.value) || 0;


            let montantDeduit =
                parseFloat(deduire.value) || 0;



            let resultat =
                montantActuel - montantDeduit;



            nouveau.value = resultat;



            if(resultat < 0){


                erreur.innerHTML =
                    "Montant insuffisant";


                bouton.disabled = true;


            }
            else{


                erreur.innerHTML = "";


                bouton.disabled = false;


            }



        });



    }



});