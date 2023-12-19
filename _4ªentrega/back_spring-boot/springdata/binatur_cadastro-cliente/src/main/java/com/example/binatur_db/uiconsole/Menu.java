//Lógica para um menú de manipulação de testes
//Criei este menu pois não consegui trabalhar com o 'Postman'

package com.example.binatur_db.uiconsole;

import com.example.binatur_db.controllers.ClientController;
import com.example.binatur_db.dtos.ClientRecordDto;
import com.example.binatur_db.models.ClientModel;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import java.util.UUID;

@Component
public class Menu {
    private Scanner scanner;
    private ClientController clientController;

    public Menu(ClientController clientController) {
        this.scanner = new Scanner(System.in);
        this.clientController = clientController;
    }

    public void exibirMenu() {
        int escolha;

        do {
            System.out.println("");
            System.out.println("|======================|");
            System.out.println("|######## MENU ########|");
            System.out.println("|----------------------|");
            System.out.println("| 1. Adicionar Cliente |");
            System.out.println("| 2. Listar Clientes   |");
            System.out.println("| 3. Editar Cliente    |");
            System.out.println("| 4. Excluir Cliente   |");
            System.out.println("| 0. Sair              |");
            System.out.println("|----------------------|");
            System.out.print("|Escolha uma opção:    |");


            escolha = scanner.nextInt();
            scanner.nextLine();

            executarEscolha(escolha);

        } while (escolha != 0);

        scanner.close();
    }

    private void executarEscolha(int escolha) {
        switch (escolha) {
            case 1:
                adicionarCliente();
                break;
            case 2:
                listarClientes();
                break;
            case 3:
                atualizarCliente();
                break;
            case 4:
                excluirCliente();
                break;
            case 0:
                System.out.println("");
                System.out.println("|=================================|");
                System.out.println("|Finalizando o programa. Até mais!|");
                System.out.println("|=================================|");
                break;
            default:
                System.out.println("");
                System.out.println("|================================|");
                System.out.println("|Opção inválida. Tente novamente.|");
                System.out.println("|================================|");
        }
    }

    private void adicionarCliente() {
        try {
            System.out.println("");
            System.out.println("|===========================|");
            System.out.println("|==    Nome do cliente    ==|");
            System.out.println("|===========================|");
            String nome = scanner.nextLine();

            System.out.println("");
            System.out.println("|===========================|");
            System.out.println("|====  CPF do Cliente  ==== |");
            System.out.println("|===========================|");
            String cpf = scanner.nextLine();

            ClientRecordDto clientRecordDto = new ClientRecordDto(nome, cpf);
            clientController.saveClient(clientRecordDto);
            System.out.println("");
            System.out.println("=====================================");
            System.out.println("=| Cliente adicionado com sucesso! |=");
            System.out.println("=====================================");
        } catch (InputMismatchException e) {
            System.out.println("");
            System.out.println("||######################################||");
            System.out.println("||Erro de entrada: Insira um CPF válido.||");
            System.out.println("||######################################||");
            scanner.nextLine();
        }
    }

    private void listarClientes() {
        ResponseEntity<List<ClientModel>> responseEntity = clientController.getAllClients();

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            List<ClientModel> clients = responseEntity.getBody();

            for (ClientModel client : clients) {
                System.out.println("___________________________________________________________________________________________________");
                System.out.println("ID: " + client.getIdClient() + ", Nome: " + client.getName() + ", CPF: " + client.getCpf());
                System.out.println("___________________________________________________________________________________________________");
            }
        } else {
            System.out.println("");
            System.out.println("____________________________________________________________________________");
            System.out.println("Erro ao obter a lista de clientes. Status: " + responseEntity.getStatusCode());
            System.out.println("____________________________________________________________________________");
        }
    }

    private void atualizarCliente() {
        System.out.println("");
        System.out.println("|====================================|");
        System.out.println("|== ID do cliente a ser atualizado ==|");
        System.out.println("|====================================|");
        UUID id = UUID.fromString(scanner.nextLine());

        System.out.println("");
        System.out.println("|===================================|");
        System.out.println("|=====  Novo nome do cliente   =====|");
        System.out.println("|===================================|");
        String novoNome = scanner.nextLine();

        System.out.println("");
        System.out.println("|===================================|");
        System.out.println("|======  Novo CPF do cliente  ======|");
        System.out.println("|===================================|");
        String novoCpf = scanner.nextLine();

        ClientRecordDto novoClientDto = new ClientRecordDto(novoNome, novoCpf);
        clientController.updateClient(id, novoClientDto);

        System.out.println("");
        System.out.println("|===================================|");
        System.out.println("|= Cliente atualizado com sucesso! =|");
        System.out.println("|===================================|");
    }

    private void excluirCliente() {
        System.out.println("");
        System.out.println("|========================================|");
        System.out.println("|===== ID do cliente a ser excluído =====|");
        System.out.println("|========================================|");
        UUID id = UUID.fromString(scanner.nextLine());

        clientController.deleteClient(id);

        System.out.println("");
        System.out.println("===================================");
        System.out.println("=| Cliente excluído com sucesso! |=");
        System.out.println("===================================");
    }
}

