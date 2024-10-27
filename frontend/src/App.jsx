// src/App.js
import React, { useEffect, useState } from "react";
import axios from "axios";
import Header from "./componentes/Header";
import Footer from "./componentes/Footer";
import Main from "./componentes/Main";

const App = () => {
  const [data, setData] = useState([]);
  const [error, setError] = useState(null);

  // scroll inicial
  useEffect(() => {
    window.scrollTo({
      top: 300,
      behavior: 'smooth'
    });
  }, []);

  function ajaxAxios(options) {
    let { url, method, fsuccess, ferror, data } = options;
    axios(url, {
      method: method || "GET",
      headers: {
        "Content-type": "application/json; charset=utf-8"
      },
      data: JSON.stringify(data),
    })
      .then((resp) => fsuccess(resp.data))
      .catch((error) => {
        ferror({
          status: error.response.status,
          statusText: error.response.statusText,
        });
      });
  }

  useEffect(() => {
    ajaxAxios({
      url: "http://localhost:8000/barsa",
      method: "GET",
      /*data: {
        usuario: "user1",
        password: "abc123"
      },*/
      fsuccess: (data) => {
        setData(data)
      },
      ferror: (err) => {
        console.log(err)
      },
    });
  }, []);

  return (
    <>
        <Header />
        <Main />
        <Footer />
    </>
  );
};

export default App;
