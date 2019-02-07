# Setup guide

## 1. configure kubectl to use gcloud

[https://cloud.google.com/kubernetes-engine/docs/quickstart](https://cloud.google.com/kubernetes-engine/docs/quickstart)

`gcloud components update`

`gcloud components install kubectl`

`gcloud config set project <project-id>`

`gcloud config set compute/zone <compute-zone>`

`gcloud container clusters get-credentials <cluster-name>`

## 2. deploy the service

The service should be once deployed to each environment. Eg. development, staging and production. Rest is automated.

`kubectl apply -f kube.yaml --namespace=development`

`kubectl apply -f kube.yaml --namespace=staging`

`kubectl apply -f kube.yaml --namespace=production`

## 3. push your repo

You should host your repository in one of the places:

- github
- bitbucket
- gcr

## 4. create cloud build trigger

The build trigger should be setup in the google cloud console.

[https://console.cloud.google.com/cloud-build/triggers/add](https://console.cloud.google.com/cloud-build/triggers/add)

1. select correct project from the console
2. choose your repo provider (bitbucket)
3. choose your repo
4. name your trigger as the name of the service
5. trigger type = `branch`
6. branch = `development|staging|production`
7. build configuration = `cloudbuild.yaml`
8. create trigger!
