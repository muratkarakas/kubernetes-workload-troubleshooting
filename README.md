%title: Kubernetes Workload Troubleshooting
%author: Murat Karakaş
%date: 05-05-2020

-> # Road Map  <-

* Fundemantal Commands

* Pod Failures

* Pod With Volumes

* Selective Pod Placement

* I can't access to my pod

* Being Proactive

---

-> # Fundemantal Commands <-

* "kubectl get po" => check pod status

* "kubectl logs -f" => pod logs

* "kubectl describe po/deploy/" => show details

* "kubectl exec -it pod-id" sh/bash

* "kubectl run -it  busybox --image=yauritux/busybox-curl --rm  --restart=Never -- sh" => Best friend

* "kubectl get x --show-labels" => selectors

---

-> # Pod failures <-

* Pod Status : CrashLoopBackOff

* Pod Status : ErrImagePull

* Pod Status : ImagePullBackOff

* Pod Ready  0/1

* Pod Restart count > 0

* Pod Status: Pending

---

-> # Pod With Volumes <-

Basic Scenario

+-----------+            +-----------+                             +-----------+
|           |   defines  |           |  storaClass                 |           |
|    Pod    |----------->|    PVC    |-------------> matches ----> |    PV     |
|           |            |           |  capacity                   |           |
+-----------+            +-----------+                             +-----------+

---

-> # Being Proactive <-

* Monitor Infrastructure & k8s components

* Define alerts based on metrics

* Always define resource requets and limits(must) for applications

* Use liveness,readiness and startup probes

* Centralized Logs

* Set limits (defaults & namespace wide)

* Dev/Prod parity
