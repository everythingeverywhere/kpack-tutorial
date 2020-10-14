#!/bin/sh

# create secret to push to registry

kubectl create secret docker-registry tutorial-registry-credentials \
    --docker-username=$DH_USERNAME \
    --docker-password=$DH_PASS \
    --docker-server=$DH_REGISTRY \
    --namespace default

# If you have a secret already made:  `kubectl apply -f secret.yaml`
# kubectl apply -f secret.yaml

# Apply that service account to the cluster

kubectl apply -f service-account.yaml && \

#A store resource is a repository of buildpacks packaged in buildpackages that can be used by kpack to build images. 

kubectl apply -f store.yaml && \

# Apply a cluster stack configuration
kubectl apply -f stack.yaml && \

# Apply an image builder
kubectl apply -f builder.yaml && \

# Apply an image configuration
kubectl apply -f image.yaml
