// src/App.js
import React, { useEffect, useState } from "react";
import axios from "axios";

const App = () => {
  const [data, setData] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    axios.get("http://localhost:8000/pedidos/1/camisetas")
      .then(response => {
        setData(response.data);
        console.log(response.data)
      })
      .catch(error => {
        setError("Error al obtener los datos de la API");
      });
  }, []); // El array vacío asegura que useEffect solo se ejecute una vez.

  return (
    <></>
  );
};

export default App;
