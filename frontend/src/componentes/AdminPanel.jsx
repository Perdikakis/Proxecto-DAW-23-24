import React, { useEffect, useState } from "react";
import "../css/AdminPanel.css";
import "bootstrap/dist/css/bootstrap.min.css";
import "@fortawesome/fontawesome-free/css/all.min.css";
import ModalEditar from "./ModalEditar";
import ModalEliminar from "./ModalEliminar";
import { ajaxAxios } from "../utils/ajaxAxios";

const AdminPanel = () => {
  const [camisetas, setCamisetas] = useState([]);
  const [equipos, setEquipos] = useState([]);
  const [competiciones, setCompeticiones] = useState([]);
  const [selectedCompeticion, setSelectedCompeticion] = useState('');
  const [selectedEquipo, setSelectedEquipo] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [camisetasPerPage, setCamisetasPerPage] = useState(5);
  const [isEditModalOpen, setIsEditModalOpen] = useState(false);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [selectedCamiseta, setSelectedCamiseta] = useState(null);
  const [selectedCheckboxes, setSelectedCheckboxes] = useState([]);
  const [accion, setAccion] = useState('');
  const [msg, setMsg] = useState('');
  const [barraProgreso, setBarraProgreso] = useState(100);

  const handleEntriesChange = (e) => {
    setCamisetasPerPage(Number(e.target.value));
  };

  const handleCompeticionChange = (e) => {
    setSelectedCompeticion(e.target.value);
    setSelectedEquipo('');
    setCurrentPage(1);
  };

  const handleEquipoChange = (e) => {
    setSelectedEquipo(e.target.value);
    setCurrentPage(1);
  };

  const filteredEquipos = selectedCompeticion
    ? equipos.filter((equipo) => equipo.competiciones.includes(parseInt(selectedCompeticion)))
    : equipos;

  const filteredCamisetas = camisetas.filter((camiseta) => {
    const equipo = equipos.find((equipo) => equipo.nombre === camiseta.equipo);
    return (
      (!selectedCompeticion || (equipo && equipo.competiciones.includes(parseInt(selectedCompeticion)))) &&
      (!selectedEquipo || camiseta.equipo === selectedEquipo)
    );
  });

  const indexOfLastEntry = currentPage * camisetasPerPage;
  const indexOfFirstEntry = indexOfLastEntry - camisetasPerPage;
  const currentCamisetas = filteredCamisetas.slice(indexOfFirstEntry, indexOfLastEntry);

  const totalPages = Math.ceil(filteredCamisetas.length / camisetasPerPage);

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const getPaginationRange = (currentPage, totalPages, maxPagesToShow = 5) => {
    const start = Math.floor((currentPage - 1) / maxPagesToShow) * maxPagesToShow + 1;
    const end = Math.min(start + maxPagesToShow - 1, totalPages);

    return Array.from({ length: end - start + 1 }, (_, i) => start + i);
  };

  // datos
  useEffect(() => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/camisetasFiltradas`,
      method: 'POST',
      fsuccess: (response) => {
        setCamisetas(response);
      },
      ferror: (error) => {
      }
    });

    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/equipos`,
      method: 'GET',
      fsuccess: (response) => {
        setEquipos(response);
      },
      ferror: (error) => {
      }
    });

    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/competiciones`,
      method: 'GET',
      fsuccess: (response) => {
        setCompeticiones(response);
      },
      ferror: (error) => {
      }
    });
  }, []);

  const handleSelectAll = (e) => {
    if (e.target.checked) {
      const allIds = currentCamisetas.map((camiseta) => camiseta.id);
      setSelectedCheckboxes(allIds);
    } else {
      setSelectedCheckboxes([]);
    }
  };

  const handleCheckboxChange = (id) => {
    setSelectedCheckboxes((prevSelected) =>
      prevSelected.includes(id)
        ? prevSelected.filter((checkboxId) => checkboxId !== id)
        : [...prevSelected, id]
    );
  };

  const handleEditCamiseta = (camiseta) => {
    setAccion('Edit');
    setSelectedCamiseta(camiseta);
    setIsEditModalOpen(true);
  };

  // añadir es lo mismo que editar pero enviando id de camiseta -1 al servidor
  const handleAdd = () => {
    setAccion('Add');
    setSelectedCamiseta({
      id: null,
      equipo: '',
      temporada: '',
      year_inicio: '',
      year_fin: '',
      nombre: '',
      precio: '',
      estado: '',
      imagenes: []
    });
    setIsEditModalOpen(true);
  };

  // eliminar individual y multiple
  const handleDeleteCamisetas = (camisetas) => {
    setSelectedCamiseta(camisetas);
    setIsDeleteModalOpen(true);
  };

  // submits de los modales editar y añadir
  const handleEditSubmit = (updatedCamiseta) => {
    const equipo = equipos.find(e => e.nombre == updatedCamiseta.equipo);
    const equipoId = equipo ? equipo.id : null;

    if (!equipoId) {
      console.error('Equipo no encontrado');
      return;
    }

    const data = {
      id: updatedCamiseta.id,
      equipo: equipoId,
      year_inicio: updatedCamiseta.year_inicio,
      year_fin: updatedCamiseta.year_fin,
      nombre: updatedCamiseta.nombre,
      precio: updatedCamiseta.precio,
      estado: updatedCamiseta.estado,
      imagenes: updatedCamiseta.imagenes
    }

    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/updateCamiseta`,
      method: 'PUT',
      data: data,
      fsuccess: (response) => {
        if (updatedCamiseta.id) {
          setCamisetas((prevCamisetas) =>
            prevCamisetas.map((camiseta) =>
              camiseta.id === updatedCamiseta.id
                ? {
                    ...updatedCamiseta,
                    temporada: `${updatedCamiseta.year_inicio.toString().slice(-2)}/${updatedCamiseta.year_fin.toString().slice(-2)}`
                  }
                : camiseta
            )
          );
        } else {
          setCamisetas((prevCamisetas) => [
            ...prevCamisetas,
            {
              ...updatedCamiseta,
              temporada: `${updatedCamiseta.year_inicio.toString().slice(-2)}/${updatedCamiseta.year_fin.toString().slice(-2)}`
            }
          ]);
        }
      },
      ferror: (error) => {
      }
    });

    setIsEditModalOpen(false);
  };

  const handleDeleteSubmit = (camisetas) => {
    setSelectedCheckboxes([]);

    const data = {ids: camisetas};
    console.log(data);
    
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/deleteCamisetas`,
      method: 'DELETE',
      data: data,
      fsuccess: (response) => {
        setCamisetas((prevCamisetas) =>
          prevCamisetas.filter((camiseta) => !camisetas.includes(camiseta.id))
        );
        setMsg(response.message);
        setBarraProgreso(100);
        const interval = setInterval(() => {
          setBarraProgreso((prev) => {
            if (prev <= 0) {
              clearInterval(interval);
              setMsg('');
              return 0;
            }
            return prev - 1;
          });
        }, 30);
      },
      ferror: (error) => {
      }
    });

    setIsDeleteModalOpen(false);
  };

  const Camiseta = ({ camiseta }) => (
    <tr>
      <td>
        <span className="custom-checkbox">
          <input
            type="checkbox"
            id={`checkbox${camiseta.id}`}
            name="options[]"
            value={camiseta.id}
            checked={selectedCheckboxes.includes(camiseta.id)}
            onChange={() => handleCheckboxChange(camiseta.id)}
          />
          <label htmlFor={`checkbox${camiseta.id}`}></label>
        </span>
      </td>
      <td>{camiseta.equipo}</td>
      <td>{camiseta.temporada}</td>
      <td>{camiseta.nombre}</td>
      <td>{camiseta.precio}</td>
      <td>{camiseta.estado}</td>
      <td className="iconos-camiseta">
        <i
          className="fa-solid fa-pen-to-square"
          data-toggle="tooltip"
          title="Edit"
          onClick={() => handleEditCamiseta(camiseta)}
          style={{ cursor: "pointer" }}
        ></i>
        <i
          className="fa-solid fa-trash"
          onClick={() => handleDeleteCamisetas([camiseta.id])}
          title="Delete"
          style={{ cursor: "pointer" }}
        ></i>
      </td>
    </tr>
  );

  const paginationRange = getPaginationRange(currentPage, totalPages);

  return (
    <main className="main-AdminPanel">
      {msg && 
      <div className="alert-container" style={{ position: 'absolute'}}>
        <div className="alert alert-success" role="alert">
          {msg}
          <div className="progress-bar" style={{ width: `${barraProgreso}%` }}></div>
        </div>
      </div>}
      <div className="container">
        <div className="table-wrapper">
          <div className="table-title">
            <div className="row">
              <div className="col-sm-6">
                <h2>
                  Manage <b>Camisetas</b>
                </h2>
              </div>
              <div className="col-sm-6">
                <button className="btn btn-success" onClick={handleAdd}>
                  <i className="fas fa-plus-circle"></i>
                  <span>Add New Camiseta</span>
                </button>
                <button className="btn btn-danger" onClick={() => handleDeleteCamisetas(selectedCheckboxes)}>
                  <i className="fas fa-minus-circle" />
                  <span>Delete</span>
                </button>
              </div>
            </div>
          </div>
          <table className="table table-striped table-hover">
            <thead>
              <tr>
                <th>
                  <span className="custom-checkbox">
                    <input 
                      type="checkbox" 
                      id="selectAll" 
                      onChange={handleSelectAll}
                      checked={selectedCheckboxes.length === currentCamisetas.length}/>
                    <label htmlFor="selectAll"></label>
                  </span>
                </th>
                <th>Equipo</th>
                <th>Temporada</th>
                <th>Version</th>
                <th>Precio</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              {currentCamisetas.map((camiseta) => (
                <Camiseta key={camiseta.id} camiseta={camiseta} />
              ))}
            </tbody>
          </table>
          <div className="clearfix">
            <div className="hint-text">
              Showing <b>{currentCamisetas.length}</b> out of{" "}
              <b>{filteredCamisetas.length}</b> entries
              <select onChange={handleEntriesChange} value={camisetasPerPage} className="form-select ml-2" style={{ width: 'auto', display: 'inline-block' }}>
                <option value={5}>5</option>
                <option value={10}>10</option>
                <option value={25}>25</option>
                <option value={camisetas.length}>All</option>
              </select>
            </div>
            <select onChange={handleCompeticionChange} value={selectedCompeticion} className="form-select ml-2" style={{ width: 'auto', display: 'inline-block' }}>
                <option value="">Todas las competiciones</option>
                {competiciones.map((competicion) => (
                  <option key={competicion.id} value={competicion.id}>
                    {competicion.nombre}
                  </option>
                ))}
            </select>
            <select onChange={handleEquipoChange} value={selectedEquipo} className="form-select ml-2" style={{ width: 'auto', display: 'inline-block' }}>
                <option value="">Todos los equipos</option>
                {filteredEquipos.map((equipo) => (
                  <option key={equipo.id} value={equipo.nombre}>
                    {equipo.nombre}
                  </option>
                ))}
              </select>
            <ul className="pagination">
              <li
                className={`page-item ${
                  currentPage === 1 ? "disabled" : ""
                }`}
              >
                <a
                  href="#"
                  className="page-link"
                  onClick={() => handlePageChange(currentPage - 1)}
                >
                  Previous
                </a>
              </li>
              {paginationRange.map((page) => (
                <li key={page} className={`page-item ${currentPage === page ? "active" : ""}`}>
                  <a href="#" className="page-link" onClick={() => handlePageChange(page)}>
                    {page}
                  </a>
                </li>
              ))}
              <li
                className={`page-item ${
                  currentPage === totalPages ? "disabled" : ""
                }`}
              >
                <a
                  href="#"
                  className="page-link"
                  onClick={() => handlePageChange(currentPage + 1)}
                >
                  Next
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      {isEditModalOpen && (
        <ModalEditar
          onClose={() => setIsEditModalOpen(false)}
          onSubmit={handleEditSubmit}
          camiseta={selectedCamiseta}
          equipos={equipos}
          accion={accion}
        />
      )}
      {isDeleteModalOpen && (
        <ModalEliminar
          onClose={() => setIsDeleteModalOpen(false)}
          onSubmit={handleDeleteSubmit}
          camisetas={selectedCamiseta}
          dataCamisetas={camisetas.filter(camiseta => selectedCamiseta.includes(camiseta.id))}
        />
        
      )}
      <span>Diseño obtenido de <strong><a href="https://codepen.io/naikjavaid/pen/XPrpjr" target="_blank">codepen</a></strong></span>
    </main>
  );
};

export default AdminPanel;