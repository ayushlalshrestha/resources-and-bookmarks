
Start a node
minikube start

Stopping a node
minikube stop

See all the nodes
kubectl get nodes --help

kubectl get - list resources
kubectl describe - show detailed information about a resource
kubectl describe node minikube
kubectl describe pod hello-minikube
kubectl logs - print the logs from a container in a pod
kubectl exec - execute a command on a container in a pod

Creating a deployment - this auto-detects a node and runs the application on it:
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1

Proxy to access from localhost:
kubectl proxy
http://localhost:8001/api/v1/namespaces/default/pods/
http://localhost:8001/api/v1/nodes/

List your deployments
kubectl get deployments

