import React, { useState } from 'react';
import { postClient } from '../services/api';

const ClientForm = ({ onClientAdded }) => {
  // State para armazenar dados do novo cliente
  const [name, setName] = useState('');
  const [cpf, setCpf] = useState('');

  // Função para lidar com o envio do formulário
  const handleSubmit = async (e) => {
    e.preventDefault();

    // Cria um novo cliente
    const newClient = { name, cpf };

    try {
      // Chama a função da API para cadastrar o cliente
      const response = await postClient(newClient);

      // Limpa o formulário
      setName('');
      setCpf('');

      // Atualiza a lista de clientes no componente pai
      onClientAdded(response.data);
    } catch (error) {
      console.error('Erro ao cadastrar cliente:', error.message);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
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

      <button type="submit">Adicionar Cliente</button>
    </form>
  );
};

export default ClientForm;
