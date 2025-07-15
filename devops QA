# DevOps Interview Notes

---

## What is Git, and why is it used in DevOps?

Git is a distributed version control system that helps DevOps teams collaborate efficiently by managing code changes, tracking history, and enabling automation. It integrates with CI/CD tools like Jenkins and GitHub Actions, ensuring smooth deployments.  
**In DevOps:**  
- Used for Infrastructure as Code (IaC)  
- Enables automated testing  
- Maintains version-controlled configurations  
- Supports branching, merging, and rollbacks  
- Essential for high-quality software delivery

---

## Difference between `git fetch`, `git pull`, and `git clone`

- **git fetch**: Downloads changes from the remote repository, but doesn’t merge them.
- **git pull**: Does both fetching and merging in one step.
- **git clone**: Creates a full local copy of a remote repository.

_Usage in DevOps:_  
- `git pull` keeps infrastructure code up to date  
- `git fetch` is useful for reviewing changes before merging

---

## What is the Purpose of `git stash`?

`git stash` allows you to temporarily save changes without committing them.  
**Use cases:**  
- Switch branches or pull updates without losing progress  
- Fix urgent production issues without committing incomplete infrastructure changes

---

## Merge Conflict

A merge conflict happens when two branches modify the same file.  
- Git marks the conflict in the file  
- Developer must manually edit, remove conflict markers, stage, and commit the file

**DevOps Example:**  
- Occurs when multiple engineers push infrastructure code (e.g., Terraform, Kubernetes YAMLs)  
- Use `git mergetool` or manual review to resolve

---

## What is Continuous Integration (CI) and Continuous Deployment (CD)?

- **Continuous Integration (CI):**
    - Automates code integration from multiple developers into a shared repository
    - Automated builds & tests catch errors early

    **Example:**  
    1. Developer pushes code to GitHub  
    2. Jenkins/GitHub Actions/GitLab CI runs unit tests  
    3. If tests pass, code merges to main branch

    **Benefits:**  
    - Detects bugs early  
    - Improves code quality  
    - Ensures smoother collaboration

- **Continuous Deployment (CD):**
    - Extends CI by deploying tested code to staging or production automatically

    **Example:**  
    1. After CI, pipeline builds Docker image  
    2. Application deployed to AWS, Kubernetes, or GCP

    **Benefits:**  
    - Faster, more stable releases  
    - Minimal human intervention

---

## Jenkins

Jenkins is an open-source automation tool for CI/CD.  
**Why use Jenkins in DevOps?**  
- Automates CI/CD pipelines  
- Integrates with Git, Docker, Kubernetes, AWS, GCP  
- Early bug detection with automated testing  
- Reduces manual effort

**Key Features:**  
- Pipeline as Code (Jenkinsfile)  
- 1,800+ plugins  
- Distributed builds (Master-Slave)  
- Automated testing

**How Jenkins Works:**  
1. Developer pushes code  
2. Jenkins triggers build  
3. Code compiled, tested, packaged  
4. Tests pass: Jenkins deploys application

**Simple Jenkins Pipeline Example:**

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps { sh 'mvn clean package' }
        }
        stage('Test') {
            steps { sh 'mvn test' }
        }
        stage('Deploy') {
            steps { sh 'kubectl apply -f deployment.yaml' }
        }
    }
}
```

**Jenkins Interview Q&A:**  
1. **Freestyle vs Pipeline Jobs:**  
    - Freestyle: GUI-based, limited flexibility  
    - Pipeline: Jenkinsfile, code-based, more powerful  
2. **Jenkinsfile:**  
    - Script defining CI/CD pipeline (Groovy syntax)  
3. **Automatic Build Triggers:**  
    - Webhooks, Cron jobs, SCM polling

---

## How Do You Configure a Jenkins Pipeline?

**Steps:**
1. Install Jenkins and required plugins (Pipeline, Git, Docker, Kubernetes, etc.)
2. Create Pipeline Job: Jenkins Dashboard → New Item → Pipeline
3. Define Pipeline: Script from SCM, provide Git repo URL & branch
4. Write Jenkinsfile (Pipeline as Code)

**Example Declarative Pipeline:**

```groovy
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps { git branch: 'main', url: 'https://github.com/example/repo.git' }
        }
        stage('Build') {
            steps { sh 'mvn clean package' }
        }
        stage('Test') {
            steps { sh 'mvn test' }
        }
        stage('Deploy') {
            steps { sh 'kubectl apply -f deployment.yaml' }
        }
    }
}
```

5. Configure build triggers (Webhooks, Poll SCM)
6. Save and run

**Handling Failures:**  
- Use `try {}` blocks in scripted pipelines  
- Use `post { failure { ... } }` in declarative pipelines

---

## Jenkins Agents

Jenkins agents (nodes/workers) are machines that run build jobs, distributing workloads and improving performance.

**How they work:**  
- Master assigns tasks  
- Agents execute builds, tests, deployments  
- Results reported back to master

**Types:**  
- Static (permanent): Always available  
- Dynamic (on-demand): Created/destroyed in cloud/Kubernetes

**Assigning jobs to agents (label):**

```groovy
pipeline {
    agent { label 'docker-agent' }
    stages {
        stage('Build') {
            steps { sh 'docker build -t myapp:latest .' }
        }
    }
}
```

---

## Blue-Green Deployment in Kubernetes

Ensures zero downtime by maintaining two environments (Blue & Green).

**Steps:**
1. Deploy Green (current stable)
2. Expose Green with a Service

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: green-app
  labels:
    app: myapp
    version: green
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
      version: green
  template:
    metadata:
      labels:
        app: myapp
        version: green
    spec:
      containers:
      - name: myapp
        image: nginx:1.19
        ports:
        - containerPort: 80
```

3. Deploy Blue (new version)
4. Use Istio/NGINX for traffic management:

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: myapp
spec:
  hosts:
  - myapp.example.com
  http:
  - route:
    - destination:
        host: myapp-green
      weight: 100
    - destination:
        host: myapp-blue
      weight: 0
```

- Shift traffic from Green → Blue by updating weights
- Roll back by reverting weights
- Delete Green when Blue is stable

**Benefits:**  
- Zero downtime  
- Instant rollback  
- Easy testing

---

## What is Kubernetes?

Kubernetes (K8s) is an open-source container orchestration platform for deploying, scaling, and managing containerized apps.

**Why use Kubernetes?**  
- Automated deployment & scaling  
- Self-healing  
- Load balancing  
- Service discovery  
- Multi-cloud support

**Architecture:**  
- **Control Plane (Master):**
    - API Server
    - Scheduler
    - Controller Manager
    - ETCD
- **Worker Nodes:**
    - Kubelet
    - Container Runtime (Docker/Containerd)
    - Kube Proxy

**Key Objects:**  
- Pod, Deployment, Service, Ingress, ConfigMap, Secret, Persistent Volume

**Deployment Example:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

---

## What is Docker?

Docker is an open-source containerization platform for building, packaging, and running apps in lightweight, isolated containers.

**Why use Docker?**  
- Portability  
- Efficiency (uses fewer resources than VMs)  
- Scalability (works well with Kubernetes)  
- Fast deployment

**How Docker works internally:**  
- Docker Engine (dockerd) runs containers  
- Pulls images from registry (Docker Hub, ECR, etc.)
- Uses Linux namespaces & cgroups for isolation and resource limits
- Copy-on-write storage for efficient images

**Key Components:**  
- Docker Daemon
- Docker CLI
- Docker Image
- Docker Container
- Docker Registry
- Dockerfile

---

## Kubernetes Architecture

- **Control Plane (Master Node):**
    - API Server: Entry point for commands
    - Scheduler: Assigns Pods to nodes
    - Controller Manager: Maintains desired state
    - ETCD: Distributed key-value store

- **Worker Nodes:**
    - Kubelet: Ensures Pods run
    - Container Runtime: Runs containers
    - Kube Proxy: Handles networking/balancing

**Key Objects:**  
- Pod, Deployment, Service, Ingress, ConfigMap, Secret, Persistent Volume

---

## Rolling Updates in Kubernetes

Rolling Updates = Gradually replace old pods with new ones (zero downtime).

**How to update:**

- **Imperative (CLI):**
    ```sh
    kubectl set image deployment/my-app my-container=my-app:v2
    ```

- **Declarative (YAML):**
    - Update image in deployment YAML
    - `kubectl apply -f my-deployment.yaml`

- **Monitor:**
    ```sh
    kubectl rollout status deployment/my-app
    ```

- **Rollback:**
    ```sh
    kubectl rollout undo deployment/my-app
    ```

- **Control update speed:**  
    ```yaml
    strategy:
      type: RollingUpdate
      rollingUpdate:
        maxSurge: 1
        maxUnavailable: 1
    ```

**Benefits:**  
- No downtime  
- Smooth upgrades  
- Supports rollback

---
