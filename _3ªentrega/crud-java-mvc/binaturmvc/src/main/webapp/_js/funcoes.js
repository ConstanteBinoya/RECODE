//Lógica para o funcionamento do modal (alerta de cadastro): ========================================================================== 
document.addEventListener('DOMContentLoaded', function () {
    var myModal = new bootstrap.Modal(document.getElementById('modal1'), {
        keyboard: false
    });
    setTimeout(function () {
        myModal.show();
    }, 2000);
});
//Fim - Lógica para o funcionamento do modal (alerta de cadastro): ===================================================================  

// Lógica para modal1 acionar moda2: =================================================================================================
document.addEventListener('DOMContentLoaded', function() {
    // Selecione o botão "Eu quero!" no Modal1
    var modal1Btn = document.getElementById('modalBtn');

    // Selecione o Modal2
    var modal2 = new bootstrap.Modal(document.getElementById('modal2'));

    // Adicione um ouvinte de evento de clique ao botão no Modal1
    modal1Btn.addEventListener('click', function() {
        // Abra o Modal2
        modal2.show();
    });
});
//Fim -  Lógica para modal1 acionar moda2. ============================================================================================

// Lógica para p btn Visitante direcionar para a página de cadastro demonstrativo: ====================================================
document.addEventListener('DOMContentLoaded', function() {
    // Selecione o botão pelo id
    var modalBtnVisitante = document.getElementById('modalBtnVisitante');
    // Adicione um ouvinte de evento de clique
    modalBtnVisitante.addEventListener('click', function() {
      // Redirecione o usuário para a página desejada, por exemplo:
      window.location.href = '_html/cadastro.html';
    });
  });
  //Fim - Lógica para p btn Visitante direcionar para a página de cadastro demonstrativo. =============================================

  // Lógica para p btn Avaliador para a página de cadastro servlet: ====================================================
document.addEventListener('DOMContentLoaded', function() {
    // Selecione o botão pelo id
    var modalBtnAvaliador = document.getElementById('modalBtnAvaliador');
    // Adicione um ouvinte de evento de clique
    modalBtnAvaliador.addEventListener('click', function() {
      // Redirecione o usuário para a página desejada, por exemplo:
      window.location.href = 'binacadastro.jsp';
    });
  });
  //Fim - Lógica para p btn Avaliador para a página de cadastro servlet. =============================================

// Lógica para o funcionamento troca de nacionalidade (alternância dos cards promocionais): ===========================================
document.addEventListener("DOMContentLoaded", function () {
    // Seleciona os botões e as divs
    var btnNacional = document.getElementById("btnNacional");
    var btnInternacional = document.getElementById("btnInternacional");
    var destinoNacional = document.getElementById("destinoNaciolnal");
    var destinoInternacional = document.getElementById("destinoInternacional");

    // Adiciona o evento de clique ao botão "Nacional"
    btnNacional.addEventListener("click", function () {
        destinoNacional.style.display = "block";
        destinoInternacional.style.display = "none";
    });

    // Adiciona o evento de clique ao botão "Internacional"
    btnInternacional.addEventListener("click", function () {
        destinoNacional.style.display = "none";
        destinoInternacional.style.display = "block";
    });

    // Por padrão, exibe o conteúdo do botão "Nacional"
    destinoNacional.style.display = "block";
    destinoInternacional.style.display = "none";
});
//Fim -  Lógica para o funcionamento troca de nacionalidade (alternância dos cards promocionais). =====================================

//Lógica para a transição dos botões de nacionalidade: ================================================================================
document.getElementById("btnNacional").classList.add("active"); // Adiciona a classe 'active' ao botão Nacional por padrão

// Adiciona o evento de clique aos botões
document.getElementById("btnNacional").addEventListener("click", function () {
    document.getElementById("btnNacional").classList.add("active");
    document.getElementById("btnInternacional").classList.remove("active");
});

// Adiciona o evento de clique aos botões
document.getElementById("btnInternacional").addEventListener("click", function () {
    document.getElementById("btnInternacional").classList.add("active");
    document.getElementById("btnNacional").classList.remove("active");
});
//Fim - Lógica para a transição dos botões de nacionalidade. ==========================================================================