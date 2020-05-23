'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "ed3591954d8e6e90aaf3e90721c438f2",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/icon/dead.png": "58a5196ad95acd2b2882ac44b7f21f54",
"assets/icon/health.png": "1b5d6d21476e2ead571f68460ebb7b2d",
"assets/icon/icon.png": "1390ba63358661343a5393d6de23ef1f",
"assets/icon/logo.png": "ac88fbae491064393bf02d41e3c931c8",
"assets/icon/sick.webp": "ba4945d43c8bee6c4529ec9b1d61f001",
"assets/images/slider/banner.jpg": "b0bb7aaae68cabf07ac2f40c8b2a1484",
"assets/images/slider/banner1.jpg": "40cc14ba13a7c8b2e11dafe492c7ae74",
"assets/images/slider/banner2.jpg": "b91cd1047c09aed9e34487f4aefbf579",
"assets/images/slider/banner3.jpg": "15d50b6c1c7934894ca21d4f8bcdcb6f",
"assets/images/slider/download.png": "7c5831195c5affac2daecd91978a763b",
"assets/images/slider/kqw.png": "a65b3b31c062d13b226c7ce2e9f92f8c",
"assets/images/slider/min.jpg": "d9bf5011d0ea55f1483bde5e6daaa3d4",
"assets/images/slider/re.jpg": "a4d97d907352448bd9c577736c889f66",
"assets/images/slider/un.png": "f30a36e8abae4f73f257ee4a54e8b0c9",
"assets/LICENSE": "85ea743f891f0e2e6f1179f6923c7a37",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "df5869dca24bef0a9cf0a8cddfb7b147",
"/": "df5869dca24bef0a9cf0a8cddfb7b147",
"main.dart.js": "aab1c4287e7c6c3d302598e39676733e",
"manifest.json": "60546ead914d129aaee3d6fa7e634ddc"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
