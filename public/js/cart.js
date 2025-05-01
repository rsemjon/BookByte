document.addEventListener('DOMContentLoaded', () => {
    updateRowBorders();
    recalcTotal();
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
        const id = p.closest('article[id^=row-]').id.split('-')[1];
        const qty = parseInt(document.getElementById('qty-' + id).textContent);
        total += price * qty;
    });

    const totalEl = document.getElementById('total-price');
    if (totalEl) totalEl.textContent = total.toFixed(2) + '€';
}

function changeQty(id, delta) {

    const qtyEl = document.getElementById('qty-' + id);
    const maxQty = parseInt(qtyEl.dataset.maxQty, 10);
    const curr = parseInt(qtyEl.textContent, 10);
    const next = curr + delta;

    if (next < 1) {
        removeItem(id);
        return;
    }

    if (next > maxQty) 
        return;

    post(window.cartUpdateUrl.replace(':id', id), { qty: next })
        .then(() => {
            qtyEl.textContent = next;

            const minusBtn = qtyEl.parentElement.querySelector('button:first-child');
            minusBtn.disabled = next <= 1;

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

    if (rows.length > 0)
        rows.at(-1).classList.remove('border-bottom');
}
