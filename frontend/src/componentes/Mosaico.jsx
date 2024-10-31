import React from 'react';
import '../css/Mosaico.css';

const Mosaico = ({ imageUrls, hoverTexts }) => {
  return (
    <div className="mosaico">
        {imageUrls.map((url, index) => ( 
            <figure className={`celda celda${index + 1}`} key={index}> 
                <img src={url} alt={`Imagen${index + 1}`} />
                <figcaption>{hoverTexts[index]}</figcaption>
            </figure>
        ))}
    </div>
  );
};

export default Mosaico;