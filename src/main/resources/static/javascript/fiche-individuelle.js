document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("[data-repeatable]").forEach(function (container) {
        var template = container.querySelector("[data-repeatable-row]");
        var addButton = container.querySelector("[data-add-row]");

        if (!template || !addButton) {
            return;
        }

        addButton.addEventListener("click", function () {
            var row = template.cloneNode(true);
            row.querySelectorAll("input, textarea, select").forEach(function (field) {
                field.value = "";
            });
            container.querySelector("[data-repeatable-rows]").appendChild(row);
            updateRemoveButtons(container);
        });

        container.addEventListener("click", function (event) {
            if (!event.target.matches("[data-remove-row]")) {
                return;
            }
            var rows = container.querySelectorAll("[data-repeatable-row]");
            if (rows.length > 1) {
                event.target.closest("[data-repeatable-row]").remove();
                updateRemoveButtons(container);
            }
        });

        updateRemoveButtons(container);
    });
});

function updateRemoveButtons(container) {
    var rows = container.querySelectorAll("[data-repeatable-row]");
    rows.forEach(function (row) {
        var button = row.querySelector("[data-remove-row]");
        if (button) {
            button.disabled = rows.length === 1;
        }
    });
}
