import React from "react";
import './css/bootstrap-alerts.css';
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Header from "./componentes/Header";
import Footer from "./componentes/Footer";
import Landing from "./componentes/Landing";
import Tienda from "./componentes/Tienda";
import Camiseta from "./componentes/Camiseta";
import Custom404 from "./componentes/Custom404";
import Perfil from "./componentes/Perfil";
import Login from "./componentes/Login";
import { AuthProvider } from "./utils/AuthContext";
import ProtectedRoute from "./utils/ProtectedRoute";
import AdminProtectedRoute from "./utils/AdminProtectedRoute";
import AdminPanel from "./componentes/AdminPanel";

const App = () => {
  return (
    <Router>
      <AuthProvider>
        <Header />
        <Routes>
          <Route path="/" element={<Landing />} />
          <Route path="/tienda" element={<Tienda />} />
          <Route path="/camiseta/:id" element={<Camiseta />} />
          <Route path="/perfil/*" element={<ProtectedRoute element={<Perfil />} />} />
          <Route path="/admin" element={<AdminProtectedRoute element={<AdminPanel />} />} />
          <Route path="/login" element={<Login />} />
          <Route path="*" element={<Custom404 />} />
        </Routes>
        <Footer />
      </AuthProvider>
    </Router>
  );
};

export default App;