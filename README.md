# expense-helm
expense-helm

# You can download & Install the latest Argo CD version by running below commands- 
Reference - https://argo-cd.readthedocs.io/en/stable/cli_installation/
'''
$ curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
$ sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
$ rm argocd-linux-amd64
$ type argocd
'''

## ArgoCD can be accessed by using CLI & UI
1. Cluster should be created.
2. Metrics server should be installed.
3. Argocd should be installed.
4. Terraform should get the argocd passwrod dynamically.
5. Should be programmatically able to sign into argocd
6. ArgoCD jobs should also be created automatically.
7. 