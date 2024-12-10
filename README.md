# Proxecto fin de ciclo

- [Proxecto fin de ciclo](#proxecto-fin-de-ciclo)
  - [Taboleiro do proyecto](#taboleiro-do-proyecto)
  - [Descrición](#descrición)
  - [Instalación / Posta en marcha](#instalación--posta-en-marcha)
  - [Uso](#uso)
  - [Sobre o autor](#sobre-o-autor)
  - [Licenza](#licenza)
  - [Índice](#índice)
  - [Guía de contribución](#guía-de-contribución)
  - [Links](#links)

## Taboleiro do proyecto

En fase de desarrollo

[kakis.es](https://kakis.es)

## Descrición

La aplicación consiste en una plataforma que ofrece varios servicios relacionados con el fútbol, actualmente la única sección implementada es la tienda de camisetas. El objetivo es el un futuro ofrecer varios servicios extra que complementen a la tienda para satisfacer todas las demandas de los seguidores del deporte rey.

El frontend es una SPA construida en React mientras que el backend es una api construida en Laravel que gestiona tanto usuarios como subida de archivos y registros de la base de datos.

## Instalación / Posta en marcha

Software necesario:

* PHP 8.2
* Node 20.18
* Composer 2.8.1
* MariaDB

Pasos para el despliegue:

1. Descargar codigo del repositorio
2. Navegar hasta la carpeta frontend, ejecutar npm install y crear archivo .env con el siguiente contenido:
   1. VITE_API_URL=direcciondelaapi (http://localhost:8000)
3. Navegar hasta la carpeta api ejecutar composer install
   1. Configurar archivo .env (copiar el env example) con el siguiente contenido:
      APP_ENV=local

      APP_URL=http://lovalhost:8000

      Configurar el apartado de la conexion a la base de datos
4. Ejecutar php artisan key:generate y asegurarse de que la key se agregó correctamente al archivo .env
5. Ejecutar php artisan migrate para ejecutar la carga inicial de la base de datos
6. Usuarios iniciales: Administrador password (no hay usuario normales)

## Uso

> *EXPLICACIÓN*: É este apartado describe brevemente como se usará a aplicación Web do proxecto. Describe o uso da interface web *só o uso** (a modo de sumario) *dos aspectos máis relevantes do seu funcionamento** (máxima brevidade, coma se fose un anuncio reclamo ou comercial).

## Sobre o autor

Soy un Programador Web recién titulado (a punto) cuyo punto fuerte es el backend y la codificación de apis. Actualmente el frameworks que mas controlo es Laravel y utilizo React para crear el front de mis aplicaciones, teniendo esto en cuenta, son las tecnologías que he utilizado para la realización de este proyecto. La idea nace de que soy un apasionado del fútbol siempre me da un poco de "pereza" el tener que utilizar varias aplicaciones distintas para consumir contenido/utilizar servicios relacionados con dicho mundo.

## Índice

1. [Anteproyecto](doc/templates/1_Anteproxecto.md)
2. [Análise](doc/templates/2_Analise.md)
3. [Deseño](doc/templates/3_Deseño.md)
4. [Codificación e probas](doc/templates/4_Codificacion_e_probas.md)
5. [Implantación](doc/templates/5_Implantación.md)
6. [Referencias](doc/templates/6_Referencias.md)
7. [Incidencias](doc/templates/7_Incidencias.md)

## Guía de contribución

Consultar en Implantación, la última sección (Melloras futuras)

## Links

> EXPLICACIÓN*: Ligazóns externas e descipciones destas ligazóns que creas conveniente indicar aquí. Xeralmente xa van estar integrados coa túa documentación, pero se requires realizar unha listaxe deles, leste é o lugar.
