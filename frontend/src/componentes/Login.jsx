import React, { useState, useContext } from 'react';
import axios from 'axios';
import '../css/Login.css';
import { AuthContext } from '../utils/AuthContext';

const Login = () => {
  const [usuario, setUsuario] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const { login } = useContext(AuthContext);

  const handleSubmit = async (e) => {
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
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor='usuario'>Usuario:</label>
          <input
            type="text"
            name='usuario'
            id='usuario'
            value={usuario}
            onChange={(e) => setUsuario(e.target.value)}
          />
        </div>
        <div>
          <label htmlFor='password'>Password:</label>
          <input
            type="password"
            name='password'
            id='password'
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        {error && <p style={{ color: 'red' }}>{error}</p>}
        <button type="submit">Login</button>
      </form>
    </main>
  );
};

export default Login;