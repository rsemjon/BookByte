document.addEventListener('DOMContentLoaded', () => {
    const fileInput = document.getElementById('hiddenImageInput');
    const addBtn    = document.getElementById('addImageButton');
    const preview   = document.getElementById('imagePreview');

    const dt = new DataTransfer();

    // plus square
    addBtn.addEventListener('click', () => fileInput.click());

    // add files
    fileInput.addEventListener('change', e => {
        [...e.target.files].forEach(file => {
            dt.items.add(file);

            const reader = new FileReader();
            reader.onload = ev => {
                const wrap = document.createElement('div');
                wrap.className = 'image-wrapper position-relative';
                wrap.innerHTML = `
                    <img src="${ev.target.result}" class="w-100 h-100 object-fit-cover rounded">
                    <button type="button"
                            class="btn btn-danger btn-sm position-absolute top-0 end-0 m-1">
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
