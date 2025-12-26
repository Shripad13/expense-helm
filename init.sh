#Below command to get ArgoCD URL from k8s service
#ARGO_URL=${kubectl get svc -n argocd|grep argocd-server |grep LoadBalancer | awk '{print $4}'}

# Below URL is CNAME record created in Route53 for ArgoCD server LoadBalancer
ARGO_URL="https://argocd.devsecopswithshri.site"

#Terraform should get secrets dynamically in json format (from below command) (-o json - in json format)-
ARGO_PWD=${kubectl get secret argocd-initial-admin-secret -n argocd-initial-admin-secret -o json -n argocd | jq'.data.password' | xargs | base64 -d}

# Login to Argocd in CLI (--insecure-> means it will not validate cert & verification)
argocd login $ARGO_URL --username admin --password $ARGO_PWD  --insecure

# Create a argocd app
echo "Creating Dev  Backend app"
arcgocd app create backend --repo https://github.com/Shripad13/expense-helm.git --path .  --dest-namespace default --dest-server https://kubernetes.default.svc --values dev/backend.yaml

echo "Creating Dev Frontend app"
arcgocd app create frontend --repo https://github.com/Shripad13/expense-helm.git --path .  --dest-namespace default --dest-server https://kubernetes.default.svc --values dev/frontend.yaml