import React from "react";
import styled from "styled-components";

const Custom404 = () => {
  return (
    <ErrorPage>
      <h1>PÁGINA DE ERROR PERSONALIZADA</h1>
      <p>¡VAYA! Parece que esto ya/aún no está aquí</p>
      <a href="http://shop.kakis.es">Go back</a>
      <figure>
        <img src="img/Ratchet.webp" alt="lombax" />
      </figure>
    </ErrorPage>
  );
};

export default Custom404;

const ErrorPage = styled.div`
  @import url('https://fonts.googleapis.com/css2?family=Aldrich&display=swap');

  font-family: 'Aldrich', sans-serif;
  font-weight: 400;
  display: flex;
  flex-direction: column;
  height: 100vh;
  overflow: hidden;

  h1,
  a {
    text-align: center;
    margin-top: 10px;
    margin-bottom: 10px;
  }

  figure {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-grow: 1;
    width: 100%;
    overflow: hidden;
  }

  img {
    height: 100%;
    width: auto;
    object-fit: contain;
  }

  ::-webkit-scrollbar {
    display: none;
  }
`;
