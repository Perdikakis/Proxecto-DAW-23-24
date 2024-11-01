import React from 'react';
import '../css/LoadingScreen.css';

const LoadingScreen = () => {
  return (
    <div id="loading-screen">
        <img className="logo" src="/img/logo.png" alt="logo" />
        <h1>CAMIKAKIS</h1>
        <img className="background-image" src="/img/fondos/camisetas.webp" alt="Fondo" />
        <img className="loading-gif" src="/img/fondos/loading.gif" alt="Cargando" />
    </div>
  );
};

export default LoadingScreen;
