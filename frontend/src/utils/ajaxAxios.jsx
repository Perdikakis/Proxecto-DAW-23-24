import axios from "axios";

export async function ajaxAxios(options) {
  let { url, method, fsuccess, ferror, data } = options;

  try {
    axios(url, {
      method: method || "GET",
      headers: {
        "Content-type": "application/json; charset=utf-8",
      },
      data: JSON.stringify(data)
    })
    .then((resp) => fsuccess(resp.data))
    .catch((error) => {
      ferror({
        status: error.response ? error.response.status : 500,
        statusText: error.response ? error.response.statusText : 'error del servidor',
      });
    });
  } catch (error) {
    console.error('Error obteniendo el token CSRF o haciendo la petición:', error);
    ferror({
      status: error.response ? error.response.status : 500,
      statusText: error.response ? error.response.statusText : 'error del servidor',
    });
  }
}