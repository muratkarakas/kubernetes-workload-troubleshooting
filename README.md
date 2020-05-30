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

Common Scenario

* Pod defines storage requirements with PersistentVolumeClaim

* Claim auto creates or bounds to existing volume

* Pod starts

```java

+-----------+            +-----------+                             +-----------+
|           |   defines  |           |  storageClass               |           |
|    Pod    |----------->|    PVC    |-------------> matches ----> |    PV     |
|           |            |           |  capacity                   |           |
+-----------+            +-----------+                             +-----------+

```

If pvc does not matches/creates volume , pod will stucked  in pending state

---

-> # Selective Pod Placement <-

Kubernetes provides several mechanisms for custom pod placement and scheduling

Some of them are basic, some of them gives more advenced controls

* Node Selector

* Affinity & AntiAffinity

* Taint & Toleration

If pod placement  or scheduling rule does not match , it will stucked  in pending state

---

-> # I can't access to my pod <-

If pod need to be accessed from another pod or external application/user, typical solution is
defining  "Service" and optionaly "Ingress"(Extenal loadbalancer solution,better alternative to NodePort)

```java

+-----------+                +------------+                     +-----------+
|           | network call   |   k8s-dns  |      resolve        |           |
|    Pod    |--------------->|     +      |-------------------> |    Pod    |
|           |                | kube-proxy |    load balance     |           |
+-----------+                +------------+                     +-----------+
                                            +                  +
                        Updates/Triggers     +                +    Selectors
                                              +--------------+
                                                      |
                                                      |
                                                      |
                                                      |
                                                +-----------+
                                                |           |
                                                |  Service  |
                                                |           |
                                                +-----------+

```

---

-> # I can't access to my pod <-

Common issues:

* Wrong service name or servive in another namespace

* Pod selector does not match pod labels

* Pods are not in ready state (Readiness probe!)

* Service definition has in valid target port

---

-> # Being Proactive <-

* Monitor Infrastructure & k8s components

* Define alerts based on metrics

* Always define resource requets and limits(must) for applications

* Use liveness,readiness and startup probes

* Centralized Logs

* Set limits (defaults & namespace wide)

* Dev/Prod parity
