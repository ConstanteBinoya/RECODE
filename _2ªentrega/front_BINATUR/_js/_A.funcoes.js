function mudaFoto(foto) {
    document.getElementById("icone").src = foto;
}

// JavaScript para funcionamento do carousel
document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;

    function showSlide() {
        slides.forEach((slide) => {
            slide.style.display = 'none';
        });

        slides[currentSlide].style.display = 'block';
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide();
    }

    setInterval(nextSlide, 2000); // Altere o valor em milissegundos para ajustar a velocidade de troca das imagens
});

                   // JavaScript para funcionamento do carousel2
                   document.addEventListener('DOMContentLoaded', function() {
                    const slides = document.querySelectorAll('.slide2');
                    let currentSlide = 0;
                
                    function showSlide() {
                        slides.forEach((slide) => {
                            slide.style.display = 'none';
                        });
                
                        slides[currentSlide].style.display = 'block';
                    }
                
                    function nextSlide() {
                        currentSlide = (currentSlide + 1) % slides.length;
                        showSlide();
                    }
                
                    setInterval(nextSlide, 800); 
                });

