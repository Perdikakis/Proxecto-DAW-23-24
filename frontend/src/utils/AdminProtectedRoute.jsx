import React, { useContext } from 'react';
import { Navigate } from 'react-router-dom';
import { AuthContext } from './AuthContext';
import LoadingScreen from '../componentes/LoadingScreen';

const AdminProtectedRoute = ({ element }) => {
  const { user, isAuthenticated, loading } = useContext(AuthContext);

  if (loading) {
    return <LoadingScreen />;
  }

  if (!isAuthenticated) {
    return <Navigate to="/login" />;
  }

  if (user && user.rol_id !== 1) {
    return <Navigate to="/perfil" />;
  }

  return element;
};

export default AdminProtectedRoute;