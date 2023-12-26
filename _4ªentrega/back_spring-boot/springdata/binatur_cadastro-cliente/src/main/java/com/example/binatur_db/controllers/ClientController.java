//Painel de controle do CRUD:
//Tentativa de aplicação dos níveis de maturidade de Richardson:

package com.example.binatur_db.controllers;

import com.example.binatur_db.dtos.ClientRecordDto;
import com.example.binatur_db.models.ClientModel;
import com.example.binatur_db.repositorys.ClientRepository;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/api/clients") // Adicionado um mapeamento de base para todas as rotas do controlador (26/12)
public class ClientController {

    @Autowired
    ClientRepository clientRepository;

//    @PostMapping("/clients")
//    public ResponseEntity<ClientModel> saveClient(@RequestBody @Valid ClientRecordDto clientRecordDto) {
//        var clientModel = new ClientModel();
//        BeanUtils.copyProperties(clientRecordDto, clientModel);
//        return ResponseEntity.status(HttpStatus.CREATED).body(clientRepository.save(clientModel));
//    }

    @PostMapping
    public ResponseEntity<ClientModel> saveClient(@RequestBody @Valid ClientRecordDto clientRecordDto) {
        ClientModel clientModel = new ClientModel();
        BeanUtils.copyProperties(clientRecordDto, clientModel);
        return ResponseEntity.status(HttpStatus.CREATED).body(clientRepository.save(clientModel));
    }

    @GetMapping //("/clients")
    public ResponseEntity<List<ClientModel>> getAllClients(){
        List<ClientModel> clientsList = clientRepository.findAll();
        if (!clientsList.isEmpty()) {
            for (ClientModel client : clientsList) {
                UUID id = client.getIdClient();
                client.add(linkTo(methodOn(ClientController.class).getOneClient(id)).withSelfRel());
            }
        }
        return ResponseEntity.status(HttpStatus.OK).body(clientsList);
    }

//    @GetMapping("/clients/{id}")
//    public ResponseEntity<Object> getOneClient(@PathVariable(value="id") UUID id){
//        Optional<ClientModel> clientO = clientRepository.findById(id);
//        if (clientO.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Client not found.");
//        }
//        clientO.get().add(linkTo(methodOn(ClientController.class).getAllClients()).withRel("Clients.list"));
//        return ResponseEntity.status(HttpStatus.OK).body(clientO.get());
//    }

    @GetMapping("/{id}")  // Adicionado o ID diretamente na anotação, mais claro e consistente
    public ResponseEntity<Object> getOneClient(@PathVariable UUID id) {
        Optional<ClientModel> clientO = clientRepository.findById(id);
        if (clientO.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Client not found.");
        }
        clientO.get().add(linkTo(methodOn(ClientController.class).getAllClients()).withRel("Clients.list"));
        return ResponseEntity.status(HttpStatus.OK).body(clientO.get());
    }


//    @PutMapping("/clients/{id}")
//    public ResponseEntity<Object> updateClient(@PathVariable(value="id") UUID id,
//                                                @RequestBody @Valid ClientRecordDto ClientRecordDto) {
//        Optional<ClientModel> clientO = clientRepository.findById(id);
//        if (clientO.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Client not found.");
//        }
//
//        var clientModel = clientO.get();
//        BeanUtils.copyProperties(ClientRecordDto, clientModel);
//        return ResponseEntity.status(HttpStatus.OK).body(clientRepository.save(clientModel));
//    }

    @PutMapping("/{id}")
    public ResponseEntity<Object> updateClient(@PathVariable UUID id, @RequestBody @Valid ClientRecordDto clientRecordDto) {
        Optional<ClientModel> clientO = clientRepository.findById(id);
        if (clientO.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Client not found.");
        }

        ClientModel clientModel = clientO.get();
        BeanUtils.copyProperties(clientRecordDto, clientModel);
        return ResponseEntity.status(HttpStatus.OK).body(clientRepository.save(clientModel));
    }

//    @DeleteMapping("/clients/{id}")
//    public ResponseEntity<Object> deleteClient(@PathVariable(value="id") UUID id) {
//        Optional<ClientModel> clientO = clientRepository.findById(id);
//        if (clientO.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Clients not found.");
//        }
//        clientRepository.delete(clientO.get());
//        return ResponseEntity.status(HttpStatus.OK).body("Client deleted successfully.");
//    }
//}

@DeleteMapping("/{id}")
public ResponseEntity<Object> deleteClient(@PathVariable UUID id) {
    Optional<ClientModel> clientO = clientRepository.findById(id);
    if (clientO.isEmpty()) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Client not found.");
    }
    clientRepository.delete(clientO.get());
    return ResponseEntity.status(HttpStatus.OK).body("Client deleted successfully.");
}
}




