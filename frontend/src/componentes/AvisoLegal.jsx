import React from 'react';
import '../css/AvisoLegal.css';

const AvisoLegal = () => {
  return (
    <main className="main-avisolegal">
      <section className="aviso-legal-content">
        <h1>Aviso Legal</h1>
        
        <article>
            <h2>Identificación del Responsable</h2>
            <p><strong>Nombre de la Empresa:</strong> Camikakis SL</p>
            <p><strong>CIF:</strong> [XXXXXX]</p>
            <p><strong>Domicilio Social:</strong> Av. Avenida nº0, Población, Provincia</p>
            <p><strong>Correo Electrónico:</strong> mcordoluengos@gmail.com</p>
            <p><strong>Teléfono:</strong> 666 666 666</p>
            <p>El presente aviso regula las condiciones de uso del sitio web <i>kakis.es</i> (en adelante, el "Sitio Web").</p>
        </article>

        <article>
            <h2>Propiedad Intelectual</h2>
            <p>
            Todos los derechos de propiedad intelectual e industrial sobre el contenido de este Sitio Web, incluidos textos, imágenes, logotipos, diseños, software, bases de datos y cualquier otro material, son propiedad exclusiva de Camikakis SL o de terceros que han autorizado su uso.
            <br />
            Queda estrictamente prohibida la reproducción, distribución, comunicación pública, transformación o cualquier otra forma de explotación, total o parcial, sin el consentimiento expreso por escrito del titular de los derechos.
            </p>
        </article>

        <article>
            <h2>Condiciones de Uso del Sitio Web</h2>
            <p>
            El acceso y uso del Sitio Web atribuyen la condición de usuario, implicando la aceptación de las presentes condiciones legales. El usuario se compromete a:
            <ul>
                <li>Usar el Sitio Web y sus servicios conforme a la legislación vigente, la moral, las buenas costumbres y el orden público.</li>
                <li>Abstenerse de realizar actividades ilícitas o lesivas para los derechos e intereses de terceros.</li>
            </ul>
            En caso de incumplimiento de las condiciones de uso, Camikakis SL se reserva el derecho de restringir o bloquear el acceso al Sitio Web.
            </p>
        </article>

        <article>
            <h2>Protección de Datos</h2>
            <p>
            De acuerdo con la normativa de protección de datos personales (RGPD y LOPD-GDD en España), informamos a los usuarios de lo siguiente:
            <ul>
                <li><strong>Responsable del Tratamiento</strong>: Camikakis SL.</li>
                <li><strong>Finalidad</strong>Gestionar las consultas realizadas a través del Sitio Web y, en su caso, la contratación de productos y servicios.</li>
                <li><strong>Legitimación</strong>Consentimiento del interesado y ejecución de un contrato.</li>
                <li><strong>Derechos</strong>El usuario puede ejercer los derechos de acceso, rectificación, supresión, oposición, limitación y portabilidad de sus datos enviando un correo electrónico a mcordoluengos@gmail.com.</li>
            </ul>
            </p>
        </article>

        <article>
            <h2>Exclusión de Responsabilidad</h2>
            <p>
            Camikakis SL no garantiza la disponibilidad permanente del Sitio Web ni la ausencia de errores en sus contenidos. No asumimos responsabilidad alguna por:
            <ul>
                <li>Daños y perjuicios derivados del acceso o uso del Sitio Web.</li>
                <li>Fallos técnicos o errores en el funcionamiento del Sitio Web.</li>
            </ul>
            </p>
        </article>

        <article>
            <h2>Enlaces a Terceros</h2>
            <p>
            El Sitio Web puede contener enlaces a páginas web de terceros. Camikakis SL no se responsabiliza del contenido ni de las políticas de privacidad de dichas páginas. El acceso a estos enlaces será bajo la exclusiva responsabilidad del usuario.
            </p>
        </article>

        <article>
            <h2>Modificación del Aviso Legal</h2>
            <p>
            Camikakis SL se reserva el derecho a modificar este Aviso Legal en cualquier momento y sin previo aviso para adaptarlo a cambios legislativos o por necesidades del Sitio Web. Recomendamos al usuario revisar periódicamente esta sección.
            </p>
        </article>

        <article>
            <h2>Legislación y Jurisdicción Aplicable</h2>
            <p>
            Las presentes condiciones se rigen por la legislación española. Para cualquier controversia relacionada con el uso del Sitio Web, las partes se someten expresamente a la jurisdicción de los Juzgados y Tribunales de Pontevedra, salvo que la normativa aplicable disponga lo contrario.
            </p>
        </article>
      </section>
    </main>
  );
};

export default AvisoLegal;