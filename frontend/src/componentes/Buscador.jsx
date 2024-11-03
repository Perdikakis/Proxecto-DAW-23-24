import React, { useState, useEffect, useRef } from "react";
import BotonBlanco from "./BotonBlanco";
import '../css/Buscador.css';

const Buscador = () => {
  const [equipo, setEquipo] = useState('');
  const [competicion, setCompeticion] = useState('');
  const [sugerenciasEquipo, setSugerenciasEquipo] = useState([]);
  const [sugerenciasCompeticion, setSugerenciasCompeticion] = useState([]);
  const [equipoValido, setEquipoValido] = useState(false);
  const [competicionValida, setCompeticionValida] = useState(false);
  const containerRef = useRef(null);

  const equipos = ['Real Madrid', 'Barcelona', 'Atletico Madrid', 'Celta Vigo', 'Valencia', 'Sevilla', 'Betis'];
  const competiciones = ['La Liga', 'Premier League', 'Bundesliga', 'Serie A', 'Ligue 1'];

  const handleEquipoChange = (e) => {
    const value = e.target.value;
    setEquipo(value);
    const sugerencias = equipos.filter(equipo => equipo.toLowerCase().includes(value.toLowerCase()));
    setSugerenciasEquipo(sugerencias);
    setEquipoValido(equipos.includes(value));
  };

  const handleCompeticionChange = (e) => {
    const value = e.target.value;
    setCompeticion(value);
    const sugerencias = competiciones.filter(competicion => competicion.toLowerCase().includes(value.toLowerCase()));
    setSugerenciasCompeticion(sugerencias);
    setCompeticionValida(competiciones.includes(value));
  };

  const handleFocus = (setSugerencias, suggestions) => {
    setSugerencias(suggestions);
  };

  const handleSugerenciaClick = (sugerencia, setInput, clearSugerencias, setValido) => {
    setInput(sugerencia);
    clearSugerencias([]);
    setValido(true);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log({ equipo, competicion });
  };

  const handleClickOutside = (event) => {
    if (containerRef.current && !containerRef.current.contains(event.target)) {
      setSugerenciasEquipo([]);
      setSugerenciasCompeticion([]);
    }
  };

  useEffect(() => {
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  return (
    <form className="buscador" onSubmit={handleSubmit} ref={containerRef}>
      <div className="campo">
        <label htmlFor="equipo">Equipo:</label>
        <input 
          type="text" 
          id="equipo" 
          value={equipo} 
          onChange={handleEquipoChange} 
          onFocus={() => handleFocus(setSugerenciasEquipo, equipos)} 
          autoComplete="off"
          className={equipo ? (equipoValido ? "input-valido" : "input-invalido") : ""}
        />
        {sugerenciasEquipo.length > 0 && (
          <ul className="sugerencias">
            {sugerenciasEquipo.map((el, index) => (
              <li 
                key={index} 
                onClick={() => handleSugerenciaClick(el, setEquipo, setSugerenciasEquipo, setEquipoValido)}
              >
                {el}
              </li>
            ))}
          </ul>
        )}
      </div>

      <div className="campo">
        <label htmlFor="temporada">Temporada:</label>
        <input 
          type="text" 
          id="temporada"
        />
      </div>

      <div className="campo">
        <label htmlFor="competicion">Competición:</label>
        <input 
          type="text" 
          id="competicion" 
          value={competicion} 
          onChange={handleCompeticionChange} 
          onFocus={() => handleFocus(setSugerenciasCompeticion, competiciones)} 
          autoComplete="off"
          className={competicion ? (competicionValida ? "input-valido" : "input-invalido") : ""}
          disabled={!!equipo}
        />
        {sugerenciasCompeticion.length > 0 && (
          <ul className="sugerencias">
            {sugerenciasCompeticion.map((el, index) => (
              <li 
                key={index} 
                onClick={() => handleSugerenciaClick(el, setCompeticion, setSugerenciasCompeticion, setCompeticionValida)}
              >
                {el}
              </li>
            ))}
          </ul>
        )}
      </div>

      <BotonBlanco 
        texto="buscar" 
        icono="/icons/search1.svg" 
        iconoHover="/icons/search.svg" 
        disabled={equipo && !equipoValido || competicion && !competicionValida} 
      />
    </form>
  );
};

export default Buscador;