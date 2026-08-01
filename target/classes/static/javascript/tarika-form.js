document.addEventListener("DOMContentLoaded", function () {

    const inputImage = document.querySelector('input[name="imageFile"]');

    if (!inputImage) {
        return;
    }

    const maxSize = 5 * 1024 * 1024;

    const preview = document.createElement("img");
    preview.className = "img-thumbnail mt-3";
    preview.style.maxWidth = "250px";
    preview.style.display = "none";

    inputImage.parentNode.appendChild(preview);

    const fileName = document.createElement("div");
    fileName.className = "text-muted mt-2";

    inputImage.parentNode.appendChild(fileName);

    inputImage.addEventListener("change", function () {

        preview.style.display = "none";
        fileName.innerHTML = "";

        if (this.files.length === 0) {
            return;
        }

        const file = this.files[0];

        if (!file.type.startsWith("image/")) {

            alert("Veuillez sélectionner une image.");

            this.value = "";

            return;
        }

        if (file.size > maxSize) {

            alert("La taille maximale est de 5 Mo.");

            this.value = "";

            return;
        }

        fileName.innerHTML =
                "<strong>Fichier :</strong> " +
                file.name +
                "<br><strong>Taille :</strong> " +
                (file.size / 1024 / 1024).toFixed(2) +
                " Mo";

        const reader = new FileReader();

        reader.onload = function (e) {

            preview.src = e.target.result;
            preview.style.display = "block";

        };

        reader.readAsDataURL(file);

    });

});