
### 1: Few basic commands
kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
kubectl get deployments
kubectl get pods
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
kubectl get services
kubectl delete service hello-node
kubectl delete deployment hello-node


### Step by step - Hello kubernetes using minikube to emulate a real cluster
https://kubernetes.io/docs/tutorials/hello-minikube/

minikube start
minikube dashboard --url

kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
kubectl get deployments
kubectl get pods
kubectl exec -it <pod name> bash

kubectl get events
kubectl config view
kubectl logs hello-node-5f76cf6ccf-br9b5
kubectl get pods
kubectl logs hello-node-7b87cd5f68-cqbzz
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
kubectl get services
minikube service hello-node
minikube service hello-node
minikube addons list
minikube addons enable metrics-server
kubectl get pod,svc -n kube-system
kubectl delete service hello-node
kubectl delete deployment hello-node
minikube stop
minikube delete


### Step by step - Hello kubernetes using minikube to emulate a real cluster with a service
minikube start
minikube dashboard --url
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
kubectl get deployments

# create a  proxy server to access the application
kubectl proxy
curl http://localhost:8001/version

export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/

kubectl logs "$POD_NAME"
kubectl exec "$POD_NAME" -- env
kubectl exec -ti $POD_NAME -- bash

# create a service for the applications
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
kubectl delete service -l app=kubernetes-bootcamp
# Get the url to access the service, this creates a proxy
minikube service kubernetes-bootcamp --url

# scale your deployments
kubectl scale deployments/kubernetes-bootcamp --replicas=4
kubectl get pods -o wide
kubectl describe deployments/kubernetes-bootcamp
kubectl describe services/kubernetes-bootcamp

# Update your pods
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2
kubectl describe services/kubernetes-bootcamp
kubectl rollout status deployments/kubernetes-bootcamp

# rolling back when an issue is encounteres
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10
kubectl get deployments
kubectl get pods
# Notice that some of the Pods have a status of ImagePullBackOff.
kubectl rollout undo deployments/kubernetes-bootcamp
# The rollout undo command reverts the deployment to the previous known state (v2 of the image). Updates are versioned and you can revert to any previously known state of a Deployment.






