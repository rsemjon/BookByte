// sort.js
document.addEventListener("DOMContentLoaded", () => {

    const priceSlider   = document.getElementById("priceSlider");
    const priceMinLabel = document.getElementById("priceMinLabel");
    const priceMaxLabel = document.getElementById("priceMaxLabel");
    const minInput      = document.getElementById("priceMinInput");
    const maxInput      = document.getElementById("priceMaxInput");

    const globalMin   = parseFloat(priceSlider.dataset.min);
    const globalMax   = parseFloat(priceSlider.dataset.max);
    const selectedMin = parseFloat(minInput.value) || globalMin;
    const selectedMax = parseFloat(maxInput.value) || globalMax;

    noUiSlider.create(priceSlider, {
        start  : [selectedMin, selectedMax],
        connect: true,
        range  : { min: globalMin, max: globalMax },
        step   : 1,
        format : {
            to  : v => Math.round(v) + "€",
            from: v => Number(v.replace("€", ""))
        }
    });

    priceSlider.noUiSlider.on("update", (values, handle) => {
        if (handle === 0) {
            priceMinLabel.textContent = values[0];
        } else {
            priceMaxLabel.textContent = values[1];
        }
        minInput.value = values[0].replace("€", "");
        maxInput.value = values[1].replace("€", "");
    });

    document.getElementById("sortSelect")?.addEventListener("change", function () {
        const url = new URL(window.location.href);
        url.searchParams.set("sortOption", this.value);
        window.location.href = url.href;
    });

    const iconUp   = '<i class="bi bi-chevron-up"></i>';
    const iconDown = '<i class="bi bi-chevron-down"></i>';

    document.querySelectorAll(".toggle-filter").forEach(btn => {
        const targetId  = btn.dataset.target;
        const targetDiv = document.getElementById(targetId);
        const storageKey = "filter-" + targetId;

        const saved = localStorage.getItem(storageKey);
        if (saved === "open") {
            targetDiv.style.display = "block";
            btn.innerHTML = iconUp;
        } else {
            targetDiv.style.display = "none";
            btn.innerHTML = iconDown;
        }

        btn.addEventListener("click", function () {
            const isHidden = targetDiv.style.display === "none";
            if (isHidden) {
                targetDiv.style.display = "block";
                btn.innerHTML = iconUp;
                localStorage.setItem(storageKey, "open");
            } else {
                targetDiv.style.display = "none";
                btn.innerHTML = iconDown;
                localStorage.setItem(storageKey, "closed");
            }
        });
    });
});
