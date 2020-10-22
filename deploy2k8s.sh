#!/bin/sh


# Create deployment on Cluster
kubectl create deployment kpack-demo --image=$DH_USERNAME/app          

# Create the service                                 
kubectl expose deployment kpack-demo --type=LoadBalancer --port=8080
                                                
# On minikube, the LoadBalancer type makes the Service accessible using:                                                
minikube service kpack-demo                                         





