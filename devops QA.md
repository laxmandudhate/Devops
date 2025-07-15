# DevOps Top 30 Interview Questions & Answers by Tool

---

## SRE (Site Reliability Engineering)

### 1. What is SRE and how is it different from DevOps?
**Answer:**  
SRE (Site Reliability Engineering) is a discipline that incorporates aspects of software engineering and applies them to IT operations. The main goal is to create scalable and highly reliable software systems. While DevOps focuses on collaboration between development and operations, SRE is a set of practices, metrics, and tools to ensure system reliability, availability, and performance.

### 2. What are SLIs, SLOs, and SLAs?
**Answer:**  
- **SLI (Service Level Indicator):** A carefully defined quantitative measure of some aspect of the service level, such as latency or error rate.
- **SLO (Service Level Objective):** The target value or range for a service level that is measured by SLIs.
- **SLA (Service Level Agreement):** A formalized agreement between a service provider and a customer about expected service standards.

### 3. How do you define Error Budgets?
**Answer:**  
An error budget is the maximum allowable threshold of errors (such as downtime or failed requests) in a specific period, derived from the SLO. It balances innovation and reliability by allowing a certain amount of failure.

### 4. Explain the concept of Toil and how SRE addresses it.
**Answer:**  
Toil is repetitive, manual, automatable operational work that doesn't add enduring value. SREs aim to minimize toil through automation and process optimization.

### 5. What tools are commonly used for monitoring in SRE?
**Answer:**  
Prometheus, Grafana, Nagios, Datadog, New Relic, Stackdriver.

### 6. How is incident management handled in SRE?
**Answer:**  
Incident management involves detection, response, mitigation, postmortem analysis, and learning from failures. SREs use runbooks, alerting systems, and blameless postmortems.

### 7. What is a blameless postmortem and why is it important?
**Answer:**  
A blameless postmortem is a retrospective analysis of an incident without assigning individual blame, focusing on process and system improvements.

### 8. How do you implement monitoring and alerting in SRE?
**Answer:**  
Set up monitoring tools (Prometheus, Nagios), define SLIs, configure alerts for SLO breaches, and ensure actionable notifications.

### 9. What is capacity planning and how is it done?
**Answer:**  
Capacity planning forecasts resource requirements based on usage trends and expected growth to prevent outages and ensure scalability.

### 10. How do you perform root cause analysis?
**Answer:**  
Collect logs, metrics, and traces, reconstruct the incident timeline, identify the triggering event, and recommend corrective actions.

### 11. Explain canary deployments and their benefits.
**Answer:**  
Canary deployments roll out changes to a small subset of users before a full rollout. This limits exposure if issues arise.

### 12. What is chaos engineering?
**Answer:**  
Chaos engineering involves deliberately introducing failures to test system resilience and improve recovery processes.

### 13. How are playbooks and runbooks used in SRE?
**Answer:**  
Playbooks and runbooks document operational procedures, incident responses, and troubleshooting steps to standardize responses.

### 14. What is a “latency SLI” example?
**Answer:**  
Percentage of requests served under 200ms.

### 15. How do you balance reliability and feature velocity?
**Answer:**  
By managing the error budget: if the budget is exhausted, slow down feature releases and focus on stability.

### 16. What is blue/green deployment?
**Answer:**  
A deployment strategy where two identical environments (blue and green) are used; switch traffic to new environment after successful deployment.

### 17. How does SRE handle on-call rotations?
**Answer:**  
By distributing on-call responsibilities evenly, automating alerting, and ensuring actionable alerts.

### 18. What is service degradation versus outage?
**Answer:**  
Degradation means reduced service quality (e.g., slow response), while outage means complete unavailability.

### 19. What is auto-remediation?
**Answer:**  
Automated detection and correction of incidents without human intervention.

### 20. How do you measure system availability?
**Answer:**  
Availability = (Uptime / (Uptime + Downtime)) * 100

### 21. What is incident response lifecycle?
**Answer:**  
Detection → Triage → Mitigation → Resolution → Postmortem

### 22. How do you handle alert fatigue?
**Answer:**  
By tuning alert thresholds, reducing noise, and ensuring alerts are actionable.

### 23. How do you manage configuration drift?
**Answer:**  
Using configuration management tools (Ansible, Puppet), CI/CD, and regular audits.

### 24. What is the “four golden signals” in monitoring?
**Answer:**  
Latency, Traffic, Errors, Saturation.

### 25. What is black-box vs white-box monitoring?
**Answer:**  
- Black-box: Observes system from the outside (e.g., HTTP checks).
- White-box: Monitors internal metrics (e.g., CPU, memory).

### 26. What is load balancing?
**Answer:**  
Distributing network or application traffic across multiple servers to ensure reliability and performance.

### 27. What is a runbook automation example?
**Answer:**  
Automated script to restart a failed service when an alert is triggered.

### 28. How do you design for high availability?
**Answer:**  
Redundancy, failover, data replication, and distributed architecture.

### 29. What is MTTR and MTBF?
**Answer:**  
- MTTR (Mean Time to Repair): Average time to recover from failure.
- MTBF (Mean Time Between Failures): Average time between failures.

### 30. How do you ensure security in SRE practices?
**Answer:**  
Regular audits, vulnerability scanning, monitoring, and incident response integration.

---

## Kubernetes

### 1. What is Kubernetes?
**Answer:**  
Kubernetes is an open-source platform for automating deployment, scaling, and management of containerized applications.

### 2. What are Pods in Kubernetes?
**Answer:**  
Pods are the smallest deployable units that can contain one or more containers, sharing storage and network.

### 3. What is a Deployment?
**Answer:**  
A Deployment manages ReplicaSets and ensures the desired state of Pods.

### 4. How does a Service work in Kubernetes?
**Answer:**  
A Service exposes Pods to network traffic, enabling communication within or outside the cluster.

### 5. What is a Namespace?
**Answer:**  
Namespaces are virtual clusters within a Kubernetes cluster for resource isolation.

### 6. How does rolling update work?
**Answer:**  
Kubernetes gradually replaces old Pods with new ones using Deployments.

### 7. What is a StatefulSet?
**Answer:**  
A StatefulSet manages stateful applications, providing stable network identities and storage.

### 8. How do you perform a blue-green deployment?
**Answer:**  
Deploy two environments (blue/green), switch traffic via Services or Ingress.

### 9. How does Kubernetes handle scaling?
**Answer:**  
Horizontal Pod Autoscaler automatically scales Pod replicas based on metrics.

### 10. What is a ConfigMap?
**Answer:**  
ConfigMap stores non-confidential configuration data as key-value pairs.

### 11. How are Secrets managed?
**Answer:**  
Secrets store sensitive data (like passwords) in an encoded format.

### 12. What is a DaemonSet?
**Answer:**  
A DaemonSet ensures a copy of a Pod runs on each node.

### 13. How do you expose an application externally?
**Answer:**  
Using Services of type LoadBalancer, NodePort, or Ingress.

### 14. What is kubelet?
**Answer:**  
Kubelet is an agent running on each node, managing Pod lifecycle.

### 15. How does Kubernetes provide high availability?
**Answer:**  
Through redundant masters, replica sets, self-healing, and auto-scaling.

### 16. How do you upgrade a cluster?
**Answer:**  
Use managed services or kubeadm to upgrade master and node components.

### 17. What is etcd?
**Answer:**  
A distributed key-value store for all cluster data.

### 18. How do you perform zero-downtime deployments?
**Answer:**  
With rolling updates, readiness/liveness probes, and PodDisruptionBudgets.

### 19. What are readiness and liveness probes?
**Answer:**  
- Liveness probe: Checks if a container is running.
- Readiness probe: Checks if a container is ready to accept traffic.

### 20. What is a PersistentVolume (PV) and PersistentVolumeClaim (PVC)?
**Answer:**  
PV is a storage resource; PVC is a request for storage by users.

### 21. How does Service Discovery work?
**Answer:**  
Via DNS and environment variables within the cluster.

### 22. What is a ReplicaSet?
**Answer:**  
Manages a set of Pod replicas, ensuring a specified number is running.

### 23. How do you rollback a deployment?
**Answer:**  
Use `kubectl rollout undo deployment/<name>`.

### 24. What is a Job and CronJob?
**Answer:**  
- Job: Runs a task to completion.
- CronJob: Schedules Jobs at specific intervals.

### 25. What is Ingress?
**Answer:**  
Manages external HTTP/HTTPS access to services.

### 26. What is Taint and Toleration?
**Answer:**  
- Taint: Prevents Pods from being scheduled on certain nodes.
- Toleration: Allows Pods to override taints.

### 27. What is affinity and anti-affinity?
**Answer:**  
Rules for co-locating or separating Pods on nodes.

### 28. How do you debug a Pod?
**Answer:**  
Use `kubectl logs`, `kubectl exec`, and events inspection.

### 29. What is RBAC?
**Answer:**  
Role-Based Access Control restricts user and service permissions.

### 30. How do you monitor a Kubernetes cluster?
**Answer:**  
With Prometheus, Grafana, and built-in metrics-server.

---

## Docker

### 1. What is Docker?
**Answer:**  
A containerization platform for developing, shipping, and running applications in isolated environments called containers.

### 2. What is a Docker image?
**Answer:**  
A read-only template containing application code, libraries, and dependencies.

### 3. What is a Docker container?
**Answer:**  
A running instance of a Docker image.

### 4. How do you build a Docker image?
**Answer:**  
Using the `docker build` command and a Dockerfile.

### 5. What is a Dockerfile?
**Answer:**  
A text file with instructions for building a Docker image.

### 6. What is Docker Hub?
**Answer:**  
A public registry for sharing Docker images.

### 7. How do you run a container in the background?
**Answer:**  
Use `docker run -d <image>`.

### 8. How do you list running containers?
**Answer:**  
`docker ps`

### 9. How do you stop a running container?
**Answer:**  
`docker stop <container_id>`

### 10. What is the difference between COPY and ADD in Dockerfile?
**Answer:**  
COPY copies files/directories; ADD does the same but can also unpack archives and fetch URLs.

### 11. What is a Docker volume?
**Answer:**  
Persistent storage that is managed by Docker.

### 12. How do you create and use a volume?
**Answer:**  
`docker volume create myvol` and `docker run -v myvol:/data <image>`

### 13. What is Docker Compose?
**Answer:**  
A tool for defining and running multi-container Docker applications.

### 14. How do you scale services using Docker Compose?
**Answer:**  
`docker-compose up --scale web=3`

### 15. How do you network containers?
**Answer:**  
Using Docker networks: bridge, host, overlay.

### 16. What is the difference between an image and a container?
**Answer:**  
Image is a blueprint; container is a running instance.

### 17. How do you remove unused images and containers?
**Answer:**  
`docker system prune`

### 18. How does Docker handle networking?
**Answer:**  
Through user-defined bridge networks, host networking, and overlay networks for clusters.

### 19. What is an ENTRYPOINT in Dockerfile?
**Answer:**  
Specifies the default application to run in the container.

### 20. How do you pass environment variables to containers?
**Answer:**  
Using the `-e` flag: `docker run -e VAR=value <image>`

### 21. What is the purpose of the .dockerignore file?
**Answer:**  
It excludes files/folders from the build context.

### 22. How do you access a container’s shell?
**Answer:**  
`docker exec -it <container_id> bash` (if bash is installed)

### 23. What is a multi-stage build?
**Answer:**  
A technique to reduce image size by using multiple FROM statements in a Dockerfile.

### 24. How do you expose ports in Docker?
**Answer:**  
Using EXPOSE in Dockerfile and `-p` or `--publish` flag in run command.

### 25. What is Docker Swarm?
**Answer:**  
A native Docker clustering and orchestration tool.

### 26. How do you update a running service in Docker Swarm?
**Answer:**  
`docker service update <service>`

### 27. What is the benefit of lightweight containers over VMs?
**Answer:**  
Less overhead, faster startup, better resource utilization.

### 28. How does Docker ensure process isolation?
**Answer:**  
Using Linux namespaces and cgroups.

### 29. What are Docker labels?
**Answer:**  
Metadata for organizing and managing containers/images.

### 30. How do you troubleshoot Docker containers?
**Answer:**  
Check logs (`docker logs <container_id>`), inspect state, and use `docker exec` for interactive debugging.

---

## Git

### 1. What is Git?
**Answer:**  
A distributed version control system for tracking changes in source code.

### 2. Difference between Git and GitHub?
**Answer:**  
Git is the tool; GitHub is a cloud-based hosting service for Git repositories.

### 3. How do you initialize a new repo?
**Answer:**  
`git init`

### 4. How do you clone a repo?
**Answer:**  
`git clone <repo_url>`

### 5. How do you stage and commit changes?
**Answer:**  
`git add .` then `git commit -m "message"`

### 6. What is a branch?
**Answer:**  
A pointer to a snapshot of changes; used for feature development and isolation.

### 7. How do you create and switch branches?
**Answer:**  
`git checkout -b <branch_name>`

### 8. How do you merge branches?
**Answer:**  
`git merge <branch_name>`

### 9. What is a merge conflict?
**Answer:**  
Occurs when changes in two branches conflict and require manual resolution.

### 10. How do you resolve merge conflicts?
**Answer:**  
Edit conflicted files, stage resolved files, and commit.

### 11. What is `git fetch` vs. `git pull`?
**Answer:**  
`git fetch` downloads changes; `git pull` downloads and merges.

### 12. What is `git rebase`?
**Answer:**  
Reapplies commits on top of another base branch; used to maintain a linear history.

### 13. How do you undo a commit?
**Answer:**  
`git revert <commit>` or `git reset --hard <commit>`

### 14. What is a remote?
**Answer:**  
A reference to a remote repository, e.g., origin.

### 15. How do you view commit history?
**Answer:**  
`git log`

### 16. How do you stash changes?
**Answer:**  
`git stash`

### 17. How do you apply stashed changes?
**Answer:**  
`git stash apply`

### 18. What is a tag?
**Answer:**  
A reference to a specific commit, often used for releases.

### 19. How do you create a tag?
**Answer:**  
`git tag v1.0.0`

### 20. How do you push tags to remote?
**Answer:**  
`git push origin --tags`

### 21. How do you delete a branch?
**Answer:**  
`git branch -d <branch_name>`

### 22. What is a detached HEAD?
**Answer:**  
When HEAD points to a specific commit, not a branch.

### 23. How do you cherry-pick a commit?
**Answer:**  
`git cherry-pick <commit_hash>`

### 24. What is the difference between `origin` and `upstream`?
**Answer:**  
`origin` is your fork; `upstream` is the original repo.

### 25. How do you squash commits?
**Answer:**  
`git rebase -i HEAD~n` and mark commits as squash.

### 26. What is `.gitignore`?
**Answer:**  
A file specifying files/directories to ignore in version control.

### 27. How do you see file differences?
**Answer:**  
`git diff <file>`

### 28. How do you revert a file to a previous commit?
**Answer:**  
`git checkout <commit> -- <file>`

### 29. How do you blame a file?
**Answer:**  
`git blame <file>`

### 30. How do you clean untracked files?
**Answer:**  
`git clean -f`

---

## Linux

### 1. What is Linux?
**Answer:**  
An open-source operating system kernel used to build Unix-like OSes.

### 2. What is a shell?
**Answer:**  
A command-line interface for interacting with the operating system.

### 3. How do you list files?
**Answer:**  
`ls`

### 4. How do you check current directory?
**Answer:**  
`pwd`

### 5. How do you create, delete, and move files?
**Answer:**  
- Create: `touch file.txt`
- Delete: `rm file.txt`
- Move: `mv file.txt /path/`

### 6. How do you view file contents?
**Answer:**  
`cat file.txt`, `less file.txt`, `head file.txt`, `tail file.txt`

### 7. What are permissions in Linux?
**Answer:**  
Read, write, execute permissions for user, group, and others.

### 8. How do you change permissions?
**Answer:**  
`chmod 755 file.txt`

### 9. How do you change file ownership?
**Answer:**  
`chown user:group file.txt`

### 10. How do you find files?
**Answer:**  
`find /path -name "*.txt"`

### 11. How do you search within files?
**Answer:**  
`grep "pattern" file.txt`

### 12. How do you view running processes?
**Answer:**  
`ps aux`, `top`, `htop`

### 13. How do you kill a process?
**Answer:**  
`kill <pid>`

### 14. How do you check disk usage?
**Answer:**  
`df -h`, `du -sh *`

### 15. How do you check memory usage?
**Answer:**  
`free -m`

### 16. How do you monitor network usage?
**Answer:**  
`netstat -tulnp`, `ss -tulnp`, `iftop`

### 17. What is a symbolic link?
**Answer:**  
A shortcut/reference to another file: `ln -s target linkname`

### 18. How do you schedule a cron job?
**Answer:**  
`crontab -e`

### 19. How do you check system logs?
**Answer:**  
`/var/log/syslog`, `journalctl`

### 20. How do you check open ports?
**Answer:**  
`netstat -tulpn`, `ss -tulpn`

### 21. How do you extract and compress files?
**Answer:**  
- Extract: `tar -xvf file.tar`
- Compress: `tar -czvf file.tar.gz dir/`

### 22. How do you check environment variables?
**Answer:**  
`env`, `echo $VAR`

### 23. How do you set environment variables?
**Answer:**  
`export VAR=value`

### 24. How do you update installed packages?
**Answer:**  
- Ubuntu: `sudo apt update && sudo apt upgrade`
- CentOS: `sudo yum update`

### 25. How do you create a new user?
**Answer:**  
`sudo adduser username`

### 26. How do you switch users?
**Answer:**  
`su - username`, `sudo -i`

### 27. How do you check system uptime?
**Answer:**  
`uptime`

### 28. How do you reboot or shutdown?
**Answer:**  
`sudo reboot`, `sudo shutdown now`

### 29. How do you display the last 10 lines of a file?
**Answer:**  
`tail file.txt`

### 30. How do you update file timestamps?
**Answer:**  
`touch file.txt`

---

## Splunk

### 1. What is Splunk?
**Answer:**  
A platform for searching, monitoring, and analyzing machine-generated data via a web-style interface.

### 2. What are the main components of Splunk?
**Answer:**  
- Forwarder (collects logs)
- Indexer (stores data)
- Search Head (user interface)

### 3. What is a Splunk forwarder?
**Answer:**  
A lightweight agent that collects and sends logs to the Splunk indexer.

### 4. What is the difference between universal and heavy forwarder?
**Answer:**  
Universal: Just forwards logs. Heavy: Can parse and filter data before forwarding.

### 5. What is an index in Splunk?
**Answer:**  
A data store where Splunk saves incoming data.

### 6. How do you search in Splunk?
**Answer:**  
Using SPL (Search Processing Language): `index=main error`

### 7. What is a sourcetype?
**Answer:**  
A label to categorize data inputs in Splunk.

### 8. How do you create dashboards?
**Answer:**  
Via Splunk Web, using panels, charts, and visualizations.

### 9. What are Splunk apps?
**Answer:**  
Prebuilt solutions to extend Splunk functionality.

### 10. What are Splunk alerts?
**Answer:**  
Notifications triggered by search results matching certain criteria.

### 11. How do you schedule reports?
**Answer:**  
Via Splunk Web, using scheduled searches.

### 12. What is a field extraction?
**Answer:**  
Process of identifying and extracting fields from raw data.

### 13. What is lookup in Splunk?
**Answer:**  
A method for enriching event data with external data sets.

### 14. What is Splunk CIM?
**Answer:**  
Common Information Model; standardizes field names across data sources.

### 15. What is Splunk Enterprise Security (ES)?
**Answer:**  
A premium security solution built on Splunk for security monitoring.

### 16. How do you optimize Splunk searches?
**Answer:**  
Filter early, use wildcards carefully, and limit returned fields.

### 17. What is a Splunk license?
**Answer:**  
Controls the amount of data that can be indexed daily.

### 18. What is Splunk DB Connect?
**Answer:**  
An app to integrate database data into Splunk.

### 19. How do you manage Splunk users?
**Answer:**  
Through Splunk Web or CLI, assigning roles and permissions.

### 20. What is summary indexing?
**Answer:**  
Storing precomputed search results for faster queries.

### 21. What is a notable event?
**Answer:**  
An event flagged as important, generally by correlation searches.

### 22. What is the difference between stats and timechart commands?
**Answer:**  
- `stats`: Aggregates data.
- `timechart`: Aggregates data over time intervals.

### 23. How do you mask sensitive data in Splunk?
**Answer:**  
Using transforms and regular expressions in props.conf and transforms.conf.

### 24. What is Splunk ITSI?
**Answer:**  
IT Service Intelligence; for monitoring critical IT services.

### 25. How do you forward logs securely?
**Answer:**  
Use SSL/TLS encryption between forwarders and indexers.

### 26. How do you monitor Splunk performance?
**Answer:**  
Through internal logs, Monitoring Console, and health checks.

### 27. What is the Splunk REST API?
**Answer:**  
Interface for programmatic access to Splunk data and management.

### 28. How do you create custom scripts in Splunk?
**Answer:**  
Via custom search commands and scripted inputs.

### 29. What is the function of props.conf?
**Answer:**  
Defines how Splunk processes and parses incoming data.

### 30. How do you configure data retention in Splunk?
**Answer:**  
By setting indexes.conf parameters like `frozenTimePeriodInSecs`.

---

## Terraform

### 1. What is Terraform?
**Answer:**  
An open-source IaC (Infrastructure as Code) tool for provisioning cloud resources.

### 2. What is HCL?
**Answer:**  
HashiCorp Configuration Language, used to write Terraform configuration files.

### 3. What is a provider in Terraform?
**Answer:**  
A plugin to interact with cloud APIs (e.g., AWS, Azure, GCP).

### 4. What is a resource in Terraform?
**Answer:**  
A component (VM, DB, network) managed by Terraform.

### 5. How do you initialize a Terraform project?
**Answer:**  
`terraform init`

### 6. How do you plan changes?
**Answer:**  
`terraform plan`

### 7. How do you apply changes?
**Answer:**  
`terraform apply`

### 8. How do you destroy resources?
**Answer:**  
`terraform destroy`

### 9. What is a variable in Terraform?
**Answer:**  
A parameterized value used for dynamic configuration.

### 10. How do you define outputs?
**Answer:**  
Using the `output` block for returning values after apply.

### 11. What is state file?
**Answer:**  
A file (`terraform.tfstate`) tracking resource mappings.

### 12. How do you manage remote state?
**Answer:**  
Using backends like S3, Azure Blob, GCS.

### 13. What is resource dependency?
**Answer:**  
Defined implicitly by references or explicitly using `depends_on`.

### 14. How do you use modules?
**Answer:**  
Reusable configurations called via the `module` block.

### 15. How do you provision resources conditionally?
**Answer:**  
Using `count`, `for_each`, or `if` expressions.

### 16. What is data source in Terraform?
**Answer:**  
Reads information from external sources for use in configuration.

### 17. What are locals?
**Answer:**  
Local values for simplifying expressions.

### 18. How do you perform interpolation?
**Answer:**  
Using `${}` syntax.

### 19. How do you import existing resources?
**Answer:**  
`terraform import <resource> <id>`

### 20. What is Terraform workspace?
**Answer:**  
Enables multiple state files for different environments.

### 21. How do you lock state files?
**Answer:**  
With remote backends that support locking (e.g., S3 with DynamoDB).

### 22. What is tainting a resource?
**Answer:**  
Forces recreation on next apply: `terraform taint <resource>`

### 23. How do you handle secrets in Terraform?
**Answer:**  
Use environment variables, Vault, or secret backends.

### 24. How do you write a custom provider?
**Answer:**  
Implement in Go using Terraform plugin SDK.

### 25. What is the lifecycle block?
**Answer:**  
Controls create_before_destroy, prevent_destroy behaviors.

### 26. How do you debug Terraform?
**Answer:**  
Set `TF_LOG=DEBUG` for verbose output.

### 27. How do you prevent resource drift?
**Answer:**  
Regularly run `terraform plan` and use remote state.

### 28. How do you manage environment-specific configs?
**Answer:**  
Use workspaces or variable files.

### 29. How do you test Terraform code?
**Answer:**  
With tools like `terraform validate`, `terratest`, `kitchen-terraform`.

### 30. What is the difference between `terraform apply` and `terraform plan`?
**Answer:**  
`plan` shows what will change; `apply` executes the changes.

---

## Ansible

### 1. What is Ansible?
**Answer:**  
An open-source configuration management and automation tool.

### 2. What is an Ansible playbook?
**Answer:**  
A YAML file defining automation tasks.

### 3. What is an inventory file?
**Answer:**  
A file listing managed hosts.

### 4. How do you run a playbook?
**Answer:**  
`ansible-playbook playbook.yml`

### 5. What is an Ansible role?
**Answer:**  
A way to group tasks, variables, files, etc., for reuse.

### 6. What is an Ansible module?
**Answer:**  
A unit of work, e.g., `copy`, `yum`, `service`.

### 7. How do you use variables?
**Answer:**  
Define in playbooks, inventory, or external files.

### 8. What is a handler?
**Answer:**  
A task triggered by a notify statement, usually for service reloads.

### 9. What is idempotency?
**Answer:**  
Running tasks multiple times yields the same result.

### 10. How do you manage secrets?
**Answer:**  
Using Ansible Vault for encryption.

### 11. How do you limit playbook execution to specific hosts?
**Answer:**  
Use `-l` or `--limit` flag.

### 12. What is a fact in Ansible?
**Answer:**  
System information collected automatically.

### 13. How do you install Ansible?
**Answer:**  
`pip install ansible` or `apt/yum install ansible`

### 14. What is a dynamic inventory?
**Answer:**  
Inventory generated from cloud or other sources dynamically.

### 15. How do you use loops?
**Answer:**  
With `with_items`, `loop`, etc.

### 16. How do you use templates?
**Answer:**  
With the `template` module and Jinja2 syntax.

### 17. How do you test playbooks?
**Answer:**  
Using `ansible-playbook --check` or tools like Molecule.

### 18. What is a task?
**Answer:**  
A single unit of work in a playbook.

### 19. How do you include or import files?
**Answer:**  
With `include` or `import_playbook`.

### 20. How do you debug in Ansible?
**Answer:**  
Use the `debug` module.

### 21. What is the difference between `include` and `import`?
**Answer:**  
`import` is static (parsed at playbook start), `include` is dynamic (parsed at runtime).

### 22. How do you use tags?
**Answer:**  
To run specific tasks/groups using `--tags`.

### 23. How do you pass extra variables?
**Answer:**  
With `-e` flag: `ansible-playbook playbook.yml -e var=value`

### 24. What is Ansible Galaxy?
**Answer:**  
A repository for sharing Ansible roles.

### 25. How do you run ad-hoc commands?
**Answer:**  
`ansible all -m ping`

### 26. How do you handle errors in playbooks?
**Answer:**  
With `ignore_errors: true` or `block/rescue`.

### 27. What is delegation in Ansible?
**Answer:**  
Running a task on a different host using `delegate_to`.

### 28. What is a vault password file?
**Answer:**  
A file storing the password for decrypting Vault-encrypted data.

### 29. How do you parallelize task execution?
**Answer:**  
Adjust `forks` setting in ansible.cfg.

### 30. How do you gather facts selectively?
**Answer:**  
Set `gather_facts: false` or use `setup` module selectively.

---
