import React from 'react';

const ModalEliminar = ({ onClose, onSubmit, camisetas, dataCamisetas }) => {
  
  const handleSubmit = (e) => {
    e.preventDefault();
    onSubmit(camisetas);
    onClose();
  };

  return (
    <div id="editEmployeeModal" className="modal fade show" tabIndex="-1" style={{ display: 'block' }}>
      <div className="modal-overlay">
        <div className="modal-dialog" onClick={(e) => e.stopPropagation()}>
                <div className="modal-content">
                    <form onSubmit={handleSubmit}>
                        <div className="modal-header">						
                            <h4 className="modal-title">Delete Camiseta</h4>
                            <button type="button" className="close" onClick={onClose}><i className="fa-regular fa-circle-xmark"/></button>
                        </div>
                        <div className="modal-body">					
                            <p>¿Estás seguro de que quieres eliminar estos registros?</p>
                            <p>
                              {dataCamisetas.map((camiseta, index) => (
                                <span key={index}><i>{`${camiseta.equipo} - ${camiseta.nombre} - ${camiseta.temporada}`} </i><br /></span>
                              ))}
                            </p>
                            <p className="text-warning"><small>Esta accion no se puede deshacer.</small></p>
                        </div>
                        <div className="modal-footer">
                            <button type="button" className="btn btn-default" onClick={onClose}>Cancel</button>
                            <button type="submit" className="btn btn-danger">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  );
};

export default ModalEliminar;