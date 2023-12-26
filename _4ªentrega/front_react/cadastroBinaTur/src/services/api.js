import axios from 'axios';

const API_URL = 'http://localhost:3006/binatur_db';

// Função para obter todos os clientes
export const getAllClients = async () => {
  return await axios.get(`${API_URL}/clients`);
};

// Função para cadastrar um novo cliente
export const postClient = async (client) => {
  return await axios.post(`${API_URL}/clients`, client);
};

// Função para atualizar um cliente existente
export const updateClient = async (clientId, updatedClient) => {
  return await axios.put(`${API_URL}/clients/${clientId}`, updatedClient);
};

// Função para excluir um cliente
export const deleteClient = async (clientId) => {
  return await axios.delete(`${API_URL}/clients/${clientId}`);
};
