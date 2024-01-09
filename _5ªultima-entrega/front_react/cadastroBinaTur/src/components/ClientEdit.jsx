import React, { useState } from 'react';
import { updateClient } from '../services/api';

const ClientEdit = ({ client, onClientUpdated }) => {
  // State para armazenar os dados do cliente
  const [name, setName] = useState(client.name);
  const [cpf, setCpf] = useState(client.cpf);

  // Função para lidar com o envio do formulário de edição
  const handleSubmit = async (e) => {
    e.preventDefault();

    // Atualiza os dados do cliente
    const updatedClient = { ...client, name, cpf };

    try {
      // Chama a função da API para atualizar o cliente
      await updateClient(client.idClient, updatedClient);

      // Atualiza a lista de clientes no componente pai
      onClientUpdated(client.idClient, updatedClient);
    } catch (error) {
      console.error('Erro ao atualizar cliente:', error.message);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>Editar Cliente</h2>

      <label htmlFor="name">Nome:</label>
      <input
        type="text"
        id="name"
        value={name}
        onChange={(e) => setName(e.target.value)}
        required
      />

      <label htmlFor="cpf">CPF:</label>
      <input
        type="text"
        id="cpf"
        value={cpf}
        onChange={(e) => setCpf(e.target.value)}
        required
      />

      <button type="submit">Atualizar Cliente</button>
    </form>
  );
};

export default ClientEdit;
