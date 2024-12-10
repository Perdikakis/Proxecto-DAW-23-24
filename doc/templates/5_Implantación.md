# FASE DE IMPLANTACIÓN

- [FASE DE IMPLANTACIÓN](#fase-de-implantación)
  - [1- Manual técnico](#1--manual-técnico)
    - [1.1- Instalación](#11--instalación)
    - [1.2- Administración do sistema](#12--administración-do-sistema)
  - [2- Manual de usuario](#2--manual-de-usuario)
  - [3- Melloras futuras](#3--melloras-futuras)

## 1- Manual técnico

### 1.1- Instalación

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

### 1.2- Administración do sistema

> *EXPLICACIÓN:* Neste apartado indicarase información relativa á administración do sistema, é dicir, tarefas que se deberán realizar unha vez que o sistema estea funcionando.
>
> Como:
>
> - Copias de seguridade do sistema.
> - Copias de seguridade da base de datos.
> - Xestión de usuarios.
> - Xestión seguridade.
> - Xestión de incidencias, que poden ser de dous tipos: de sistema (accesos non autorizados á BD, etc) ou de fallos no software.
>
> No caso de que sexan precisas.

## 2- Manual de usuario

> *EXPLICACIÓN:* Neste apartado fara
>
> - Indicar se será necesario formar ós usuarios. En caso afirmativo planificar.
> - Manual de usuario, FAQ ou outro xeito que sexa o máis adecuado para que os usuarios saiban usar a nosa aplicación informática.
>
> Todo esto se a aplicación require de manual de usuario.

## 3- Melloras futuras

Implementar OAuth

Ampliar las opciones del panel de administrador

Configurar correctamente la pantalla de carga mientras se realizan peticiones

Modificar el manejo del token de sesion para emplear tambien cookies con el, no solo con datos de las ventas

Añadir una funcionalidad para agregar camisetas a favoritos y notificar al usuario cuando ocurre algo (restock, oferta, etc)

Implementar método de pago

Obtener las imagenes de los sliders, destacadas etc de la base de datos

Almacenar imágenes en otro lugar que no sea el public de la api (usar servidor externo o el metodo Storage de laravel)

> *EXPLICACIÓN:* Neste apartado incluiranse as posibilidades de mellora da aplicación no futuro.
