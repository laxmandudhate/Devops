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


---


# 📦 Kubernetes: Relationship between Pods, ReplicaSets, Deployments, and Namespaces

## 🔹 1. Pods
- The **smallest unit** in Kubernetes.
- Encapsulates **one or more containers** with shared storage, network, and specs.
- Pods are **ephemeral**—not recreated automatically unless managed by a controller like a ReplicaSet or Deployment.

## 🔹 2. ReplicaSets
- Maintains a **specified number of identical pod replicas**.
- Ensures pods are replaced if they fail or are deleted.
- Uses **labels and selectors** to manage groups of pods.

## 🔹 3. Deployments
- A higher-level abstraction over ReplicaSets.
- Manages:
  - **Rolling updates**
  - **Rollbacks**
  - **Scaling**
- Automatically creates and manages ReplicaSets.
- Workflow:
  ```
  Deployment → ReplicaSet → Pods
  ```

## 🔹 4. Namespaces
- **Logical partitions** within a Kubernetes cluster.
- Used for:
  - Isolating environments (e.g., dev, test, prod)
  - Applying **RBAC**, **resource quotas**, and **network policies**
- All other resources (Deployments, ReplicaSets, Pods) reside within a namespace.

## 🔁 Relationship Diagram

```
Namespace
 └── Deployment
      └── ReplicaSet (managed by Deployment)
           └── Pod(s) (managed by ReplicaSet)
```

## 🧠 Summary Table

| Resource      | Purpose                                | Related To                        |
|---------------|----------------------------------------|------------------------------------|
| **Pod**       | Runs containers                        | Managed by ReplicaSet              |
| **ReplicaSet**| Maintains number of pods               | Managed by Deployment              |
| **Deployment**| Handles updates/rollbacks              | Manages ReplicaSet                 |
| **Namespace** | Logical isolation of resources         | Contains Deployments, Pods, etc.   |


---


# 🧩 Kubernetes: When to Use a DaemonSet

A **DaemonSet** ensures that a **specific pod runs on all (or selected) nodes** in a Kubernetes cluster. It is mainly used for running background system-level services.

---

## ✅ Use Cases for DaemonSet

| Use Case                         | Description |
|----------------------------------|-------------|
| 🛡️ **Monitoring agents**         | Tools like **Prometheus Node Exporter**, **Datadog Agent**, or **Telegraf** to collect metrics from each node. |
| 📄 **Log collection agents**     | Agents like **Fluentd**, **Filebeat**, or **Logstash** to ship node/pod logs to centralized storage (e.g., ELK, Splunk). |
| 🔒 **Security agents**           | Antivirus, intrusion detection tools, or file integrity checkers (e.g., Falco, OSSEC) deployed on all nodes. |
| 🚀 **Custom node setup/config**  | Running scripts, network configurations, or custom agents during node bootstrap. |
| 🌐 **Networking components**     | CNI plugins (e.g., Calico, Cilium) or kube-proxy when deployed as a pod. |
| ☁️ **Cloud provider integration**| Tools that interact with cloud APIs for volume mounting, node tagging, etc. |

---

## 🔧 Example Scenario

> You want to collect logs from all nodes using **Fluentd** and ship them to **Splunk**.  
> ✅ You would use a **DaemonSet** to ensure a Fluentd pod runs on **every node** and accesses `/var/log`.

---

## 🧠 Key Characteristics

- Ensures **one pod per node** (or selected nodes).
- Automatically adds pods on **new nodes**.
- Cleans up pods when nodes are **removed**.
- Can be limited using **node selectors** or **taints/tolerations**.

---


# 🛠️ Kubernetes: How to Debug a Failing Pod

Debugging a failing pod in Kubernetes involves using built-in tools to inspect logs, events, resource status, and configuration.

---

## ✅ 1. Check Pod Status
```bash
kubectl get pods
```
- Look for statuses like `CrashLoopBackOff`, `Pending`, `Error`, `OOMKilled`.

---

## ✅ 2. Describe the Pod
```bash
kubectl describe pod <pod-name>
```
- Shows detailed information:
  - Events
  - Node assignment
  - Scheduling issues
  - Container restarts

---

## ✅ 3. Check Logs
```bash
kubectl logs <pod-name>
```
- For multi-container pods:
```bash
kubectl logs <pod-name> -c <container-name>
```
- For previously crashed container logs:
```bash
kubectl logs --previous <pod-name>
```

---

## ✅ 4. Exec Into the Pod (If Running)
```bash
kubectl exec -it <pod-name> -- /bin/sh
```
- Inspect environment variables, config files, logs inside the container.

---

## ✅ 5. Check Events in the Namespace
```bash
kubectl get events --sort-by=.metadata.creationTimestamp
```
- Helps spot image pull errors, scheduling issues, etc.

---

## ✅ 6. Check Resource Limits
- Check if the pod is being OOMKilled or has insufficient CPU.
```bash
kubectl describe pod <pod-name>
```

---

## ✅ 7. Inspect Liveness & Readiness Probes
- Misconfigured probes can cause restarts or prevent traffic routing.

---

## ✅ 8. Check Node Issues
```bash
kubectl describe node <node-name>
kubectl get pods -o wide  # To find which node a pod is running on
```

---

## ✅ 9. Validate Image and Pull Policy
- Incorrect image names or `imagePullPolicy: Always` can cause pull errors.
```bash
kubectl describe pod <pod-name>
```

---

## ✅ 10. Use Ephemeral Debug Container (K8s v1.18+)
```bash
kubectl debug pod/<pod-name> -c <container-name> --image=busybox --target=<container-name> -- /bin/sh
```
- Helpful when the main container won’t start.

---

## 🧠 Tips
- Use `kubectl get pod <pod-name> -o yaml` to review full configuration.
- Double-check **ConfigMaps**, **Secrets**, and **Volumes** if they're mounted correctly.

---

# 🔍 Kubernetes Probes: Liveness, Readiness, and Startup

Kubernetes uses three types of probes to manage container lifecycle and health.

---

## ✅ 1. Liveness Probe

- **Purpose:** Checks if the container is still running (not stuck or crashed).
- **Action on failure:** Kubernetes restarts the container.
- **Typical use case:** Detect deadlocks, memory leaks, or hung processes.

```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 5
```

---

## 📶 2. Readiness Probe

- **Purpose:** Checks if the container is ready to accept traffic.
- **Action on failure:** Pod is removed from the Service's endpoint list.
- **Typical use case:** Wait until app is fully initialized (e.g., DB connection ready).

```yaml
readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 5
```

---

## ⏳ 3. Startup Probe

- **Purpose:** Checks if the container has started successfully.
- **Note:** Disables liveness and readiness until it passes.
- **Typical use case:** For slow-starting apps (e.g., Spring Boot, Java).

```yaml
startupProbe:
  httpGet:
    path: /startup
    port: 8080
  failureThreshold: 30
  periodSeconds: 10
```

---

## 🧠 Summary Table

| Probe Type     | Purpose                               | Failure Action                        | Use Case Example                       |
|----------------|----------------------------------------|----------------------------------------|----------------------------------------|
| Liveness        | Is the container alive?                | Restart the container                 | Unresponsive/stuck app                 |
| Readiness       | Is the container ready for traffic?    | Remove from service endpoints         | App initializing DB                    |
| Startup         | Has the container started properly?    | Restart the container                 | Slow-starting apps (Java/Spring Boot)  |


---


  
