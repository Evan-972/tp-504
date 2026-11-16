#!/bin/bash

# (a) réseau interne
docker network create tplb

# (b) construction de l'image du load-balancer
docker build -t im-nginx-lb ./tp-A

# (c) dossiers partagés (-p évite l'erreur s'ils existent déjà)
mkdir -p shared1 shared2

# (d) pages d'accueil
echo '<h1>Hello 1</h1>' > shared1/index.html
echo '<h1>Hello 2</h1>' > shared2/index.html

# (e) les deux serveurs finaux
docker run -d --rm --name nginx1 --network tplb -p 81:80 \
  -v "$(pwd)/shared1":/usr/share/nginx/html nginx
docker run -d --rm --name nginx2 --network tplb -p 82:80 \
  -v "$(pwd)/shared2":/usr/share/nginx/html nginx

# (f) le load-balancer
docker run -d --rm --name nginx-lb --network tplb -p 83:80 im-nginx-lb
