# debug-container

The `debug-container` is a container image used for debugging Pods within a Kubernetes cluster.

## Examples of Using kubectl debug

Below are different examples of using the `kubectl debug` command, along with their descriptions.

### Basic Debugging

This is the most basic debugging operation, which adds a debug container to the original Pod without sharing the process
namespace.

```bash
kubectl debug {{TARGET_POD}} -it --image=ogontaro/debug-container -- /bin/bash
```

### Adding a Debug Container to the Original Pod

This method directly adds a debug container to the original Pod and shares the process namespace. It allows direct
access to the processes and resources of the original Pod.

```bash
kubectl debug {{TARGET_POD}} -it --image=ogontaro/debug-container --share-processes -- /bin/bash
```

### Creating a Clone of the Pod for Debugging

This command clones the original Pod and creates a new Pod (debug-container) for debugging. It enables debugging without
affecting the operation of the original Pod.

```bash
kubectl debug {{TARGET_POD}} -it --image=ogontaro/debug-container --share-processes --copy-to=debug-container -- /bin/bash; echo "Remember to delete the debug pod: kubectl delete pod debug-container"
```
