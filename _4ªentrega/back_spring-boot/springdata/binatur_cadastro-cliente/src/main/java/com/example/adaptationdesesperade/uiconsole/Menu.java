//Lógica para um menú de manipulação de testes
//Criei este menu pois não consegui trabalhar com o 'Postman'

package com.example.adaptationdesesperade.uiconsole;

import com.example.adaptationdesesperade.controllers.ProductController;
import com.example.adaptationdesesperade.dtos.ProductRecordDto;
import com.example.adaptationdesesperade.models.ProductModel;
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
    private ProductController productController;

    public Menu(ProductController productController) {
        this.scanner = new Scanner(System.in);
        this.productController = productController;
    }

    public void exibirMenu() {
        int escolha;

        do {
            System.out.println("\n***** MENU *****");
            System.out.println("1. Adicionar Produto");
            System.out.println("2. Listar Produtos");
            System.out.println("3. Atualizar Produto");
            System.out.println("4. Excluir Produto");
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
                adicionarProduto();
                break;
            case 2:
                listarProdutos();
                break;
            case 3:
                atualizarProduto();
                break;
            case 4:
                excluirProduto();
                break;
            case 0:
                System.out.println("Finalizando o programa. Até mais!");
                break;
            default:
                System.out.println("Opção inválida. Tente novamente.");
        }
    }

    private void adicionarProduto() {
        try {
            System.out.print("Nome do produto: ");
            String nome = scanner.nextLine();

            System.out.print("Valor do produto: ");
            BigDecimal valor = scanner.nextBigDecimal();

            ProductRecordDto productDto = new ProductRecordDto(nome, valor);
            productController.saveProduct(productDto);
            System.out.println("Produto adicionado com sucesso!");
        } catch (InputMismatchException e) {
            System.out.println("Erro de entrada: Certifique-se de que o valor seja um número inteiro.");
            scanner.nextLine();
        }
    }

    private void listarProdutos() {
        ResponseEntity<List<ProductModel>> responseEntity = productController.getAllProducts();

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            List<ProductModel> produtos = responseEntity.getBody();

            for (ProductModel produto : produtos) {
                System.out.println("ID: " + produto.getIdProduct() + ", Nome: " + produto.getName() + ", Valor: " + produto.getValue());
            }
        } else {
            System.out.println("Erro ao obter a lista de produtos. Status: " + responseEntity.getStatusCode());
        }
    }

    private void atualizarProduto() {
        System.out.print("ID do produto a ser atualizado: ");
        UUID id = UUID.fromString(scanner.nextLine());

        System.out.print("Novo nome do produto: ");
        String novoNome = scanner.nextLine();

        System.out.print("Novo valor do produto: ");
        BigDecimal novoValor = scanner.nextBigDecimal();

        ProductRecordDto novoProdutoDto = new ProductRecordDto(novoNome, novoValor);
        productController.updateProduct(id, novoProdutoDto);

        System.out.println("Produto atualizado com sucesso!");
    }

    private void excluirProduto() {
        System.out.print("ID do produto a ser excluído: ");
        UUID id = UUID.fromString(scanner.nextLine());

        productController.deleteProduct(id);

        System.out.println("Produto excluído com sucesso!");
    }
}
