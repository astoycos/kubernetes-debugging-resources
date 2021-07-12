#!/bin/bash 

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/metallb.yaml

kubectl get pods -n metallb-system --watch

kubectl apply -f metal-lb-config.yaml


