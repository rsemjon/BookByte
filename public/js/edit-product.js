document.addEventListener('DOMContentLoaded', () => {
    const fileInput    = document.getElementById('hiddenImageInput');
    const addBtn       = document.getElementById('addImageButton');
    const preview      = document.getElementById('imagePreview');
    const deleteHolder = document.getElementById('deletePlaceHolder');

    const dt = new DataTransfer();

    // existing photos
    preview.querySelectorAll('.delete-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            const wrap = btn.closest('.image-wrapper');

            const hidden = document.createElement('input');
            hidden.type  = 'hidden';
            hidden.name  = 'delete_existing[]';
            hidden.value = btn.dataset.path;
            deleteHolder.appendChild(hidden);

            wrap.remove();
        });
    });

    // plus square
    addBtn.addEventListener('click', () => fileInput.click());

    // new files
    fileInput.addEventListener('change', e => {
        [...e.target.files].forEach(file => {
            dt.items.add(file);

            const reader = new FileReader();
            reader.onload = ev => {
                const wrap = document.createElement('div');
                wrap.className = 'image-wrapper position-relative';
                wrap.innerHTML = `
                    <img src="${ev.target.result}" class="w-100 h-100 object-fit-cover rounded">
                    <button type="button" class="btn btn-danger btn-sm position-absolute top-0 end-0 m-1">
                        <i class="bi bi-x-lg"></i>
                    </button>`;
                wrap.querySelector('button').onclick = () => {
                    const idx = [...dt.files].indexOf(file);
                    dt.items.remove(idx);
                    wrap.remove();
                    fileInput.files = dt.files;
                };
                preview.insertBefore(wrap, addBtn);
            };
            reader.readAsDataURL(file);
        });

        fileInput.files = dt.files;
    });
});
