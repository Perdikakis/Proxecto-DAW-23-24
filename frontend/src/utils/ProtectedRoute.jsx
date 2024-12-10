import React, { useContext } from 'react';
import { Navigate } from 'react-router-dom';
import { AuthContext } from './AuthContext';
import LoadingScreen from '../componentes/LoadingScreen';

const ProtectedRoute = ({ element }) => {
  const { isAuthenticated, loading } = useContext(AuthContext);

  if (loading) {
    return <LoadingScreen />;
  }

  return isAuthenticated ? element : <Navigate to="/login" />;
};

export default ProtectedRoute;