import React, { useState, useEffect } from "react";
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

  const equipos = ['Real Madrid', 'Barcelona', 'Atletico Madrid', 'Celta Vigo', 'Valencia', 'Sevilla', 'Betis'];
  const competiciones = ['La Liga', 'Premier League', 'Bundesliga', 'Serie A', 'Ligue 1'];
  // generar temporadas de prueba
  const [temporadas, setListaTemporadas] = useState([]);
  useEffect(() => {
    const yearMin = 1970;
    const yearMax = 2024;
    const temporadasList = [];
    for (let year = yearMin; year <= yearMax; year++) {
      const nextYear = year + 1;
      temporadasList.push(`${year}/${nextYear}`);
    }
    setListaTemporadas(temporadasList);
  }, []);

  const handleCambio = (e, tipo) => {
    const value = e.target.value;
  
    switch (tipo) {
      case "equipo":
        setEquipo(value);
        setSugerenciasEquipo(equipos.filter(item => item.toLowerCase().includes(value.toLowerCase())));
        setEquipoValido(equipos.includes(value));
        break;
  
      case "competicion":
        setCompeticion(value);
        setSugerenciasCompeticion(competiciones.filter(item => item.toLowerCase().includes(value.toLowerCase())));
        setCompeticionValida(competiciones.includes(value));
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

  const handleFocus = (setSugerencias, sugerencias) => {
    setSugerencias(sugerencias);
  };

  const handleBlur = (clearSugerencias) => {
    setTimeout(() => clearSugerencias([]), 1); // Timeout porque al hacer clic en el desplegable, este se cierra antes de que pueda seleccionarse algo
  };

  const handleSugerenciaClick = (sugerencia, setInput, clearSugerencias, setValido) => {
    setInput(sugerencia);
    clearSugerencias([]);
    setValido(true);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log({ equipo, competicion, temporada });
  };

  const isButtonDisabled = () => {
    return (
      (equipo && !equipoValido) || 
      (competicion && !competicionValida) || 
      (temporada && !temporadaValida)
    );
  };

  const renderSugerencias = (sugerencias, tipo) => {
    return sugerencias.length > 0 && (
      <ul className="sugerencias">
        {sugerencias.map((item, index) => (
          <li 
            key={index} 
            onMouseDown={() => handleSugerenciaClick(item, 
              tipo == "equipo" ? setEquipo : tipo == "competicion" ? setCompeticion : setTemporada, 
              tipo == "equipo" ? setSugerenciasEquipo : tipo == "competicion" ? setSugerenciasCompeticion : setSugerenciasTemporada, 
              tipo == "equipo" ? setEquipoValido : tipo == "competicion" ? setCompeticionValida : setTemporadaValida)}
          >
            {item}
          </li>
        ))}
      </ul>
    );
  };

  return (
    <form className="buscador" onSubmit={handleSubmit}>
      <div className="campo">
        <label htmlFor="equipo">Equipo:</label>
        <input 
          type="text" 
          id="equipo" 
          value={equipo} 
          onChange={(e) => handleCambio(e, "equipo")} 
          onFocus={() => handleFocus(setSugerenciasEquipo, equipos)} 
          onBlur={() => handleBlur(setSugerenciasEquipo)}
          autoComplete="off"
          className={equipo ? (equipoValido ? "input-valido" : "input-invalido") : ""}
        />
        {renderSugerencias(sugerenciasEquipo, "equipo")}
      </div>

      <div className="campo">
        <label htmlFor="temporada">Temporada:</label>
        <input 
          type="text" 
          id="temporada"
          value={temporada}
          onChange={(e) => handleCambio(e, "temporada")}
          onFocus={() => handleFocus(setSugerenciasTemporada, temporadas)} 
          onBlur={() => handleBlur(setSugerenciasTemporada)}
          autoComplete="off"
          className={temporada ? (temporadaValida ? "input-valido" : "input-invalido") : ""}
        />
        {renderSugerencias(sugerenciasTemporada, "temporada")}
      </div>

      <div className="campo">
        <label htmlFor="competicion">Competición:</label>
        <input 
          type="text" 
          id="competicion" 
          value={competicion} 
          onChange={(e) => handleCambio(e, "competicion")} 
          onFocus={() => handleFocus(setSugerenciasCompeticion, competiciones)} 
          onBlur={() => handleBlur(setSugerenciasCompeticion)}
          autoComplete="off"
          className={competicion ? (competicionValida ? "input-valido" : "input-invalido") : ""}
          disabled={!!equipo}
        />
        {renderSugerencias(sugerenciasCompeticion, "competicion")}
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
