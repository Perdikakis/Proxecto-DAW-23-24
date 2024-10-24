
# Requerimientos do sistema

  

  

  

- [Requerimientos do sistema](#requerimientos-do-sistema)

  

  

- [1- Descrición Xeral](#1--descrición-xeral)

  

  

- [2- Funcionalidades](#2--funcionalidades)

  

  

- [3- Tipos de usuarios](#3--tipos-de-usuarios)

  

  

- [4- Contorno operacional](#4--contorno-operacional)

  

  

- [5- Normativa](#5--normativa)

  

  

- [6- Melloras futuras](#6--melloras-futuras)

  

  

  

## 1- Descrición Xeral

  La página web será una tienda de réplicas de camisetas de segunda mano que tendrá la capacidad de gestionar usuarios, pedidos, stock y consultar estadísticas sobre los productos más vendidos
  
## 2- Funcionalidades

6. El cliente renderiza los datos recibidos del servidor.

| Acción | Descripción |
|----------|----------|
| Registro de Usuario    | Añadir registro a la BBDD   |
| Visualizar Catálogo    | Consultar BBDD   |
| Realizar pedidos    | Añadir pedido a la BBDD y reducir stock   |
| Panel de control y estadísticas de venta    | Modificar registros de la BBDD   |

## 3- Tipos de usuarios

|                         | Invitado | Usuario | Administrador |
|------------------------:|:--------:|:-------:|:-------------:|
| *Registro de usuario*    |    ✔️    |   ✔️    |      ✔️       |
| *Visualizar catálogo*    |    ✔️    |   ✔️    |      ✔️       |
| *Carrito de compras*     |    ✔️    |   ✔️    |      ✔️       |
| *Realizar pedidos*       |    ❌    |   ✔️    |      ✔️       |
| *Panel de control*       |    ❌    |   ❌    |      ✔️       |
| *Estadísticas ventas*    |    ❌    |   ❌    |      ✔️       |


## 4- Contorno operacional

El usuario deberá disponer de un dispositivo con un navegador web y conexión a internet.

## 5- Normativa

El proyecto debe cumplir con varias normativas legales vigentes como:

  

- La LOPDPGDD (Ley Orgánica 3/2018, de 5 de diciembre): marco regulador para la protección de datos personales en España que exige:

- Obtener el consentimiento de los usuarios antes de recopilar y procesar sus datos.

- Informar a los usuarios sobre quién es el responsable del tratamiento de sus datos y con qué fines se van a utilizar.

- Derecho de los usuarios de acceso, rectificación, cancelación y oposición sobre sus datos.

- Detallar cómo se recogerán, usarán y protegerán los datos personales de los usuarios.

- Posibilidad de aceptar o rechazar el uso de cookies por parte del usuario, así como informarle sobre cuales se utilizarán.

  
  

- Reglamento General de Protección de Datos (GDPR) que exige:

- Seguir procedimientos específicos para la transferencia de datos fuera del Espacio Económico Europeo (EEE).

- Notificar a las autoridades y a los afectados en un plazo de 72 horas en caso de brecha de seguridad que afecte a los datos personales de los usuarios.

  
  

- Ley de Servicios de la Sociedad de la Información y del Comercio Electrónico (LSSI-CE):

- Los productos vendidos no pueden infringir derechos de autor o emplear el uso de marcas registradas.

- Considerar regulaciones sobre la tributación de las ventas en línea y el manejo de impuestos aplicables.

  
>El responsable del tratamiento de los datos será Manuel Cordo Luengos y los usuarios tendrán la posibilidad de no dar su consentimiento a compartir sus datos a la hora de crear su cuenta, rectificar su decisión en su perfil o eliminar su usuario.

## 6- Melloras futuras

-Añadir funcionalidades como **consultar estadísticas** de fútbol en directo o la creación de **ligas fantasy**.

-**Programa de fidelización** con el que los usuarios pueden conseguir puntos haciendo uso de las distintas secciones de la plataforma que después se podrán canjear por descuentos o premios.

-**Marketplace**: permitir a otras tiendas y usuarios particulares vender sus propias camisetas en la plataforma.

-Desarrollo de una **aplicación móvil**.