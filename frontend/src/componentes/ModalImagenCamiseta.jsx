import React, { useEffect, useState } from 'react';
import '../css/ModalImagenCamiseta.css';

const ModalImagenCamiseta = ({ isOpen, onClose, children, onPrev, onNext }) => {
    const [isVisible, setIsVisible] = useState(isOpen);

    useEffect(() => {
        if (isOpen) {
            setIsVisible(true);
        } else {
            const timer = setTimeout(() => setIsVisible(false), 300); // Duración de la animación
            return () => clearTimeout(timer);
        }
    }, [isOpen]);

    if (!isVisible) return null;

    return (
        <div className={`modal-overlay ${!isOpen ? 'fade-out' : ''}`} onClick={onClose}>
          <div className={'modal-content'}>
            <button className="modal-prev" onClick={(e) => { e.stopPropagation(); onPrev(); }}>{"<"}</button>
            <button className="modal-next" onClick={(e) => { e.stopPropagation(); onNext(); }}>{">"}</button>
            {children}
          </div>
        </div>
    );
};

export default ModalImagenCamiseta;