import React, { useEffect, useState } from "react";
import axios from "axios";
import Header from "./componentes/Header";
import Footer from "./componentes/Footer";
import Main from "./componentes/Main";
import LoadingScreen from "./componentes/LoadingScreen";

const App = () => {
  const [data, setData] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoadingScreen] = useState(true);

  useEffect(() => {
    // Simulamos la carga de datos
    setTimeout(() => {
      setLoadingScreen(false);
    }, 1000);

    /* Función AJAX */
    /*ajaxAxios({
      url: "http://localhost:8000/test-loading-screen",
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
        setLoadingScreen(false); // Termina la carga incluso si hay un error
      },
    });*/
    
  }, []);

  return (
    <>
      <div style={{ opacity: loading ? 1 : 0, transition: 'opacity 1s ease', pointerEvents: loading ? 'auto' : 'none' }}>
        <LoadingScreen />
      </div>
      <div style={{ opacity: loading ? 0 : 1, transition: 'opacity 1s ease' }}>
        <Header />
        <Main />
        <Footer />
      </div>
    </>
  );
  
};

function ajaxAxios(options) { 
  let { url, method, fsuccess, ferror, data } = options; 
  axios(url, { 
    method: method || "GET", 
    headers: { "Content-type": "application/json; charset=utf-8" }, 
    data: JSON.stringify(data), 
  }) 
    .then((resp) => fsuccess(resp.data)) 
    .catch((error) => { 
      ferror({ 
        status: error.response ? error.response.status : "Network Error", 
        statusText: error.response ? error.response.statusText : error.message, 
      }); 
    }); 
}

export default App;