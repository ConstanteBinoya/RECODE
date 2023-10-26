/*Este código JavaScript faz o seguinte: permite alternar a visibilidade dos destinos nacionais e internacionais na página, com base no botão que o usuário clica.

1) Ele aguarda o carregamento completo do DOM do documento usando document.addEventListener('DOMContentLoaded', function() {...}.

2) Captura os botões com as IDs btnNacional e btnInternacional e as áreas (divs) de destinos nacionais e internacionais com as IDs cardNacional e cardInternacional.

3) Define eventos de clique para o botão "Nacional" e o botão "Internacional". Quando o botão "Nacional" é clicado, ele mostra os destinos nacionais e oculta os destinos internacionais. Quando o botão "Internacional" é clicado, ele faz o oposto, mostrando os destinos internacionais e ocultando os destinos nacionais.*/

// Espera até que o DOM (Document Object Model) esteja totalmente carregado
document.addEventListener('DOMContentLoaded', function() {
    // Captura os botões de nacional e internacional
    const btnNacional = document.getElementById('btnNacional');
    const btnInternacional = document.getElementById('btnInternacional');

    // Captura as áreas (divs) onde estão os destinos nacionais e internacionais
    const cardNacional = document.getElementById('cardNacional');
    const cardInternacional = document.getElementById('cardInternacional');

    // Define eventos de clique para o botão "Nacional"
    btnNacional.addEventListener('click', function() {
        // Quando o botão "Nacional" é clicado:
        // Mostra os destinos nacionais e oculta os destinos internacionais
        cardNacional.style.display = 'block';
        cardInternacional.style.display = 'none';
    });

    // Define eventos de clique para o botão "Internacional"
    btnInternacional.addEventListener('click', function() {
        // Quando o botão "Internacional" é clicado:
        // Mostra os destinos internacionais e oculta os destinos nacionais
        cardNacional.style.display = 'none';
        cardInternacional.style.display = 'block';
    });

    // Define o padrão inicial para destinos nacionais (mostra os destinos nacionais)
    cardNacional.style.display = 'block';
    cardInternacional.style.display = 'none';
});
