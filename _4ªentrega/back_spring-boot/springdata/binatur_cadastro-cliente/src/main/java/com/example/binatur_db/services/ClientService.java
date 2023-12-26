package com.example.binatur_db.services;

import com.example.binatur_db.dtos.ClientRecordDto;
import com.example.binatur_db.models.ClientModel;
import com.example.binatur_db.repositorys.ClientRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public ClientModel saveClient(ClientRecordDto clientRecordDto) {
        ClientModel clientModel = new ClientModel();
        BeanUtils.copyProperties(clientRecordDto, clientModel);
        return clientRepository.save(clientModel);
    }

    public List<ClientModel> getAllClients() {
        return clientRepository.findAll();
    }

    public Optional<ClientModel> getOneClient(UUID id) {
        return clientRepository.findById(id);
    }

    public Optional<ClientModel> updateClient(UUID id, ClientRecordDto clientRecordDto) {
        Optional<ClientModel> optionalClient = clientRepository.findById(id);
        if (optionalClient.isPresent()) {
            ClientModel client = optionalClient.get();
            BeanUtils.copyProperties(clientRecordDto, client);
            return Optional.of(clientRepository.save(client));
        }
        return Optional.empty();
    }

    public boolean deleteClient(UUID id) {
        if (clientRepository.existsById(id)) {
            clientRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
