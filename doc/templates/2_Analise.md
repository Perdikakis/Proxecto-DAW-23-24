# Requerimientos do sistema

  

- [Requerimientos do sistema](#requerimientos-do-sistema)

- [1- Descrición Xeral](#1--descrición-xeral)

- [2- Funcionalidades](#2--funcionalidades)

- [3- Tipos de usuarios](#3--tipos-de-usuarios)

- [4- Contorno operacional](#4--contorno-operacional)

- [5- Normativa](#5--normativa)

- [6- Melloras futuras](#6--melloras-futuras)

  

## 1- Descrición Xeral
  

## 2- Funcionalidades
**-Registro de usuario:**
1. El *frontend* muestra el formulario y tras el usuario rellenarlo, valida los campos.
2. El *frontend* envía una solicitud al servidor a través de la API REST, la cual valida los datos y comprueba que no existan para posteriormente interactuar con la base de datos.
3. El servidor devuelve una respuesta al cliente conforme se ha realizado el registro o bien un mensaje de error.

**-Visualizar catálogo:**
1. El usuario accede a la sección del catálogo en el *frontend*.
2. El *frontend* hace una petición al servidor que consultará la base de datos para obtener una lista de productos.
3. La API formatea los datos a JSON y los envia al frontend.
4. El frontend renderiza los datos para la visualización del usuario.

**-Carrito de compras:**
1. Previamente a añadir un producto al carrito, los datos que se están visualizando se habrán guardado en el cliente al mostrarse para no tener que hacer peticiones al servidor para añadir un producto al carrito.
2. El usuario hace *click* en agregar producto previamente introduciendo la cantidad y este se agrega al carrito de forma local.

**-Realizar pedidos:**
1. Una vez agregado los productos y al hacer *click* en Realizar pedido, se muestra un resumen de este.
2. El cliente muestra un formulario para introducir datos de envío.
3. El cliente valida dichos datos y envía una petición al servidor para crear el pedido.
4. Una vez el servidor valida los datos de envío y el stock del pedido, registra el pedido y manda un mensaje al cliente para redirigir al usuario a la pasarela de pago junto con los datos del pedido.
5. La pasarela de pago envía un mensaje al servidor conforme se haya realizado el pago.
6. Si el pago se realiza correctamente, se actualiza el estado del pedido en la base de datos además de enviar al usuario un correo electrónico confirmando dicho pedido junto a los detalles y si no, se envía un mensaje al cliente de que ha ocurrido un error en el pago.

**-Seguimiento de pedido:**
1. El usuario introduce sus credenciales en el formulario de inicio de sesión, se validan los datos introducidos y se envía una petición al servidor.
2. El servidor además de verificar sus credenciales obtiene sus datos personales y entre ellos, sus pedidos. Envía dichos datos al cliente.
3. El cliente redirige al usuario a la página de su perfil junto con su información y pedidos. Al hacer clic en el pedido se envía una solicitud a una API externa de Google con su ubicación actual para que este muestre un mapa con su localización.

**-Panel de control y estadísticas de ventas:**
1. Al iniciar sesión, se comprueba el tipo de usuario que es. Si es un usuario con permisos, se muestra en el menú principal un nueva pestaña llamada Panel de Control.
2. El usuario hace *click* en la pestaña y envía una solicitud al servidor para mostrar su contenido.
3. El servidor comprueba que es un usuario con permisos y devuelve al cliente el ok junto con datos a mostrar y un formulario que permita consultar estadísticas.
4. El cliente renderiza un formulario y al usuario hacer *click* en Consultar Estadísticas, este valida dichos campos y envía una petición al servidor para mostrar los datos que cumplen con los filtros del formulario.
5. El servidor comprueba que el usuario que está haciendo la petición tenga permisos y realiza la consulta a la base de datos. Si todo ocurre sin errores, envía los datos al cliente o un mensaje de error.
6. El cliente renderiza los datos recibidos del servidor.

## 3- Tipos de usuarios

|					  |Invitado   |Usuario |Administrador|
|--------------------:|:---------:|:------:|:-----------:|
|*Registro de usuario*|✔️	 	  |✔️ 	   |✔️			 |
|*Visualizar catálogo*|✔️		  |✔️	   |✔️			 |
|*Carrito de compras* |✔️		  |✔️	   |✔️			 |
|*Realizar pedidos*   |❌		  |✔️	   |✔️			 |
|*Seguimiento pedido* |❌		  |✔️	   |✔️			 |
|*Panel de control*   |❌		  |❌	   |✔️			 |
|*Estadísticas ventas*|❌		  |❌	   |✔️			 |

## 4- Contorno operacional

El usuario deberá disponer de un dispositivo con un navegador web y conexión a internet.
  

## 5- Normativa

  

>  *EXPLICACION* Investigarase que normativa vixente afecta ao desenvolvemento do proxecto e de que maneira. O proxecto debe adaptarse ás esixencias legais dos territorios onde vai operar.

>

> Pola natureza dos sistema de información, unha lei que se vai a ter que mencionar de forma obrigatoria é la [Ley Orgánica 3/2018, de 5 de diciembre, de Protección de Datos Personales y garantía de los derechos digitales (LOPDPGDD)](https://www.boe.es/buscar/act.php?id=BOE-A-2018-16673). O ámbito da LOPDPGDD é nacional. Se a aplicación está pensada para operar a nivel europeo, tamén se debe facer referencia á [General Data Protection Regulation (GDPR)](https://eur-lex.europa.eu/eli/reg/2016/679/oj). Na documentación debe afirmarse que o proxecto cumpre coa normativa vixente.

>

> Para cumplir a LOPDPGDD e/ou GDPR debe ter un apartado na web onde se indique quen é a persoa responsable do tratamento dos datos e para que fins se van utilizar. Habitualmente esta información estructúrase nos seguintes apartados:

>

>  - Aviso legal.

>  - Política de privacidade.

>  - Política de cookies.

>

> É acosenllable ver [exemplos de webs](https://www.spotify.com/es/legal/privacy-policy/) que conteñan textos legais referenciando a LOPDPGDD ou GDPR.

  

## 6- Melloras futuras
-Añadir funcionalidades como **consultar estadísticas** de fútbol en directo o la creación de **ligas fantasy**.

-**Programa de fidelización** con el que los usuarios pueden conseguir puntos haciendo uso de las distintas secciones de la plataforma que después se podrán canjear por descuentos o premios.

-**Marketplace**: permitir a otras tiendas y usuarios particulares vender sus propias camisetas en la plataforma.

-Desarrollo de una **aplicación móvil**.