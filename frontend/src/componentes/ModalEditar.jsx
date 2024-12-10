import React, { useState } from 'react';

const ModalEditar = ({ onClose, onSubmit, camiseta, equipos, accion }) => {
  const [errors, setErrors] = useState('');

  const [formData, setFormData] = useState({
    id: camiseta.id,
    equipo: camiseta.equipo,
    temporada: camiseta.temporada,
    year_inicio: camiseta.year_inicio,
    year_fin: camiseta.year_fin,
    nombre: camiseta.nombre,
    precio: camiseta.precio,
    estado: camiseta.estado,
    imagenes: camiseta.imagenes
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const newErrors = handleValidar();
    
    if (Object.keys(newErrors).length > 0) {
        setErrors(newErrors);
        return;
    }
    formData.year_inicio = parseInt(formData.year_inicio);
    formData.year_fin = parseInt(formData.year_fin);

    onSubmit(formData);
    onClose();
  };

  const handleValidar = () => {
    const currentYear = new Date().getFullYear()+1;
    const newErrors = {};

    if (!formData.equipo) {
      newErrors.equipo = 'Debe seleccionar un equipo';
    }

    if (!formData.year_inicio || formData.year_inicio < 1970 || formData.year_inicio > currentYear) {
      newErrors.year_inicio = `El año de inicio debe estar entre 1970 y ${currentYear}`;
    }

    if (!formData.year_fin || formData.year_fin < 1970 || formData.year_fin > currentYear) {
      newErrors.year_fin = `El año de fin debe estar entre 1970 y ${currentYear}`;
    }

    if (!formData.nombre.trim()) {
      newErrors.nombre = 'El nombre no puede estar vacío';
    }

    if (!formData.precio || isNaN(formData.precio) || formData.precio <= 0) {
      newErrors.precio = 'El precio no puede estar vacío';
    }

    if (!formData.estado.trim()) {
      newErrors.estado = 'El estado no puede estar vacío';
    }

    return newErrors;
  };

  return (
    <div id="editCamisetaModal" className="modal fade show" tabIndex="-1" style={{ display: 'block' }}>
      <div className="modal-overlay">
        <div className="modal-dialog" onClick={(e) => e.stopPropagation()}>
          <div className="modal-content">
            <form onSubmit={handleSubmit}>
              <div className="modal-header">
                <h4 className="modal-title">{accion} Camiseta</h4>
                <button type="button" className="close" onClick={onClose}>&times;</button>
              </div>
              <div className="modal-body">
                <div className="form-group">
                  <label htmlFor='equipo'>Equipo</label>
                  <select
                    className="form-control"
                    name="equipo"
                    id='equipo'
                    value={formData.equipo}
                    onChange={handleChange}
                    required
                  >
                    <option value="">Seleccione un equipo</option>
                    {equipos.map((equipo) => (
                      <option key={equipo.id} value={equipo.nombre}>
                        {equipo.nombre}
                      </option>
                    ))}
                  </select>
                  {errors.equipo && <div className="text-danger">{errors.equipo}</div>}
                </div>
                <div className="form-group">
                  <label htmlFor='year_inicio'>Año de Inicio</label>
                  <input
                    type="text"
                    className="form-control"
                    name="year_inicio"
                    id='year_inicio'
                    value={formData.year_inicio}
                    onChange={handleChange}
                    min="1970"
                    max={new Date().getFullYear()}
                    required
                  />
                  {errors.year_inicio && <div className="text-danger">{errors.year_inicio}</div>}
                </div>
                <div className="form-group">
                  <label htmlFor='year_fin'>Año de Fin</label>
                  <input
                    type="text"
                    className="form-control"
                    name="year_fin"
                    id='year_fin'
                    value={formData.year_fin}
                    onChange={handleChange}
                    min="1970"
                    max={new Date().getFullYear()}
                    required
                  />
                  {errors.year_fin && <div className="text-danger">{errors.year_fin}</div>}
                </div>
                <div className="form-group">
                  <label htmlFor='nombre'>Nombre</label>
                  <input
                    type="text"
                    className="form-control"
                    name="nombre"
                    id='nombre'
                    value={formData.nombre}
                    onChange={handleChange}
                    required
                  />
                  {errors.nombre && <div className="text-danger">{errors.nombre}</div>}
                </div>
                <div className="form-group">
                  <label htmlFor='precio'>Precio</label>
                  <input
                    type="number"
                    className="form-control"
                    name="precio"
                    id='precio'
                    value={formData.precio}
                    onChange={handleChange}
                    required
                  />
                  {errors.precio && <div className="text-danger">{errors.precio}</div>}
                </div>
                <div className="form-group">
                  <label htmlFor='estado'>Estado</label>
                  <input
                    type="text"
                    className="form-control"
                    name="estado"
                    id='estado'
                    value={formData.estado}
                    onChange={handleChange}
                    required
                  />
                  {errors.estado && <div className="text-danger">{errors.estado}</div>}
                </div>
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-default" onClick={onClose}>Cancel</button>
                <button type="submit" className="btn btn-info">Save</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ModalEditar;