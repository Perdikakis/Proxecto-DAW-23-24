// src/App.js
import React, { useEffect, useState } from "react";
import axios from "axios";

const App = () => {
  const [data, setData] = useState([]);
  const [error, setError] = useState(null);

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
      url: "http://localhost:8000/login",
      method: "POST",
      data: {
        usuario: "user1",
        password: "abc123"
      },
      fsuccess: (data) => console.log(data),
      ferror: (err) => {
        console.log(err)
      },
    });
  }, []); // El array vacío asegura que useEffect solo se ejecute una vez.

  return (
    <></>
  );
};

export default App;
