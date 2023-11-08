<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<html lang="pr-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Conheça a Binatur, a agência de viagens brasileira, que transforma sonhos em realidade! 
    Explore destinos nacionais e internacionais com conforto, qualidade e excelência em todos os aspectos. Descubra o mundo e 
    viva experiências inesquecíveis com a Binatur."> <!--SEO-->
    <title>BinaTur | Viagens |Cadastro | Agência de Viagens</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="../_css/avaliador.css">
</head>
<body>
    <div id="interface">
        <header id="cabecalho">
            <!--Nav-bar com bootstrap:=============================================================================================== -->
            <div class="container-fluid border" id="cabecalhoSup">
                <div class="row">
                    <div class="col-md-2">
                        <a href="../index.html"><img src="../_img/logoAzul.png" alt="Logo binatur em azul."></a>
                    </div>
                    <div class="col">
                        <nav class="navbar navbar-expand-lg bg-body-tertiary p-1">
                            <div class="container-fluid">
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarScroll">
                                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
                                        style="--bs-scroll-height: 100px;">
                                        <li class="nav-item">
                                            <a class="nav-link active" aria-current="page" href="../index.html">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="../_html/cadastro.html">Cadastro</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="../_html/promocoes.html">Promoções</a>
                                        </li>
                                        <li class="nav-item dropdown" id="menu">
                                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
                                                role="button" aria-expanded="false">Menu</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="../_html/login.html"><img
                                                            src="../_img/sevicoConta.png"
                                                            alt="Ícone de acesso a conta."> Minha conta</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divisória -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoDrop.png"
                                                            alt="Ícone de sereviços de viagem."> Pedidos</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divisória -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoClub.png" alt="Ícone de club vip.">
                                                        Bina-Club</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divisória -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoAjuda.png"
                                                            alt="Ícone de acontato e ajuda."> Ajuda</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divisória -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoEquipe.png" alt="Ícone de equipe."> Quem
                                                        somos</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divisória -->

                                                <li><a class="dropdown-item" href="../_html/error.html"> <img
                                                            src="../_img/sevicoCondicoes.png"
                                                            alt="Ícone de termos e condições."> Termos e condições</a>
                                                </li>
                                                <li class="dropdown-divider"></li> <!-- Linha divisória -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoCancelamento.png"
                                                            alt="Ícone de cancelamento."> políticas de cancelamento</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <form class="d-flex" role="search">
                                        <input class="form-control me-2" type="search" placeholder="Buscar"
                                            aria-label="Search">
                                        <button class="btn btn-primary" type="submit">Buscar</button>
                                    </form>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <!--Fim - Nav-bar com bootstrap:========================================================================================-->
        </header>

<body>
    <main>
        <div class="container">
            <h1 class="m-0">
                <img class="logo" src="./assets/logo branca.png" alt="Logotipo">
            </h1>
            <h5>Alteração do destino ${destino.cidade}</h5>
            <form action="editar" method="post" class="form-control">

                <input type="hidden" name="id" value="${contato.id}">
                <p>Nome:</p>
                <p>
                    <input type="text" name="nome" value="${contato.nome}">
                </p>
                <p>Idade:</p>
                <input type="idade" name="idade" value="${contato.idade}">
                <p>
                    <input type="hidden" name="pais" value="${contato.dataCadastro}">
                </p>
               
   
                <button type="submit" class="btn btn-success">Atualizar</button>
            </form>
        </div>
    </main>
</body>

</html>