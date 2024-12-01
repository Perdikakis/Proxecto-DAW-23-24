import React, { useContext } from 'react';
import { Navigate } from 'react-router-dom';
import { AuthContext } from '../utils/AuthContext';
import LoadingScreen from './LoadingScreen';

const ProtectedRoute = ({ element }) => {
  const { isAuthenticated, loading } = useContext(AuthContext);

  if (loading) {
    return <LoadingScreen />; // Mostrar un indicador de carga mientras se verifica la autenticación
  }

  return isAuthenticated ? element : <Navigate to="/login" />;
};

export default ProtectedRoute;