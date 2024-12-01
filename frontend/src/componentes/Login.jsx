import React, { useState, useContext, useEffect } from 'react';
import axios from 'axios';
import '../css/Login.css';
import { AuthContext } from '../utils/AuthContext';
import BotonBlanco from './BotonBlanco';

const Login = () => {
  const [isLogin, setIsLogin] = useState(true);
  const [correo, setCorreo] = useState('');
  const [usuario, setUsuario] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const { login } = useContext(AuthContext);

  const handleSubmitLogin = async (e) => {
    e.preventDefault();
    try {
        const response = await axios.post(`${import.meta.env.VITE_API_URL}/login`, {
            usuario,
            password
        }, {
            withCredentials: true,
        });

        login(response.data.token);
    } catch (error) {
        setError('Usuario o contraseña incorrectos');
    }
  };

  return (
    <main className='main-login'>
      <section className='opciones'>
        <a href="#" className={isLogin ? 'seleccionado' : ''} onClick={(e) => {e.preventDefault(); setIsLogin(true)}}>INICIAR SESIÓN</a>
        <figure>
          <img src='/icons/der.svg' alt="cambiar" />
        </figure>
        <a href="#" className={!isLogin ? 'seleccionado' : ''} onClick={(e) => {e.preventDefault(); setIsLogin(false)}}>REGISTRARSE</a>
      </section>
      {isLogin ? (
        <form className='formulario-login'>
        <h2>INICIAR SESION</h2>
          <div className='campo-formulario'>
            <figure>
              <img src="/icons/user.svg" alt="password" />
            </figure>
            <label htmlFor='usuario'>Usuario:</label>
            <input
              type="text"
              name='usuario'
              id='usuario'
              placeholder='Usuario'
              value={usuario}
              onChange={(e) => setUsuario(e.target.value)}
              autoComplete='off'
            />
          </div>
          <div className='campo-formulario'>
            <figure>
              <img src="/icons/lock.svg" alt="password" />
            </figure>
            <label htmlFor='password'>Password:</label>
            <input
              type="password"
              name='password'
              id='password'
              placeholder='********'
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              autoComplete='off'
            />
          </div>
          {error && <p style={{ color: 'red' }}>{error}</p>}
          <a href="">¿Olvidaste tu contraseña?</a>
          <BotonBlanco 
            texto="enviar" 
            icono={null}
            iconoHover={null}
            disabled={false}
            onClick={handleSubmitLogin}
          />
        </form>
      ) : (
        <form className='formulario-login'>
          <h2>REGISTRARSE</h2>
          <div className='campo-formulario'>
            <figure>
              <img src="/icons/mail.svg" alt="password" />
            </figure>
            <label htmlFor='correo'>Correo:</label>
            <input
              type="text"
              name='correo'
              id='correo'
              placeholder='usuario@correo.com'
              value={usuario}
              onChange={(e) => setUsuario(e.target.value)}
              autoComplete='off'
            />
          </div>
          <div className='campo-formulario'>
            <figure>
              <img src="/icons/user.svg" alt="password" />
            </figure>
            <label htmlFor='usuario'>Usuario:</label>
            <input
              type="text"
              name='usuario'
              id='usuario'
              placeholder='Usuario'
              value={correo}
              onChange={(e) => setCorreo(e.target.value)}
              autoComplete='off'
            />
          </div>
          <div className='campo-formulario'>
            <figure>
              <img src="/icons/lock.svg" alt="password" />
            </figure>
            <label htmlFor='password'>Password:</label>
            <input
              type="password"
              name='password'
              id='password'
              placeholder='********'
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              autoComplete='off'
            />
          </div>
          {error && <p style={{ color: 'red' }}>{error}</p>}
          <BotonBlanco 
            texto="enviar" 
            icono={null}
            iconoHover={null}
            disabled={false}
            onClick={handleSubmitLogin}
          />
        </form>
      )}
    </main>
  );
};

export default Login;