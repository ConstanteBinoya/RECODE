import React, { useEffect, useState } from 'react';
import { getAllClients, deleteClient } from '../services/api';

const ClientList = ({ onClientDeleted, onClientUpdated }) => {
  // State para armazenar a lista de clientes
  const [clients, setClients] = useState([]);

  // Função para carregar a lista de clientes ao montar o componente
  useEffect(() => {
    const fetchClients = async () => {
      try {
        // Obtém a lista de clientes da API
        const response = await getAllClients();
        setClients(response.data);
      } catch (error) {
        console.error('Erro ao obter a lista de clientes:', error.message);
      }
    };

    fetchClients();
  }, []);

  // Função para lidar com a exclusão de um cliente
  const handleDelete = async (clientId) => {
    try {
      // Chama a função da API para excluir o cliente
      await deleteClient(clientId);
      onClientDeleted(clientId);
    } catch (error) {
      console.error('Erro ao excluir cliente:', error.message);
    }
  };

  return (
    <div>
      <h2>Lista de Clientes</h2>
      <ul>
        {clients.map((client) => (
          <li key={client.idClient}>
            {client.name} - {client.cpf}
            <button onClick={() => handleDelete(client.idClient)}>
              Excluir
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ClientList;
