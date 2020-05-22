kubectl label nodes docker-desktop diskType- --overwrite=true

kubectl get nodes --show-labels

kubectl label nodes docker-desktop diskType=ssd --overwrite=true

kubectl get nodes --show-labels