export const setCookie = (name, value, hours) => {
    let expires = "";
    if (hours) {
        const date = new Date();
        date.setTime(date.getTime() + (hours * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
};

export const getCookie = (name) => {
    const nameEQ = name + "=";
    const allCookies = document.cookie.split(';');
    for (let i = 0; i < allCookies.length; i++) {
        let cookie = allCookies[i];
        while (cookie.charAt(0) === ' ') cookie = cookie.substring(1, cookie.length);
        if (cookie.indexOf(nameEQ) === 0) return cookie.substring(nameEQ.length, cookie.length);
    }
    return null;
};

export const eraseCookie = (name) => {
    document.cookie = name + '=; Max-Age=-99999999;';
};