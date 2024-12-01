import React, { createContext, useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { ajaxAxios } from './ajaxAxios';

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true); // Estado de carga
  const navigate = useNavigate();

  useEffect(() => {
    const sessionToken = localStorage.getItem('session_token');
    if (sessionToken) {
      getUserData();
    } else {
      setLoading(false); // Finalizar la carga si no hay token
    }
  }, []);

  const getUserData = async () => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/user`,
      method: 'GET',
      fsuccess: (data) => {
        setUser(data);
        setIsAuthenticated(true);
        setLoading(false); // Finalizar la carga después de obtener los datos del usuario
      },
      ferror: (error) => {
        setUser(null);
        setIsAuthenticated(false);
        setLoading(false); // Finalizar la carga en caso de error
      }
    });
  };

  const login = async (token) => {
    localStorage.setItem('session_token', token);
    setIsAuthenticated(true);

    await getUserData();
    navigate('/perfil');
  };

  const logout = () => {
    localStorage.removeItem('session_token');
    setIsAuthenticated(false);
    setUser(null);
    navigate('/login');
  };

  return (
    <AuthContext.Provider value={{ isAuthenticated, user, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};