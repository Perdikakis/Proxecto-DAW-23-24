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
  const [password2, setPassword2] = useState('');

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

  const validarCorreo = () => {
    const regex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    return regex.test(correo);
  };

  const validarUsuario = () => {
    const regex = /^[a-zA-Z0-9_-]{6,16}$/;
    return regex.test(usuario)
  };

  const validarPassword = () => {
    const regex = /^.{6,64}$/;
    return regex.test(password);
  };

  const handleSubmitSignIn = async (e) => {
    e.preventDefault();
    const correoValido = validarCorreo();
    const usuarioValido = validarUsuario();
    const passwordValida = validarPassword();

    if (!correoValido) {
      return setError('Email invalido.\nDebe ser un correo electrónico válido.');
    }
    if (!usuarioValido) {
      return setError('Usuario invalido.\nDebe tener entre 6 y 16 caracteres y solo puede contener letras, números, guiones y guiones bajos.');
    }
    if (!passwordValida) {
      return setError('Contraseña invalida.\nLa contraseña debe tener entre 6 y 64 caracteres.');
    }
    if (password !== password2) {
      return setError('Las contraseñas no coinciden.');
    }

    try {
        const response = await axios.post(`${import.meta.env.VITE_API_URL}/signin`, {
            usuario,
            password,
            correo
        }, {
            withCredentials: true,
        });

        login(response.data.token);
    } catch (error) {
        setError('Error');
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
              placeholder='Contraseña'
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
              value={correo}
              onChange={(e) => setCorreo(e.target.value)}
              autoComplete='off'
            />
          </div>
          <div className='campo-formulario'>
            <figure>
              <img src="/icons/user.svg" alt="password" />
            </figure>
            <label htmlFor='usuarioS'>Usuario:</label>
            <input
              type="text"
              name='usuarioS'
              id='usuarioS'
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
            <label htmlFor='passwordS'>Password:</label>
            <input
              type="password"
              name='passwordS'
              id='passwordS'
              placeholder='Contraseña'
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              autoComplete='off'
            />
          </div>
          <div className='campo-formulario'>
            <figure>
              <img src="/icons/lock.svg" alt="password2" />
            </figure>
            <label htmlFor='passwordS2'>Password:</label>
            <input
              type="password"
              name='passwordS2'
              id='passwordS2'
              placeholder='Repetir contraseña'
              value={password2}
              onChange={(e) => setPassword2(e.target.value)}
              autoComplete='off'
            />
          </div>
          {error && <p style={{ color: 'red', whiteSpace: 'pre-line', textAlign: 'center'}}>{error}</p>}
          <BotonBlanco 
            texto="enviar" 
            icono={null}
            iconoHover={null}
            disabled={false}
            onClick={handleSubmitSignIn}
          />
        </form>
      )}
    </main>
  );
};

export default Login;