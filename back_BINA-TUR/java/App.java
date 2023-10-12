package viagens_recode;

import java.util.Scanner;

public class App {
    static Scanner entrada = new Scanner(System.in);
    static String[] clientesNome = new String[9999];
    static String[] clientesDataNascimento = new String[9999]; // Alterado para String
    static int[] clientesCPF = new int[9999];
    static int[] clientesTelefone = new int[9999];
    static int totalClientes = 0;

    static String[] destinosPaisEmbarque = new String[9999];
    static String[] destinosCidadeEmbarque = new String[9999];
    static String[] destinosPaisDestino = new String[9999];
    static String[] destinosCidadeDestino = new String[9999];
    static int totalDestinos = 0;

    public static void main(String[] args) {
        int opcao;
        do {
            saudacao();
            System.out.println("-----------------------------------");
            System.out.println("|            -- Menu --           |");
            System.out.println("|---------------------------------|");
            System.out.println("|     1 - Cadastro de Cliente     |");
            System.out.println("|     2 - Cadastro de Destino     |");
            System.out.println("|     3 - Consulta de Cliente     |");
            System.out.println("|     4 - Consulta de Destino     |");
            System.out.println("|     0 - Sair                    |");
            System.out.println("-----------------------------------");
            System.out.print("     == Escolha uma opção == ");
            opcao = entrada.nextInt();
            entrada.nextLine();

            switch (opcao) {
                case 1:
                    cadastroCliente();
                    break;
                case 2:
                    cadastroDestino();
                    break;
                case 3:
                    consultaCliente();
                    break;
                case 4:
                    consultaDestino();
                    break;
                case 0:
                    saudacao();
                    System.out.println("\nObrigado por utilizar nosso sistema.");
                    System.out.println("Até logo!");
                    System.out.println("===================================");
                    break;
                default:
                    System.out.println("###################################");
                    System.out.println("# OPÇÃO INVÁLIDA. TENTE NOVAMENTE.#");
                    System.out.println("###################################\n");
                    break;
            }
        } while (opcao != 0);
    }

    public static void cadastroCliente() {
        String nomeCliente, dataNascimento;
        int cpfCliente, telefoneCliente;

        saudacao();
        System.out.println("   ---------------------------");
        System.out.println("   ==== Faça seu Cadastro ====");
        System.out.println("   ---------------------------");
        System.out.print("Digite seu Nome Completo: ");
        nomeCliente = entrada.nextLine();
        System.out.print("Digite sua Data de Nascimento [dd/mm/aa]: ");
        dataNascimento = entrada.nextLine(); // Lê a data de nascimento como uma String
        System.out.print("Digite seu CPF: ");
        cpfCliente = entrada.nextInt();
        System.out.print("Digite seu Telefone para Contato: ");
        telefoneCliente = entrada.nextInt();
        entrada.nextLine();

        totalClientes++;
        clientesNome[totalClientes] = nomeCliente;
        clientesDataNascimento[totalClientes] = dataNascimento; // Armazena a data de nascimento como String
        clientesCPF[totalClientes] = cpfCliente;
        clientesTelefone[totalClientes] = telefoneCliente;

        saudacao();
        System.out.println("||Cliente Cadastrado com Sucesso!||");
        System.out.println("||Código para consulta: " + totalClientes + "       ||");
    }

    public static void cadastroDestino() {
        String paisEmbarque, cidadeEmbarque, paisDestino, cidadeDestino;

        saudacao();
        System.out.println("   ------------------------- ");
        System.out.println("  === Cadastre seu Destino ===");
        System.out.println("   ------------------------- ");
        System.out.print("Digite o Pais de Embarque: ");
        paisEmbarque = entrada.nextLine();
        System.out.print("Digite a Cidade de Embarque: ");
        cidadeEmbarque = entrada.nextLine();
        System.out.print("Digite o Pais de Destino: ");
        paisDestino = entrada.nextLine();
        System.out.print("Digite a Cidade de Destino: ");
        cidadeDestino = entrada.nextLine();

        totalDestinos++;
        destinosPaisEmbarque[totalDestinos] = paisEmbarque;
        destinosCidadeEmbarque[totalDestinos] = cidadeEmbarque;
        destinosPaisDestino[totalDestinos] = paisDestino;
        destinosCidadeDestino[totalDestinos] = cidadeDestino;

        saudacao();
        System.out.println("||Destino Cadastrado com Sucesso!||");
        System.out.println("||Código para Consulta: " + totalDestinos + "       ||");
    }

    public static void consultaCliente() {
        int indice;

        saudacao();
        System.out.println("  -----------------------------");
        System.out.println("== Digite o Código do Cliente: ==");
        System.out.println("  -----------------------------");
        indice = entrada.nextInt();

        saudacao();
        if (indice >= 1 && indice <= totalClientes) {
            System.out.println("      --- Dados do Cliente ---");
            System.out.println("-----------------------------------");
            System.out.println("Nome: " + clientesNome[indice]);
            System.out.println("Data de Nascimento: " + clientesDataNascimento[indice]);
            System.out.println("CPF: " + clientesCPF[indice]);
            System.out.println("Telefone: " + clientesTelefone[indice]);
        } else {
            System.out.println("Índice inválido. Cliente não encontrado.");
        }
    }

    public static void consultaDestino() {
        int indice;

        saudacao();
        System.out.println("  -----------------------------");
        System.out.println("== Digite o Código da Viagem:  ==");
        System.out.println("  -----------------------------");
        indice = entrada.nextInt();

        saudacao();
        if (indice >= 1 && indice <= totalDestinos) {
            System.out.println("      --- Dados do Destino ---");
            System.out.println("-----------------------------------");
            System.out.println("País de Embarque: " + destinosPaisEmbarque[indice]);
            System.out.println("Cidade de Embarque: " + destinosCidadeEmbarque[indice]);
            System.out.println("País de Destino: " + destinosPaisDestino[indice]);
            System.out.println("Cidade de Destino: " + destinosCidadeDestino[indice]);
        } else {
            System.out.println("Código inválido. Destino não encontrado.");
        }
    }

    public static void saudacao() {
        System.out.println("===================================");
        System.out.println("             BINA-TUR!");
        System.out.println("-----------------------------------");
        System.out.println(" Sua agência de Viagens Inteligente");
        System.out.println("===================================");
    }
}
