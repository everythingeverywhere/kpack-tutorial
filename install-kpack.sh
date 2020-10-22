#!/bin/sh

# Create a minikube cluster
minikube start

# Most recent kpack release
kubectl apply -f release-0.1.2.yaml

# Ensure that the kpack controller & webhook have a status of Running
kubectl get pods --namespace kpack 