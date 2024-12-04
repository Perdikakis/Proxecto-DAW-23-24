import React, { useContext, useState, useRef} from 'react';
import { AuthContext } from '../utils/AuthContext';
import BotonBlanco from './BotonBlanco';
import '../css/DatosPersonales.css';
import { ajaxAxios } from '../utils/ajaxAxios';

const DatosPersonales = () => {
    const { user, setUser } = useContext(AuthContext);

    const [usuario, setUsuario] = useState(user);
    const [camposEditables, setCamposEditables] = useState({});
    const [editando, setEditando] = useState(null);
    const inputRefs = useRef({});
    
    const handleEditar = (field) => {
        if (editando) {
            return;
        }
        setCamposEditables((prev) => ({
            ...prev,
            [field]: !prev[field]
        }));
        setEditando(field);
        setTimeout(() => {
            inputRefs.current[field].focus();
        }, 0);
    };
    
    const handleConfirmar = (field) => { 
        let isValid = true;

        switch (field) {
            case 'correo':
                isValid = validarCorreo(inputRefs.current[field].value);
                break;
            case 'usuario':
                isValid = validarUsuario(inputRefs.current[field].value);
                break;
            case 'password':
                isValid = validarPassword(inputRefs.current[field].value);
                break;
            case 'nombre':
                isValid = validarNombre(inputRefs.current[field].value);
                break;
            case 'apellidos':
                isValid = validarApellidos(inputRefs.current[field].value);
                break;
            case 'telefono':
                isValid = validarTelefono(inputRefs.current[field].value);
                break;
            case 'direccion':
                isValid = validarDireccion(inputRefs.current[field].value);
                break;
            default:
                break;
        }    

        if (isValid) {
            setCamposEditables((prev) => ({
                ...prev,
                [field]: false
            }));
            setEditando(null);
            setUsuario((prevUsuario) => ({
                ...prevUsuario,
                [field]: inputRefs.current[field].value
            }));
        } else {
            inputRefs.current[field].value = usuario[field];
            console.log(`El campo ${field} no es válido.`);
        }
    };

    const handleCancelar = (field) => {
        setCamposEditables((prev) => ({
            ...prev,
            [field]: false
        }));
        setEditando(null);
    };
    
    const handleGuardar = (e) => {
        e.preventDefault();
    
        ajaxAxios({
            url: `${import.meta.env.VITE_API_URL}/updateUser`,
            method: 'POST',
            data: usuario,
            fsuccess: (data) => {
                window.location.reload();
            },
            ferror: (error) => {
                console.log(error);
            }
        });
    };

    const validarCorreo = (correo) => {
        if (correo === '') return true;
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(correo);
    };
    const validarUsuario = (usuario) => {
        return usuario.trim().length > 6;
    };
    const validarPassword = (password) => {
        return password.length >= 6;
    };
    const validarNombre = (nombre) => {
        return true;
    };
    const validarApellidos = (apellidos) => {
        return true;
    };
    const validarTelefono = (telefono) => {
        if (telefono === '') return true;
        const regex = /^[0-9]{9}$/;
        return regex.test(telefono);
    };
    const validarDireccion = (direccion) => {
        return true;
    };
    
    const CampoFormulario = ({ icon, label, type, name, value, placeholder, onChange, editable, onEditClick, onConfirmClick, onCancelClick, inputRef }) => {
        return (
            <div className={`campo-formulario ${editable ? 'editable' : ''} ${editando && !editable ? 'no-editable' : ''}`}>
                
                <figure>
                    <img src={icon} alt={name} />
                </figure>
                <label htmlFor={name}>{label}</label>
                <input
                    type={type}
                    name={name}
                    id={name}
                    defaultValue={value ?? ''}
                    placeholder={placeholder}
                    onChange={onChange}
                    disabled={!editable}
                    ref={inputRef}
                    autoComplete='off'
                />
                <figure onClick={onEditClick}>
                    <img src={"/icons/pencil.svg"} alt="editar" />
                </figure>
                {editable && (
                <div className="controles">
                    <figure onClick={onConfirmClick}>
                        <img src="/icons/checked.svg" alt="confirmar" />
                    </figure>
                    <figure onClick={onCancelClick}>
                        <img src="/icons/delete.svg" alt="cancelar" />
                    </figure>
                </div>
            )}
            </div>
        );
    };

    return (
        <section className="main-datos">
            <form className='formulario-datos' onSubmit={handleGuardar}>
            <h2>Datos Personales</h2>
            <CampoFormulario
                icon="/icons/mail.svg"
                label="Correo:"
                type="email"
                name="correo"
                value={usuario.correo}
                placeholder={'Correo'}
                onChange={(e) => validarCorreo(e.target.value)}
                editable={camposEditables.correo}
                onEditClick={() => handleEditar('correo')}
                onConfirmClick={() => handleConfirmar('correo')}
                onCancelClick={() => handleCancelar('correo')}
                inputRef={(el) => (inputRefs.current.correo = el)}
            />
            <CampoFormulario
                icon="/icons/user.svg"
                label="Usuario:"
                type="text"
                name="usuario"
                value={usuario.usuario}
                placeholder={'Usuario'}
                onChange={(e) => validarUsuario(e.target.value)}
                editable={camposEditables.usuario}
                onEditClick={() => handleEditar('usuario')}
                onConfirmClick={() => handleConfirmar('usuario')}
                onCancelClick={() => handleCancelar('usuario')}
                inputRef={(el) => (inputRefs.current.usuario = el)}
            />
            {/*<CampoFormulario
                icon="/icons/lock.svg"
                label="Password:"
                type="password"
                name="password"
                value={usuario.password}
                placeholder={'Contraseña'}
                onChange={(e) => validarPassword(e.target.value)}
                editable={camposEditables.password}
                onEditClick={() => handleEditar('password')}
                onConfirmClick={() => handleConfirmar('password')}
                onCancelClick={() => handleCancelar('password')}
                inputRef={(el) => (inputRefs.current.password = el)}
            />*/}
            <CampoFormulario
                icon="/icons/id-card.svg"
                label="Nombre:"
                type="text"
                name="nombre"
                value={usuario.nombre}
                placeholder={'Nombre'}
                onChange={(e) => validarNombre(e.target.value)}
                editable={camposEditables.nombre}
                onEditClick={() => handleEditar('nombre')}
                onConfirmClick={() => handleConfirmar('nombre')}
                onCancelClick={() => handleCancelar('nombre')}
                inputRef={(el) => (inputRefs.current.nombre = el)}
            />
            <CampoFormulario
                icon="/icons/id-card.svg"
                label="Apellidos:"
                type="text"
                name="apellidos"
                value={usuario.apellidos}
                placeholder={'Apellidos'}
                onChange={(e) => validarApellidos(e.target.value)}
                editable={camposEditables.apellidos}
                onEditClick={() => handleEditar('apellidos')}
                onConfirmClick={() => handleConfirmar('apellidos')}
                onCancelClick={() => handleCancelar('apellidos')}
                inputRef={(el) => (inputRefs.current.apellidos = el)}
            />
            <CampoFormulario
                icon="/icons/phone.svg"
                label="Telefono:"
                type="number"
                name="telefono"
                value={usuario.telefono}
                placeholder={'Teléfono'}
                onChange={(e) => validarTelefono(e.target.value)}
                editable={camposEditables.telefono}
                onEditClick={() => handleEditar('telefono')}
                onConfirmClick={() => handleConfirmar('telefono')}
                onCancelClick={() => handleCancelar('telefono')}
                inputRef={(el) => (inputRefs.current.telefono = el)}
            />
            <CampoFormulario
                icon="/icons/home.svg"
                label="Direccion envio:"
                type="text"
                name="direccion"
                value={usuario.direccion}
                placeholder={'Dirección'}
                onChange={(e) => validarDireccion(e.target.value)}
                editable={camposEditables.direccion}
                onEditClick={() => handleEditar('direccion')}
                onConfirmClick={() => handleConfirmar('direccion')}
                onCancelClick={() => handleCancelar('direccion')}
                inputRef={(el) => (inputRefs.current.direccion = el)}
            />
            <BotonBlanco 
                texto="enviar" 
                icono={null}
                iconoHover={null}
                disabled={false}
            />
            </form>
        </section>
    );
};

export default DatosPersonales;