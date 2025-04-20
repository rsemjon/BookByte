document.addEventListener('DOMContentLoaded', () => {
    updateRowBorders();
});


async function post(url, data = {}) {

    const res = await fetch(url, {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': window.csrfToken,
            'Accept': 'application/json'
        },
        body: new URLSearchParams(data)
    });

    return res.json();
}

function recalcTotal() {
    let total = 0;

    document.querySelectorAll('.price').forEach(p => {
        const price = parseFloat(p.dataset.price);
        const id = p.closest('div[id^=row-]').id.split('-')[1];
        const qty = parseInt(document.getElementById('qty-' + id).textContent);
        total += price * qty;
    });

    document.getElementById('total-price').textContent = total.toFixed(2) + '€';
}

function changeQty(id, delta) {
    const qtyEl = document.getElementById('qty-' + id);
    const currentQty = parseInt(qtyEl.textContent, 10);
    const newQty     = currentQty + delta;

    if (newQty < 1) {
        removeItem(id);
        return;
    }

    post(window.cartUpdateUrl.replace(':id', id), { qty: newQty })
        .then(() => {
            qtyEl.textContent = newQty;

            const minusBtn = qtyEl.parentElement.querySelector('button:first-child');
            const plusBtn  = qtyEl.parentElement.querySelector('button:last-child');
            const maxQty   = parseInt(qtyEl.dataset.maxQty || 999, 10);

            minusBtn.disabled = false; 
            plusBtn.disabled  = newQty >= maxQty;

            recalcTotal();
        });
}


function removeItem(id) {

    post(window.cartRemoveUrl.replace(':id', id)).then(() => {
        const row = document.getElementById('row-' + id);

        if (row) 
            row.remove();

        recalcTotal();
        updateRowBorders();

        if (document.querySelectorAll('[id^="row-"]').length === 0) {
            location.reload();
        }
    });
}

function updateRowBorders() {

    const rows = Array.from(document.querySelectorAll('[id^="row-"]'));
    rows.forEach(r => r.classList.add('border-bottom'));

    if (rows.length > 0) {
        rows[rows.length - 1].classList.remove('border-bottom');
    }
}
