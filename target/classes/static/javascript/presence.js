document.addEventListener("DOMContentLoaded", function () {


    const form = document.getElementById("presence-form");
    const container = document.getElementById("presence-data");


    form.addEventListener("submit", function () {

        container.innerHTML = "";


        document.querySelectorAll(".presence-check")
            .forEach(function (checkbox) {


                const idMembre = checkbox.dataset.id;


                // id membre
                const inputId = document.createElement("input");
                inputId.type = "hidden";
                inputId.name = "idMembre";
                inputId.value = idMembre;


                // présence true/false
                const inputPresent = document.createElement("input");
                inputPresent.type = "hidden";
                inputPresent.name = "present";
                inputPresent.value = checkbox.checked;


                container.appendChild(inputId);
                container.appendChild(inputPresent);


            });


    });


});