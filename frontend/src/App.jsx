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
  }, []); // El array vacío asegura que useEffect solo se ejecute una vez.

  return (
    <>
      <div key={data.equipo_id}>
         <img src={`http://localhost:8000/${data.imagenes}`} alt={`Imagen ${data.equipo_id}`} />
      </div>
    </>
  );
};

export default App;
