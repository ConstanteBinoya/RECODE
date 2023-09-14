// inverterPartidaDestino: para inverter valores no menpu destino
function inverterPartidaDestino() {
    const partida = document.getElementById("localPartida").value;
    const destino = document.getElementById("localDestino").value;
    document.getElementById("localPartida").value = destino;
    document.getElementById("localDestino").value = partida;
}
// FIM - inverterPartidaDestino: para inverter valores no menpu destino

// carousel com opção de IR E VOLTAR clicando
const carousel = document.getElementById('carousel');
let currentIndex = 0;

function nextSlide() {
    currentIndex++;
    if (currentIndex >= carousel.children.length) {
        currentIndex = 0;
    }
    updateCarousel();
}

function prevSlide() {
    currentIndex--;
    if (currentIndex < 0) {
        currentIndex = carousel.children.length - 1;
    }
    updateCarousel();
}

function updateCarousel() {
    carousel.style.transform = `translateX(-${currentIndex * 500}px)`;
}
        // FIM - carousel com opção de IR E VOLTAR clicando
