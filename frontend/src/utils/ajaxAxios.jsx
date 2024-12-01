import axios from "axios";

export async function ajaxAxios(options) {
  let { url, method, fsuccess, ferror, data } = options;

  const sessionToken = localStorage.getItem('session_token');
  try {
    axios(url, {
      method: method || "GET",
      headers: {
        "Content-type": "application/json; charset=utf-8",
        "Authorization": `Bearer ${sessionToken}`
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
    ferror({
      status: error.response ? error.response.status : 500,
      statusText: error.response ? error.response.statusText : 'error del servidor',
    });
  }
}