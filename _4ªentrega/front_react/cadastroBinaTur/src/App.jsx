// 

// App.jsx

import React, { useState, useEffect } from 'react';
import ClientForm from './components/ClientForm';
import ClientList from './components/ClientList';
import { getAllClients, postClient, updateClient, deleteClient } from './services/api';
import './styles/App.css'


const App = () => {
  const [clients, setClients] = useState([]);

  useEffect(() => {
    const fetchClients = async () => {
      try {
        const response = await getAllClients();
        setClients(response.data);
      } catch (error) {
        console.error('Erro ao obter a lista de clientes:', error.message);
      }
    };

    fetchClients();
  }, []);

  const handleClientAdded = async (newClient) => {
    try {
      const response = await postClient(newClient);
      setClients([...clients, response.data]);
    } catch (error) {
      console.error('Erro ao cadastrar cliente:', error.message);
    }
  };

  const handleClientDeleted = async (clientId) => {
    try {
      await deleteClient(clientId);
      setClients(clients.filter((client) => client.idClient !== clientId));
    } catch (error) {
      console.error('Erro ao excluir cliente:', error.message);
    }
  };

  const handleClientUpdated = async (clientId, updatedClient) => {
    try {
      await updateClient(clientId, updatedClient);
      setClients(clients.map((client) => (client.idClient === clientId ? updatedClient : client)));
    } catch (error) {
      console.error('Erro ao atualizar cliente:', error.message);
    }
  };

  return (
    <div className='container'>
      <h1>Cadastro BinaTur</h1>
      <div>
        <ClientForm onClientAdded={handleClientAdded} />
        <ClientList clients={clients} onClientDeleted={handleClientDeleted} onClientUpdated={handleClientUpdated} />
      </div>
    </div>
  );
};

export default App;
