import React from 'react';

const DeleteConfirmation = ({ onCancel, onConfirm }) => {
  return (
    <div>
      <p>Tem certeza que deseja excluir este cliente?</p>
      <button onClick={onCancel}>Cancelar</button>
      <button onClick={onConfirm}>Confirmar</button>
    </div>
  );
};

export default DeleteConfirmation;
