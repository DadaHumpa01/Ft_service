#!/bin/bash

#   installazione load balancer

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f srcs/config_kube/metallb.yaml

#   applicazione dell immagini

docker build -t testftps ./srcs/ftps/
docker build -t testnginx ./srcs/nginx/
docker build -t testmysql ./srcs/mysql
docker build -t testphpmyadmin ./srcs/phpmyadmin
docker build -t testwordpress ./srcs/wordpress
docker build -t telegraf ./srcs/telegraf
docker build -t influxdb ./srcs/influxdb
docker build -t grafana ./srcs/grafana

#   applicazione dei deployent e dei servizzi e deployment

kubectl apply -f srcs/config_kube/nginx.yaml
kubectl apply -f srcs/config_kube/mysql.yaml
kubectl apply -f srcs/config_kube/phpmyadmin.yaml
kubectl apply -f srcs/config_kube/wordpress.yaml
kubectl apply -f srcs/config_kube/ftps.yaml
kubectl apply -f srcs/config_kube/telegraf.yaml
kubectl apply -f srcs/config_kube/influxdb.yaml
kubectl apply -f srcs/config_kube/grafana.yaml

#   installazione database wordpress

runna=`kubectl get pod | grep mysql | grep Running`
while [[ $runna == '' ]]
do
    runna=`kubectl get pod | grep mysql | grep Running`
    printf "."
    sleep 4
done

mysqlpod=`kubectl get pods | grep mysql | tr ' ' '\n' | head -n 1`
kubectl exec $mysqlpod -- sh dump.sh

#   kubernetes dashboarh

source ./srcs/dashboard.sh