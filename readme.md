A quick run through kpack [install](https://github.com/pivotal/kpack/blob/master/docs/install.md    ) and [tutorial](https://github.com/pivotal/kpack/blob/master/docs/tutorial.md)

install kpack
```
sh install-kpack.sh
```

ensure kpack controller and webhook are running

```
kubectl get pods --namespace kpack --watch
```

Once kpack is installed go to ./tutorial-build.sh and change $DH_USERNAME, $DH_PASS, $DH_REGISTRY

install tutorial

```
sh tutorial-build.sh
```

# check the status of the image.

```
kubectl -n default get images
```
 tail the logs for image that is currently building using the logs utility

```
logs -image tutorial-image -namespace default
```

Once the image finishes building you can get the fully resolved built image with kubectl get
```
kubectl -n default get image tutorial-image
```

The latest image is available to be used locally via `docker pull` and in a kubernetes deployment.

kpack rebuilds

We recommend updating the kpack image configuration with a CI/CD tool when new commits are ready to be built.

Note: You can also provide a branch or tag as the spec.git.revision and kpack will poll and rebuild on updates!

We can simulate an update from a CI/CD tool by updating the `spec.git.revision` on the image configured earlier.

If you are using your own application please push an updated commit and use the new commit sha. If you are using Spring Pet Clinic you can update the revision to: `4e1f87407d80cdb4a5a293de89d62034fdcbb847`.

Edit the image configuration with:
```
kubectl -n default edit image tutorial-image
``` 
You should see kpack schedule a new build by running:
```
kubectl -n default get builds
```