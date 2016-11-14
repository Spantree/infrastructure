# Kubernetes Infrastructure

## Instructions for setting up a kubernetes cluster

### 1. Executing `./kops-create` it will print out some text that can be copy pasted and executed in the shell

```
to provision the kubernetes cluster run the following:
install the aws cli and configure a profile named lublife (see: http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles)


export AWS_PROFILE=spantree
export KOPS_STATE_STORE=s3://spantree-kubernetes
export AWS_REGION=us-east-1
kops create cluster --cloud aws --master-size t2.medium --node-count 1 --node-size t2.large --ssh-public-key ~/.ssh/devops.pub --zones us-east-1e --name k8s.spantree.net --vpc vpc-ae19a8cb --network-cidr 10.1.0.0/16
kops update cluster k8s.spantree.net --yes

provision the kubernetes dashboard with 'kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.4.0.yaml'
```

### 2. Create docker secrets

Execute

```
./create-docker-login-secret.sh

kubectl create -f docker-login-secret.yaml
```

### 3. Configure the dynamic storage provisioner

Execute

```
kubectl create -f dyn-storage.yml
```

### 4. Configure the common configmap

Execute

```
kubectl create -f postgres-configmap.yml
```

