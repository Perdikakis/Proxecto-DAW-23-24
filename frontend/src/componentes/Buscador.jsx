import React, { useState, useEffect } from "react";
import { ajaxAxios } from "../utils/ajaxAxios";
import BotonBlanco from "./BotonBlanco";
import '../css/Buscador.css';

const Buscador = () => {
  const [equipo, setEquipo] = useState('');
  const [competicion, setCompeticion] = useState('');
  const [temporada, setTemporada] = useState('');

  const [sugerenciasEquipo, setSugerenciasEquipo] = useState([]);
  const [sugerenciasCompeticion, setSugerenciasCompeticion] = useState([]);
  const [sugerenciasTemporada, setSugerenciasTemporada] = useState([]);

  const [equipoValido, setEquipoValido] = useState(false);
  const [competicionValida, setCompeticionValida] = useState(false);
  const [temporadaValida, setTemporadaValida] = useState(false);

  const [equipos, setEquipos] = useState([]);
  const [competiciones, setCompeticiones] = useState([]);
  const [temporadas, setListaTemporadas] = useState([]);

  useEffect(() => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/equipos`,
      method: 'GET',
      fsuccess: (data) => {
        setEquipos(data);
      },
      ferror: (error) => {
        console.error('Error fetching equipos:', error);
      }
    });

    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/competiciones`,
      method: 'GET',
      fsuccess: (data) => {
        setCompeticiones(data);
      },
      ferror: (error) => {
        console.error('Error fetching competiciones:', error);
      }
    });

    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/temporadas`,
      method: 'GET',
      fsuccess: (data) => {
        setListaTemporadas(data);
      },
      ferror: (error) => {
        console.error('Error fetching temporadas:', error);
      }
    });
  }, []);

  const handleCambio = (e, tipo) => {
    const value = e.target.value;
    switch (tipo) {
      case "equipo":
        setEquipo(value);
        const equiposFiltrados = equipos.filter(item => item.nombre.toLowerCase().includes(value.toLowerCase()));
        setSugerenciasEquipo(equiposFiltrados);
        setEquipoValido(equiposFiltrados.some(item => item.nombre === value));
        if (equiposFiltrados.length === 1) {
          const equipoSeleccionado = equiposFiltrados[0];
          const competicionesDeEquipo = competiciones.filter(competicion => equipoSeleccionado.competiciones.includes(competicion.id));
          if (competicionesDeEquipo.length === 1) {
            setCompeticion(competicionesDeEquipo[0].nombre);
            setCompeticionValida(true);
          }
        }
        break;
      case "competicion":
        setCompeticion(value);
        const competicionesFiltradas = competiciones.filter(item => item.nombre.toLowerCase().includes(value.toLowerCase()));
        setSugerenciasCompeticion(competicionesFiltradas);
        setCompeticionValida(competicionesFiltradas.some(item => item.nombre === value));
        if (competicionesFiltradas.length === 1) {
          const competicionSeleccionada = competicionesFiltradas[0];
          const equiposDeCompeticion = equipos.filter(equipo => equipo.competiciones.includes(competicionSeleccionada.id));
          setSugerenciasEquipo(equiposDeCompeticion);
        } else {
          setSugerenciasEquipo([]);
        }
        break;
      case "temporada":
        setTemporada(value);
        setSugerenciasTemporada(temporadas.filter(item => item.toLowerCase().includes(value.toLowerCase())));
        setTemporadaValida(temporadas.includes(value));
        break;
      default:
        break;
    }
  };

  const handleFocus = (setSugerencias, sugerencias, tipo) => {
    if (tipo === "equipo" && competicionValida) {
      const competicionSeleccionada = competiciones.find(item => item.nombre === competicion);
      if (competicionSeleccionada) {
        const equiposDeCompeticion = equipos.filter(equipo => equipo.competiciones.includes(competicionSeleccionada.id));
        setSugerencias(equiposDeCompeticion);
      }
    } else if (tipo === "competicion" && equipoValido) {
      const equipoSeleccionado = equipos.find(item => item.nombre === equipo);
      if (equipoSeleccionado) {
        const competicionesDeEquipo = competiciones.filter(competicion => equipoSeleccionado.competiciones.includes(competicion.id));
        setSugerencias(competicionesDeEquipo);
      }
    } else {
      setSugerencias(sugerencias);
    }
  };

  const handleBlur = (clearSugerencias) => {
    setTimeout(() => clearSugerencias([]), 1); // Timeout porque al hacer clic en el desplegable, este se cierra antes de que pueda seleccionarse algo
  };

  const renderSugerencias = (sugerencias, tipo) => {
    return sugerencias.length > 0 && (
      <ul className="sugerencias">
        {sugerencias.map((item, index) => (
          <li 
            key={index} 
            onMouseDown={() => handleSugerenciaClick(item, tipo)}>
            {item.nombre || item}
          </li>
        ))}
      </ul>
    );
  };

  const handleSugerenciaClick = (item, tipo) => {
    switch (tipo) {
      case "equipo":
        setEquipo(item.nombre);
        setSugerenciasEquipo([]);
        setEquipoValido(true);
        const competicionesDeEquipo = competiciones.filter(competicion => item.competiciones.includes(competicion.id));
        if (competicionesDeEquipo.length === 1) {
          setCompeticion(competicionesDeEquipo[0].nombre);
          setCompeticionValida(true);
        }
        break;
      case "competicion":
        setCompeticion(item.nombre);
        setSugerenciasCompeticion([]);
        setCompeticionValida(true);
        const equiposDeCompeticion = equipos.filter(equipo => equipo.competiciones.includes(item.id));
        setSugerenciasEquipo(equiposDeCompeticion);
        break;
      case "temporada":
        setTemporada(item);
        setSugerenciasTemporada([]);
        setTemporadaValida(true);
        break;
      default:
        break;
    }
  };

  const isButtonDisabled = () => {
    return document.querySelectorAll('.input-invalido').length > 0;
  };

  return (
    <form className="buscador">
      <div className="campo">
        <label htmlFor="equipo">Equipo:</label>
        <input 
          type="text" 
          id="equipo" 
          value={equipo} 
          onChange={(e) => handleCambio(e, "equipo")} 
          onFocus={() => handleFocus(setSugerenciasEquipo, equipos, "equipo")} 
          onBlur={() => handleBlur(setSugerenciasEquipo)}
          autoComplete="off"
          className={equipo ? (equipoValido ? "input-valido" : "input-invalido") : ""}
        />
        {renderSugerencias(sugerenciasEquipo, "equipo")}
      </div>

      <div className="campo">
        <label htmlFor="competicion">Competición:</label>
        <input 
          type="text" 
          id="competicion" 
          value={competicion} 
          onChange={(e) => handleCambio(e, "competicion")} 
          onFocus={() => handleFocus(setSugerenciasCompeticion, competiciones, "competicion")} 
          onBlur={() => handleBlur(setSugerenciasCompeticion)}
          autoComplete="off"
          className={competicion ? (competicionValida ? "input-valido" : "input-invalido") : ""}
          disabled={equipoValido} // Bloquea el input si un equipo válido está seleccionado
        />
        {renderSugerencias(sugerenciasCompeticion, "competicion")}
      </div>

      <div className="campo">
        <label htmlFor="temporada">Temporada:</label>
        <input 
          type="text" 
          id="temporada" 
          value={temporada} 
          onChange={(e) => handleCambio(e, "temporada")} 
          onFocus={() => handleFocus(setSugerenciasTemporada, temporadas, "temporada")} 
          onBlur={() => handleBlur(setSugerenciasTemporada)}
          autoComplete="off"
          className={temporada ? (temporadaValida ? "input-valido" : "input-invalido") : ""}
        />
        {renderSugerencias(sugerenciasTemporada, "temporada")}
      </div>

      <BotonBlanco 
        texto="buscar" 
        icono="/icons/search1.svg" 
        iconoHover="/icons/search.svg" 
        disabled={isButtonDisabled()}
      />
    </form>
  );
};

export default Buscador;