document.addEventListener("DOMContentLoaded", function () {
    const deliveryOptions = document.querySelectorAll('input[name="deliveryMethod"]');

    const collapsibleSections = {
        HOME: document.getElementById("address_info"),
        DROP_BOX: document.getElementById("drop_box_locations"),
        STORE: document.getElementById("store_pickup_locations"),
    };

    const collapses = {
        HOME: new bootstrap.Collapse(collapsibleSections.HOME, { toggle: false }),
        DROP_BOX: new bootstrap.Collapse(collapsibleSections.DROP_BOX, { toggle: false }),
        STORE: new bootstrap.Collapse(collapsibleSections.STORE, { toggle: false }),
    };

    function clearSection(section) {
        const inputs = section.querySelectorAll('input');
        inputs.forEach(input => {
            if (input.type === 'radio' || input.type === 'checkbox') {
                input.checked = false;
            } else {
                input.value = '';
            }
        });
    }

    function handleSelection(selected) {
        Object.entries(collapsibleSections).forEach(([key, section]) => {
            if (key !== selected) {
                collapses[key].hide();
                clearSection(section);
            }
        });

        collapses[selected].show();
    }

    deliveryOptions.forEach(option => {
        option.addEventListener("change", function () {
            handleSelection(this.value);
        });
    });

    const selected = document.querySelector('input[name="deliveryMethod"]:checked');
    if (selected) {
        handleSelection(selected.value);
    }
});
