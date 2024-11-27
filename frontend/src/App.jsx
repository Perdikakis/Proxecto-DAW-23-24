import React, { useEffect, useState } from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import axios from "axios";
import Header from "./componentes/Header";
import Footer from "./componentes/Footer";
import Landing from "./componentes/Landing";
import LoadingScreen from "./componentes/LoadingScreen";
import Tienda from "./componentes/Tienda";
import Camiseta from "./componentes/Camiseta";
import Custom404 from "./componentes/Custom404";
import Perfil from "./componentes/Perfil";

const App = () => {
  const [data, setData] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoadingScreen] = useState(true);

  useEffect(() => {
    // Simulamos la carga de datos
    /*setTimeout(() => {
      setLoadingScreen(false);
    }, 1000);*/
    
    /* Función AJAX */
    /*ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/test-loading-screen`,
      method: "GET",
      data: {
        usuario: "user1",
        password: "abc123"
      },
      fsuccess: (data) => {
        setData(data);
        setLoadingScreen(false); // Termina la carga cuando se reciben los datos
      },
      ferror: (err) => {
        console.log(err);
        setError(err);
        setLoadingScreen(false); // Termina la carga si hay un error
      },
    });*/
    
  }, []);

  return (
    <Router>
      {/*<div style={{ opacity: loading ? 1 : 0, transition: 'opacity 1s ease', pointerEvents: loading ? 'auto' : 'none' }}>
        <LoadingScreen />
      </div>*/}
      <div style={{ /*opacity: loading ? 0 : 1*/ opacity: 1, transition: 'opacity 1s ease' }}>
        <Header />
        <Routes>
          <Route path="/" element={<Landing />} />
          <Route path="/tienda" element={<Tienda />} />
          <Route path="/camiseta/:id" element={<Camiseta />} />
          <Route path="/perfil" element={<Perfil />} />
          <Route path="*" element={<Custom404 />} />
        </Routes>
        <Footer />
      </div>
    </Router>
  );
};

export default App;