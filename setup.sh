#!/bin/sh

#   installazione load balancer

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
Kubectl apply -f srcs/config_kube/metallb.yaml

#   applicazione dell immagini

docker build -t testftps ./srcs/ftps/
docker build -t testnginx ./srcs/nginx/
docker build -t testmysql ./srcs/mysql
docker build -t testphpmyadmin ./srcs/phpmyadmin
docker build -t testwordpress ./srcs/wordpress


#   applicazione dei deployent e dei servizzi e deployment

kubectl apply -f srcs/config_kube/nginx.yaml
kubectl apply -f srcs/config_kube/mysql.yaml
kubectl apply -f srcs/config_kube/phpmyadmin.yaml
kubectl apply -f srcs/config_kube/wordpress.yaml
kubectl apply -f srcs/config_kube/ftps.yaml

#   kubernetes dashboarh

source ./srcs/dashboard.sh