document.addEventListener('DOMContentLoaded', () => {
    setTimeout(() => {
        const modal = document.getElementById('success-modal-overlay');
        if (modal) modal.remove();
    }, 2000);
});