# 🚀 Site Reliability Engineer (SRE) – Kubernetes Most Asked Interview Questions

This document contains the most commonly asked Kubernetes questions for Site Reliability Engineer (SRE) roles, especially for professionals with 2–5 years of experience.

---

## 1. What happens when you run `kubectl apply -f pod.yaml`?

- It sends the manifest to the Kubernetes API Server.
- The API server validates and stores it in etcd.
- The scheduler assigns the pod to a suitable node.
- The kubelet on that node pulls the container image.
- The container is created and started.
- Kubelet monitors the container's health.

---

## 2. What is a `CrashLoopBackOff`?

- A pod crashes repeatedly after being started.
- Kubernetes retries but backs off (waits longer each time).
- Common causes:
  - Bad entrypoint/command
  - Missing files or config
  - Resource constraints
  - Application bug

### 🔧 Debug:
```bash
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

---

## 3. What is the difference between `Deployment`, `ReplicaSet`, and `StatefulSet`?

| Controller   | Purpose                          |
|--------------|----------------------------------|
| Deployment   | Manages stateless applications   |
| ReplicaSet   | Ensures a specific number of pod replicas |
| StatefulSet  | Manages stateful apps with stable identities and storage |

---

## 4. How do you handle rolling updates in Kubernetes?

- Use `Deployment` with a rolling update strategy:
```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 1
```

- Rollback if needed:
```bash
kubectl rollout undo deployment <deployment-name>
```

---

## 5. What is a `DaemonSet`?

- Ensures a pod runs on **every node** (or a subset).
- Common use cases:
  - Monitoring agents (e.g., Fluentd)
  - Log collection
  - Security daemons

---

## 6. What is `ImagePullBackOff` and how to fix it?

A pod cannot pull the image. Kubernetes is retrying with a backoff delay.

### 💡 Causes:
- Typo in image name or tag
- Image not present in registry
- Missing `imagePullSecrets` for private registries
- DockerHub pull limit exceeded

### 🔍 Check:
```bash
kubectl describe pod <pod-name>
```

---

## 7. How do you monitor Kubernetes clusters?

- **Tools**: Prometheus, Grafana, Alertmanager, ELK, Fluentd, Loki, Datadog
- **Metrics**: Use exporters like kube-state-metrics, node-exporter
- **Logging**: EFK stack or centralized logging systems
- **Probes**: Liveness & readiness for pod health

---

## 8. What are `readiness` and `liveness` probes?

| Probe       | Purpose                          |
|-------------|----------------------------------|
| Liveness    | Checks if the app is alive (restart if fails) |
| Readiness   | Checks if the app is ready to serve traffic  |

### Example:
```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 10
```

---

## 9. How do you scale a Kubernetes deployment?

### Manual Scaling:
```bash
kubectl scale deployment <name> --replicas=5
```

### Auto-scaling with HPA:
```bash
kubectl autoscale deployment <name> --cpu-percent=80 --min=2 --max=10
```

---

## 10. How do you debug a pod that’s not starting?

- Check pod status:
```bash
kubectl describe pod <name>
```

- View logs:
```bash
kubectl logs <name>
```

- View cluster events:
```bash
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

## ✅ Pro Tip

Always check:
- Events section in `kubectl describe`
- Image names
- Environment variables
- Secrets/ConfigMaps
- Node status & resources

---


# Advanced Kubernetes Interview Questions for SREs (Part 2)

### ✅ 11. What is a Namespace in Kubernetes?
Namespaces are used to **logically isolate resources** within the same cluster.

- Good for multi-team environments.
- Example: dev, test, prod

```bash
kubectl get ns
kubectl get pods -n kube-system
```

---

### ✅ 12. How does Kubernetes service discovery work?
- **ClusterIP Service** gets a virtual IP inside the cluster.
- Internal DNS (via CoreDNS) resolves service names.
- Pods can access other services using:
  ```
  http://<service-name>.<namespace>.svc.cluster.local
  ```

---

### ✅ 13. What is a ConfigMap and a Secret?
- **ConfigMap**: Stores non-sensitive config like environment variables, CLI args.
- **Secret**: Stores sensitive data like passwords, tokens, certs.

```bash
kubectl create configmap my-config --from-literal=ENV=prod
kubectl create secret generic my-secret --from-literal=API_KEY=123
```

---

### ✅ 14. What is `initContainer` and why is it used?
`initContainers` are special containers that run **before the main containers** in a pod.

- Used for setup tasks (e.g., wait for DB, load config).
- If an init container fails, the pod won’t start.

---

### ✅ 15. How does Kubernetes handle persistent storage?
- Uses **PersistentVolume (PV)** and **PersistentVolumeClaim (PVC)**.
- Storage can come from GCP Persistent Disk, AWS EBS, NFS, etc.

```yaml
volumeMounts:
  - mountPath: "/data"
    name: my-pvc
```

---

### ✅ 16. What are taints and tolerations?
- **Taints** repel pods from nodes.
- **Tolerations** allow pods to run on tainted nodes.
Useful for **dedicated nodes** like GPU or infra workloads.

```bash
kubectl taint nodes node1 key=value:NoSchedule
```

---

### ✅ 17. What is node affinity and pod affinity?
Used to **influence pod scheduling** based on labels.

- **Node Affinity**: Schedule pods to specific nodes.
- **Pod Affinity**: Co-locate pods on same or different nodes.

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: zone
              operator: In
              values:
                - us-central1-a
```

---

### ✅ 18. How do you upgrade a Kubernetes cluster safely?
- Upgrade components one by one: Control Plane → Nodes.
- Backup etcd.
- Use `kubeadm` or managed service tools (GKE, EKS).
- Monitor workloads and rollback if needed.

---

### ✅ 19. How do you ensure high availability in Kubernetes?
- Use multiple replicas (via Deployments).
- Use HPA for auto-scaling.
- Use multiple master/control plane nodes.
- Load balance services (via Service + Ingress).

---

### ✅ 20. What are some production-readiness checks before deploying to Kubernetes?
- Liveness and readiness probes configured
- Resource limits and requests defined
- Logging and monitoring enabled
- Config and secrets externalized
- Proper namespace isolation and RBAC policies


# SRE Kubernetes Interview Questions – Expert Level (Part 3)

## 1. What is the difference between a DaemonSet and a Deployment?

**Answer:**  
- **DaemonSet** ensures that a copy of a pod runs on all (or some) nodes. Commonly used for logging/monitoring agents.
- **Deployment** manages stateless applications and ensures a desired number of replicas are running.

---

## 2. How do you perform a rolling update in Kubernetes?

**Answer:**  
Using the `kubectl rollout` command or by updating the image/tag in a Deployment YAML. Kubernetes will gradually replace old pods with new ones to avoid downtime.

---

## 3. What are readiness and liveness probes?

**Answer:**  
- **Liveness probe** checks if a container is alive. If it fails, the container is restarted.
- **Readiness probe** checks if the container is ready to serve traffic. If it fails, it’s removed from the service endpoints.

---

## 4. How do you handle config and secrets in Kubernetes?

**Answer:**  
- **ConfigMaps** are used for non-sensitive configuration data.
- **Secrets** are used for storing sensitive data (like passwords, keys) and are base64 encoded.

---

## 5. How would you debug a CrashLoopBackOff error?

**Answer:**  
- Check logs: `kubectl logs <pod-name> --previous`
- Describe the pod: `kubectl describe pod <pod-name>`
- Look for issues in init containers, command syntax, or readiness probes.

---

## 6. What is a Kubernetes Service Mesh?

**Answer:**  
A service mesh (e.g., Istio, Linkerd) provides observability, traffic control, and security between services without changing application code.

---

## 7. What are taints and tolerations?

**Answer:**  
- **Taints** prevent pods from being scheduled on nodes.
- **Tolerations** allow (tolerate) pods to be scheduled on tainted nodes.

---

## 8. How can you autoscale pods in Kubernetes?

**Answer:**  
Using the **Horizontal Pod Autoscaler (HPA)**, which adjusts pod count based on CPU/memory utilization or custom metrics.

---

## 9. How do you upgrade a Kubernetes cluster?

**Answer:**  
- Back up etcd.
- Drain nodes.
- Upgrade control plane using `kubeadm`.
- Upgrade kubelet and kubectl on nodes.
- Uncordon nodes and verify cluster status.

---

## 10. How do you secure access to the Kubernetes API?

**Answer:**  
- Use RBAC (Role-Based Access Control)
- Enable audit logging
- Use TLS certificates for authentication
- Restrict access using API server flags (`--authorization-mode`)
