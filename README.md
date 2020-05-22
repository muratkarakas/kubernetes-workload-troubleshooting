# kubernetes-workload-troubleshooting

* Fundemantal commands

* Pod failures

* I can't access to my pod

* Pod with volumes

* Selective pod placement

* Being proactive

## Fundemantal commands

* kubectl get po => check pod status

* kubectl logs => pod logs

* kubectl describe po/deploy/x => show details

* kubectl exec -it "pod-id" sh/bash

* kubectl run -it  busybox --image=yauritux/busybox-curl --rm  --restart=Never -- sh

## Pod failures

* CrashLoopBackOff => your application is trouble

* ImagePullBackOff

* ErrImagePull

* Pod status Ready Status 0/x

* Pending

* Pos restart count > 0
