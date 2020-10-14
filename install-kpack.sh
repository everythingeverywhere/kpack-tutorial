#!/bin/sh

# Create KinD cluster
minikube create cluster

# Most recent kpack release
kubectl apply -f release-0.1.2.yaml

# Ensure that the kpack controller & webhook have a status of Running
kubectl get pods --namespace kpack 