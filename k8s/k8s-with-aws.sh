# https://youtu.be/O4h69KMm2tE
# https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html
# https://github.dev/nigelpoulton/k8s-sample-apps/blob/master/mysql-wordpress-pd/mysql-deployment.yaml

aws configure 

# Make sure to create a cluster in aws eks (with proper iam roles)

aws eks update-kubeconfig --region region-code --name my-cluster
aws eks update-kubeconfig --region us-east-1 --name test-cluster

# Create a node group in the eks cluster (with proper iam roles)
# This will create ec2 instances where your k8s nodes will run

kubectl get nodes

# Deploy a pod
kubectl create -f https://raw.githubusercontent.com/javahometech/kubernetes/master/pods/pods.yml

kubectl get pods