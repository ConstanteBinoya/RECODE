<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%> 

<!DOCTYPE html>
<html lang="pr-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Conhe�a a Binatur, a ag�ncia de viagens brasileira, que transforma sonhos em realidade! 
    Explore destinos nacionais e internacionais com conforto, qualidade e excel�ncia em todos os aspectos. Descubra o mundo e 
    viva experi�ncias inesquec�veis com a Binatur."> <!--SEO-->
    <title>BinaTur | Viagens |Cadastro | Ag�ncia de Viagens</title>

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
                                            <a class="nav-link" href="../_html/promocoes.html">Promo��es</a>
                                        </li>
                                        <li class="nav-item dropdown" id="menu">
                                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
                                                role="button" aria-expanded="false">Menu</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="../_html/login.html"><img
                                                            src="../_img/sevicoConta.png"
                                                            alt="�cone de acesso a conta."> Minha conta</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divis�ria -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoDrop.png"
                                                            alt="�cone de serevi�os de viagem."> Pedidos</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divis�ria -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoClub.png" alt="�cone de club vip.">
                                                        Bina-Club</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divis�ria -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoAjuda.png"
                                                            alt="�cone de acontato e ajuda."> Ajuda</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divis�ria -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoEquipe.png" alt="�cone de equipe."> Quem
                                                        somos</a></li>
                                                <li class="dropdown-divider"></li> <!-- Linha divis�ria -->

                                                <li><a class="dropdown-item" href="../_html/error.html"> <img
                                                            src="../_img/sevicoCondicoes.png"
                                                            alt="�cone de termos e condi��es."> Termos e condi��es</a>
                                                </li>
                                                <li class="dropdown-divider"></li> <!-- Linha divis�ria -->

                                                <li><a class="dropdown-item" href="../_html/error.html"><img
                                                            src="../_img/sevicoCancelamento.png"
                                                            alt="�cone de cancelamento."> pol�ticas de cancelamento</a>
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

        <section>
            <div id="formAvaliador" class="container border">
                <div id="cliente-form" class="container">
                    <form>
                        <div class="tituloForm">
                            <h1 class="container">Dados do cliente</h1>
                        </div>
                        <div class="form-group">
                            <label for="nome">Nome completo:</label>
                            <input type="text" class="form-control" id="nome" placeholder="Ex: Jo�o da Silva"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail:</label>
                            <input type="text" class="form-control" id="email" placeholder="Ex: seu_email@mail.com"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="telefone">Telefone:</label>
                            <input type="text" class="form-control" id="telefone" placeholder="Ex: (xx) x.xxxx-xxxx"
                                required>
                        </div>
                        <button id="btn-cadastro-cliente" type="submit" class="btn btn-primary">CADASTRAR</button>
                    </form>
                </div>
                
                <div id="consulta-form" class="container">
                    <div class="tituloForm">
                        <h1 class="container">Consultar, Editar e Excluir Cliente</h1>
                    </div>
                    <form>
                        <div class="form-group">
                            <label for="consulta-id">ID do Cliente:</label>
                            <input type="number" class="form-control" id="consulta-id" placeholder="Informe seu ID">
                        </div>
                        <button id="btn-consultar" type="button" class="btn btn-primary">Consultar</button>
                        <button id="btn-editar" type="button" class="btn btn-primary">Editar</button>
                        <button id="btn-excluir" type="button" class="btn btn-danger">Excluir</button>
                    </form>
                </div>
            </div>
            
            
            <jstl:forEach items="${listaCadastro}" var="cadastro">
                <tr>
                    <td>${cadastro.nome}</td>
                    <td>${cadastro.fone}</td>
                   <td>${cadastro.email}</td>
                    <td>
                        <a href="cadastrar?id_cliente=${cadastro.id_cliente}" class="btn btn-primary">Cadastrar</a>
                        <a href="consultar?id_cliente=${cadastro.id_cliente}" class="btn btn-primary">Consultar</a>
                        <a href="editar?id_cliente=${cadastro.id_cliente}" class="btn btn-primary">Editar</a>
                        <a href="excluir?id_cliente=${cadastro.id_cliente}" onclick="return confirm('Deseja Excluir?')" class="btn btn-danger">Excluir</a>
                    </td>
                </tr>
            </jstl:forEach>

        </section>
    </div> <!--interface-->

    <!--<script>
        const clientes = []; // Array para armazenar os dados dos clientes

        // Fun��o para cadastrar um cliente
        document.getElementById('btn-cadastro-cliente').addEventListener('click', () => {
            const nome = document.getElementById('nome').value;
            const email = document.getElementById('email').value;
            const telefone= document.getElementById('telefone').value;

            // Valida��o dos campos
            if (!nome || !email || !telefone) {
                alert('Preencha todos os campos.');
                return;
            }

            // Cria um novo cliente
            const cliente = {
                id: clientes.length + 1, // Simples contagem de clientes
                nome: nome,
                email: email,
                telefone: telefone
            };

            // Adiciona o cliente ao array
            clientes.push(cliente);

            // Limpa os campos de entrada
            document.getElementById('nome').value = '';
            document.getElementById('email').value = '';
            document.getElementById('telefone').value = '';

            // Atualiza a tabela
            atualizarTabelaClientes();
        });

        // Fun��o para consultar um cliente
        document.getElementById('btn-consultar').addEventListener('click', () => {
            const consultaId = parseInt(document.getElementById('consulta-id').value);
            const cliente = clientes.find(c => c.id === consultaId);

            if (cliente) {
                // Preenche os campos com os dados do cliente
                document.getElementById('nome').value = cliente.nome;
                document.getElementById('email').value = cliente.email;
                document.getElementById('telefone').value = cliente.telefone;
            } else {
                alert('Cliente n�o encontrado.');
            }
        });

        // Fun��o para editar um cliente
        document.getElementById('btn-editar').addEventListener('click', () => {
            const consultaId = parseInt(document.getElementById('consulta-id').value);
            const clienteIndex = clientes.findIndex(c => c.id === consultaId);

            if (clienteIndex !== -1) {
                // Atualiza os dados do cliente com base nos campos de entrada
                clientes[clienteIndex].nome = document.getElementById('nome').value;
                clientes[clienteIndex].email = document.getElementById('email').value;
                clientes[clienteIndex].telefone = document.getElementById('telefone').value;

                // Limpa os campos de entrada
                document.getElementById('nome').value = '';
                document.getElementById('email').value = '';
                document.getElementById('telefone').value = '';

                // Atualiza a tabela
                atualizarTabelaClientes();
            } else {
                alert('Cliente n�o encontrado.');
            }
        });

        // Fun��o para excluir um cliente
        document.getElementById('btn-excluir').addEventListener('click', () => {
            const consultaId = parseInt(document.getElementById('consulta-id').value);
            const clienteIndex = clientes.findIndex(c => c.id === consultaId);

            if (clienteIndex !== -1) {
                // Remove o cliente do array
                clientes.splice(clienteIndex, 1);

                // Limpa os campos de entrada
                document.getElementById('nome').value = '';
                document.getElementById('email').value = '';
                document.getElementById('telefone').value = '';

                // Atualiza a tabela
                atualizarTabelaClientes();
            } else {
                alert('Cliente n�o encontrado.');
            }
        });

        // Fun��o para atualizar a tabela de clientes
        function atualizarTabelaClientes() {
            const tableBody = document.querySelector('#clientes-table tbody');
            tableBody.innerHTML = '';

            clientes.forEach(cliente => {
                const row = tableBody.insertRow();
                row.innerHTML = `<td>${cliente.id}</td><td>${cliente.nome}</td><td>${cliente.email}</td><td>${cliente.telefone}</td><td><button class="btn btn-info">Editar</button> <button class="btn btn-danger">Excluir</button></td>`;
            });
        }
    </script>-->

</body>

</html>

