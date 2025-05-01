{{-- components/alert.blade.php --}}

<div id="success-modal-overlay" class="position-fixed top-0 start-0 w-100 h-100 d-flex justify-content-center align-items-center" style="background-color: rgba(0, 0, 0, 0.5); z-index: 1050;">

     <!-- Modal Box -->
     <div class="bg-white rounded-5 shadow-lg p-4 text-center position-relative" style="width: 340px; height: 340px;">

          <!-- Close Button -->
          <button class="btn-close position-absolute" style="top: 20px; right: 20px;" onclick="document.getElementById('success-modal-overlay').remove()"></button>

          <!-- Image -->
          <img src="{{ asset('images/mascots/confirm.png') }}" alt="Confirmation Mascot" class="mb-3" style="max-width: 80%; height: auto;">

          <!-- Message -->
          <p class="text-dark fw-bold fs-5">{{ $message }}</p>

     </div>

</div>

<script src="{{ asset('js/alert.js') }}"></script>