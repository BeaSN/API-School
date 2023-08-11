import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import { Toastify } from 'toastify-js';

function showToast(message) {
    Toastify({
        text: message,
        duration: 3000, // duração em milissegundos
        close: true,
        gravity: 'bottom', // posição do toast
        position: 'right',
        backgroundColor: '#afb5fa',
    }).showToast();
}

window.showToast = showToast;
