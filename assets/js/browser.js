function addUrlParams(params) {
  const combinedParams = Object.assign(getUrlParams(), params);
  const serializedParams = Object.entries(combinedParams)
    .map(([name, value]) => `${name}=${encodeURIComponent(value)}`)
    .join('&');
  history.pushState(null, '', `${location.pathname}?${serializedParams}`);
}


function getUrlParams() {
  const serializedParams = location.search.split('?')[1];
  const nvpairs = serializedParams ? serializedParams.split('&') : [];
  return nvpairs.reduce((params, nvpair) => {
    const [name, value] = nvpair.split('=');
    params[name] = decodeURIComponent(value);
    return params;
  }, {});
}


const isMobile = (() => {
  if (typeof navigator === 'undefined' || typeof navigator.userAgent !== 'string') {
    return false;
  }
  return /Mobile/.test(navigator.userAgent);
})();

export {
  addUrlParams,
  getUrlParams,
  isMobile
};
