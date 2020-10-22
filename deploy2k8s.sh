#!/bin/sh

kubectl create deployment kpack-demo --image=tortillas/app          
kubectl get deployments                                          
kubectl get pods                                                 
kubectl get events      
kubectl config view                                              
kubectl expose deployment kpack-demo --type=LoadBalancer --port=8080
kubectl get services                                                
minikube service kpack-demo                                         





