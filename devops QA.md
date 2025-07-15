# DevOps Top 30 Interview Questions & Answers by Tool (Detailed)

---

## SRE (Site Reliability Engineering)

### 1. What is SRE and how is it different from DevOps?
**Answer:**  
Site Reliability Engineering (SRE) is a discipline that applies software engineering principles to IT operations, with the goal of building scalable and highly reliable systems. SRE originated at Google and focuses on automating operations tasks (like deployment, monitoring, and incident response).  
**Difference from DevOps:**  
- **DevOps** is a set of practices emphasizing collaboration between development and operations to improve software delivery.
- **SRE** formalizes reliability goals (like availability and latency), manages "error budgets" (allowable downtime), and uses engineering to automate ops.
- SRE can be considered an implementation of DevOps with a heavy focus on reliability, automation, and measurable SLIs/SLOs/SLAs.

### 2. What are SLIs, SLOs, and SLAs?
**Answer:**  
- **SLI (Service Level Indicator):** Quantitative measure of service performance (e.g., latency, error rate).
    - Example: "99.9% of requests respond within 200ms."
- **SLO (Service Level Objective):** The target value for an SLI (e.g., "99.9% availability").
- **SLA (Service Level Agreement):** A formal agreement with external parties (e.g., customers) specifying penalties if SLOs aren’t met.

### 3. How do you define Error Budgets?
**Answer:**  
Error budgets represent the acceptable level of unreliability for a service within a given period (e.g., 99.9% uptime allows for ~43 minutes of downtime per month). If the error budget is exceeded, new releases may be paused to improve reliability. It balances innovation (shipping features) and stability.

### 4. Explain the concept of Toil and how SRE addresses it.
**Answer:**  
**Toil** is repetitive, manual work that is automatable and scalable but doesn’t add long-term value. Examples: manual server restarts, log rotation, or user provisioning.  
**SRE Approach:**  
- Identify sources of toil.
- Prioritize automation (scripts, CI/CD, self-healing).
- Measure toil and aim to keep it below 50% of operational work.

### 5. What tools are commonly used for monitoring in SRE?
**Answer:**  
- **Prometheus:** Open-source monitoring and alerting toolkit.
- **Grafana:** Visualization and dashboarding.
- **Nagios/Zabbix:** Legacy monitoring tools.
- **Datadog/New Relic:** Commercial APM solutions.
- **Stackdriver (Google Cloud Monitoring):** For GCP environments.

### 6. How is incident management handled in SRE?
**Answer:**  
Incident management in SRE includes:
- **Detection:** Monitoring systems trigger alerts.
- **Response:** On-call engineers respond using runbooks.
- **Mitigation:** Actions are taken to reduce impact (rollbacks, scaling).
- **Resolution:** Issue is fixed.
- **Postmortem:** Blameless review to learn and prevent recurrence.

### 7. What is a blameless postmortem and why is it important?
**Answer:**  
A blameless postmortem is a review of an incident focusing on systemic causes, not individual blame.  
**Importance:**  
- Encourages honest analysis.
- Fosters a learning culture.
- Prevents finger-pointing, leading to process and system improvements.

### 8. How do you implement monitoring and alerting in SRE?
**Answer:**  
- **Monitoring:** Define metrics (SLIs) for system health (CPU, latency, errors).
- **Alerting:** Set thresholds for SLO breaches. Use alerting tools (PagerDuty, Opsgenie) to notify on-call staff.
- **Best Practice:** Alerts must be actionable, avoiding alert fatigue.

### 9. What is capacity planning and how is it done?
**Answer:**  
Capacity planning anticipates resource needs (CPU, memory, storage) based on current usage and projected growth.  
**Steps:**  
- Analyze historical usage data.
- Forecast future needs.
- Test system with load testing tools.
- Adjust infrastructure or scale-out strategies.

### 10. How do you perform root cause analysis?
**Answer:**  
- Gather logs, metrics, and traces around the incident.
- Reconstruct the timeline.
- Identify the sequence of events and triggers.
- Find the underlying technical or process cause.
- Document findings and corrective actions in a postmortem.

### 11. Explain canary deployments and their benefits.
**Answer:**  
Canary deployments release a new version of software to a small subset of users before rolling out to everyone.  
**Benefits:**  
- Limits exposure to potential issues.
- Allows monitoring of real user impact.
- Enables fast rollback if issues occur.

### 12. What is chaos engineering?
**Answer:**  
Chaos engineering is the proactive practice of testing system resilience by intentionally injecting failures (like killing processes or simulating network outages).  
**Goal:**  
- Discover weaknesses before they cause outages.
- Build confidence in the system’s ability to recover.

### 13. How are playbooks and runbooks used in SRE?
**Answer:**  
- **Runbooks:** Step-by-step guides for routine operations and incident response.
- **Playbooks:** Higher-level strategies for handling complex scenarios (e.g., database failover).
They standardize responses and reduce resolution time.

### 14. What is a “latency SLI” example?
**Answer:**  
Example: "95% of HTTP requests complete in under 200ms."  
This SLI measures the responsiveness of a service.

### 15. How do you balance reliability and feature velocity?
**Answer:**  
Use error budgets:  
- If the service is within the error budget, allow rapid releases.
- If the error budget is exhausted, slow releases and focus on reliability.

### 16. What is blue/green deployment?
**Answer:**  
Blue/green deployment maintains two environments:  
- **Blue:** Current/production.
- **Green:** New version.
Traffic is switched to green once it passes validation. Allows instant rollback.

### 17. How does SRE handle on-call rotations?
**Answer:**  
- Define rotation schedules, distribute load fairly.
- Use alerting tools.
- Monitor alert volume and optimize to prevent burnout.

### 18. What is service degradation versus outage?
**Answer:**  
- **Degradation:** Service is slow or partially functional.
- **Outage:** Service is completely unavailable.

### 19. What is auto-remediation?
**Answer:**  
Automated scripts or workflows that detect and fix incidents without human intervention (e.g., automatically restarting a failed service).

### 20. How do you measure system availability?
**Answer:**  
Availability = (Uptime / (Uptime + Downtime)) × 100  
For example, if a service is up for 99 hours out of 100, availability is 99%.

### 21. What is incident response lifecycle?
**Answer:**  
Detection → Triage → Mitigation → Resolution → Postmortem  
Each step ensures incidents are handled efficiently and lessons are learned.

### 22. How do you handle alert fatigue?
**Answer:**  
- Tune alert thresholds to reduce noise.
- Only alert on actionable issues.
- Regularly review and refine alerts.

### 23. How do you manage configuration drift?
**Answer:**  
- Use configuration management tools (Ansible, Puppet).
- Enforce infrastructure as code.
- Perform periodic audits and automated checks.

### 24. What is the “four golden signals” in monitoring?
**Answer:**  
1. **Latency:** Response time.
2. **Traffic:** Request volume.
3. **Errors:** Failed requests.
4. **Saturation:** Resource utilization (CPU, memory).

### 25. What is black-box vs white-box monitoring?
**Answer:**  
- **Black-box:** Monitors system from the outside (e.g., HTTP checks).
- **White-box:** Monitors internal system metrics (CPU, memory, custom app metrics).

### 26. What is load balancing?
**Answer:**  
Distributes incoming traffic across multiple servers to ensure reliability, reduce latency, and prevent overload.

### 27. What is a runbook automation example?
**Answer:**  
An automated script that detects a crashed service and restarts it, then notifies the on-call engineer.

### 28. How do you design for high availability?
**Answer:**  
- Redundant servers and failover mechanisms.
- Data replication across zones/regions.
- Eliminate single points of failure.

### 29. What is MTTR and MTBF?
**Answer:**  
- **MTTR (Mean Time to Repair/Recover):** Average time to restore service after failure.
- **MTBF (Mean Time Between Failures):** Average time between incidents.

### 30. How do you ensure security in SRE practices?
**Answer:**  
- Regular vulnerability scanning.
- Least privilege access.
- Secure configuration management.
- Automated patching and incident response plans.

---

## Kubernetes

### 1. What is Kubernetes?
**Answer:**  
Kubernetes (K8s) is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. It manages clusters of nodes, schedules containers, handles service discovery, and provides self-healing and horizontal scaling.

### 2. What are Pods in Kubernetes?
**Answer:**  
A Pod is the smallest deployable unit in Kubernetes. It can contain one or more containers, which share storage, network, and a specification for how to run the containers.

### 3. What is a Deployment?
**Answer:**  
A Deployment manages a ReplicaSet and provides declarative updates for Pods and ReplicaSets. It ensures the desired number of Pods are running and allows rolling updates and rollbacks.

### 4. How does a Service work in Kubernetes?
**Answer:**  
A Service exposes a set of Pods as a network service. It provides a stable IP/hostname and can load-balance requests to Pods, even as individual Pods are created or destroyed.

### 5. What is a Namespace?
**Answer:**  
Namespaces provide a way to divide cluster resources between multiple users via resource scoping, allowing for environment separation (like dev, staging, prod).

### 6. How does rolling update work?
**Answer:**  
Kubernetes gradually replaces old Pods with new ones using Deployments. It ensures no downtime and maintains desired capacity during updates.

### 7. What is a StatefulSet?
**Answer:**  
StatefulSet manages the deployment and scaling of stateful applications, such as databases. It provides stable, unique network identities and persistent storage for each Pod.

### 8. How do you perform a blue-green deployment?
**Answer:**  
Deploy two versions (blue and green) as separate Deployments. Switch traffic using a Service or Ingress to the new version once validated.

### 9. How does Kubernetes handle scaling?
**Answer:**  
Kubernetes uses the Horizontal Pod Autoscaler to increase/decrease the number of Pods based on CPU, memory, or custom metrics.

### 10. What is a ConfigMap?
**Answer:**  
A ConfigMap stores non-confidential configuration data as key-value pairs, which can be mounted as environment variables or files in Pods.

### 11. How are Secrets managed?
**Answer:**  
Secrets store sensitive data (like passwords, API keys) in a base64-encoded format, accessible to Pods in a secure manner.

### 12. What is a DaemonSet?
**Answer:**  
A DaemonSet ensures that a copy of a Pod runs on all (or selected) nodes. Commonly used for logging or monitoring agents.

### 13. How do you expose an application externally?
**Answer:**  
- **NodePort:** Exposes the service on each node’s IP at a static port.
- **LoadBalancer:** Provisions an external IP (cloud providers).
- **Ingress:** Routes HTTP/S traffic to services.

### 14. What is kubelet?
**Answer:**  
kubelet is an agent that runs on each node in the cluster. It ensures containers are running in a Pod.

### 15. How does Kubernetes provide high availability?
**Answer:**  
- Multiple master nodes (control plane).
- ReplicaSets for Pods.
- Self-healing (restarts failed Pods/nodes).

### 16. How do you upgrade a cluster?
**Answer:**  
Use tools like `kubeadm` or managed services, upgrade master and node components sequentially, drain and upgrade nodes, then uncordon.

### 17. What is etcd?
**Answer:**  
etcd is a distributed key-value store used by Kubernetes to store all cluster data and configuration.

### 18. How do you perform zero-downtime deployments?
**Answer:**  
Use Deployments with rolling updates, readiness/liveness probes, and PodDisruptionBudgets to ensure service continuity.

### 19. What are readiness and liveness probes?
**Answer:**  
- **Liveness probe:** Checks if the app is alive; restarts if failed.
- **Readiness probe:** Checks if the app is ready to receive traffic; removes from load-balancer if not ready.

### 20. What is a PersistentVolume (PV) and PersistentVolumeClaim (PVC)?
**Answer:**  
- **PersistentVolume (PV):** Storage resource in the cluster.
- **PersistentVolumeClaim (PVC):** Request for storage by a Pod.

### 21. How does Service Discovery work?
**Answer:**  
Kubernetes injects environment variables and DNS records for Services, allowing Pods to find each other.

### 22. What is a ReplicaSet?
**Answer:**  
Maintains a stable set of replica Pods running at any time.

### 23. How do you rollback a deployment?
**Answer:**  
`kubectl rollout undo deployment/<deployment-name>`

### 24. What is a Job and CronJob?
**Answer:**  
- **Job:** Ensures a task runs to completion.
- **CronJob:** Schedules Jobs to run periodically (like cron).

### 25. What is Ingress?
**Answer:**  
Ingress manages external HTTP/S access to services within the cluster, supporting host-based and path-based routing.

### 26. What is Taint and Toleration?
**Answer:**  
- **Taint:** Marks a node to repel certain Pods.
- **Toleration:** Allows Pods to schedule on tainted nodes.

### 27. What is affinity and anti-affinity?
**Answer:**  
- **Affinity:** Rules for co-locating Pods.
- **Anti-affinity:** Rules for spreading Pods across nodes.

### 28. How do you debug a Pod?
**Answer:**  
- `kubectl logs <pod>`
- `kubectl exec -it <pod> -- /bin/sh`
- `kubectl describe pod <pod>`

### 29. What is RBAC?
**Answer:**  
Role-Based Access Control restricts who can perform actions in the cluster.

### 30. How do you monitor a Kubernetes cluster?
**Answer:**  
Use Prometheus for metrics, Grafana for dashboards, and metrics-server for basic resource monitoring.

---

*(Due to response length, if you need the remaining sections (Docker, Git, Linux, Splunk, Terraform, Ansible) with 30 detailed Q&A each, please reply "continue docker" and I will provide the next section in full detail.)*
