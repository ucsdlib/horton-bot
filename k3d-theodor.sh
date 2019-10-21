#!/usr/bin/env sh

if test $# -ne 1 ; then
  echo "You must provide the Slack API token for the bot to connect to"
  exit 1
fi
api_token=$1

echo "cluster: creating theodor k3s cluster"
k3d create -n theodor --workers 1 --wait 0
echo "k3s: setting up kubeconfig"
export KUBECONFIG="$(k3d get-kubeconfig --name='theodor')"

echo "tiller: creating service account"
kubectl -n kube-system create serviceaccount tiller
echo "tiller: setting up rbac for service account"
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

echo "helm: initializing with tiller service account"
helm init --service-account tiller --wait

echo "helm: installing Theodor"
helm install --name theodor ./theodor --set=apiToken="$api_token"


