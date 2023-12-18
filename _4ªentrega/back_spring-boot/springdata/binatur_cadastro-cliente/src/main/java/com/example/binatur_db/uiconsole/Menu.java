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
            System.out.println("\n***** MENU *****");
            System.out.println("1. Adicionar Cliente");
            System.out.println("2. Listar Clientes");
            System.out.println("3. Editar Cliente");
            System.out.println("4. Excluir Cliente");
            System.out.println("0. Sair");
            System.out.print("Escolha uma opção: ");

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
                System.out.println("Finalizando o programa. Até mais!");
                break;
            default:
                System.out.println("Opção inválida. Tente novamente.");
        }
    }

    private void adicionarCliente() {
        try {
            System.out.print("Nome do cliente: ");
            String nome = scanner.nextLine();

            System.out.print("CPF do Cliente: ");
            String cpf = scanner.nextLine();

            ClientRecordDto clientRecordDto = new ClientRecordDto(nome, cpf);
            clientController.saveClient(clientRecordDto);
            System.out.println("Cliente adicionado com sucesso!");
        } catch (InputMismatchException e) {
            System.out.println("Erro de entrada: Insira um CPF válido.");
            scanner.nextLine();
        }
    }

    private void listarClientes() {
        ResponseEntity<List<ClientModel>> responseEntity = clientController.getAllClients();

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            List<ClientModel> clients = responseEntity.getBody();

            for (ClientModel client : clients) {
                System.out.println("ID: " + client.getIdClient() + ", Nome: " + client.getName() + ", CPF: " + client.getCpf());
            }
        } else {
            System.out.println("Erro ao obter a lista de clientes. Status: " + responseEntity.getStatusCode());
        }
    }

    private void atualizarCliente() {
        System.out.print("ID do cliente a ser atualizado: ");
        UUID id = UUID.fromString(scanner.nextLine());

        System.out.print("Novo nome do cliente: ");
        String novoNome = scanner.nextLine();

        System.out.print("Novo CPF do cliente: ");
        String novoCpf = scanner.nextLine();

        ClientRecordDto novoClientDto = new ClientRecordDto(novoNome, novoCpf);
        clientController.updateClient(id, novoClientDto);

        System.out.println("Cliente atualizado com sucesso!");
    }

    private void excluirCliente() {
        System.out.print("ID do cliente a ser excluído: ");
        UUID id = UUID.fromString(scanner.nextLine());

        clientController.deleteClient(id);

        System.out.println("Cliente excluído com sucesso!");
    }
}

