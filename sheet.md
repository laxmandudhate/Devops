Apache Server Cheat Sheet

📦 Installation
Ubuntu/Debian:
  sudo apt update
  sudo apt install apache2

CentOS/RHEL:
  sudo yum install httpd

🔄 Service Management
Ubuntu:
  Start     - sudo systemctl start apache2
  Stop      - sudo systemctl stop apache2
  Restart   - sudo systemctl restart apache2
  Status    - sudo systemctl status apache2
  Enable    - sudo systemctl enable apache2

CentOS:
  Start     - sudo systemctl start httpd
  Stop      - sudo systemctl stop httpd
  Restart   - sudo systemctl restart httpd
  Status    - sudo systemctl status httpd
  Enable    - sudo systemctl enable httpd

🛠️ Configuration Files
Main config: /etc/apache2/apache2.conf or /etc/httpd/conf/httpd.conf
Sites-available: /etc/apache2/sites-available/
Sites-enabled: /etc/apache2/sites-enabled/
Document root: /var/www/html

🏠 Virtual Hosts Template
<VirtualHost *:80>
    ServerName example.com
    DocumentRoot /var/www/example

    <Directory /var/www/example>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/example_error.log
    CustomLog ${APACHE_LOG_DIR}/example_access.log combined
</VirtualHost>

Enable & Reload:
  sudo a2ensite example.conf
  sudo systemctl reload apache2

🔍 Modules & Testing (Ubuntu)
  List modules       - apache2ctl -M
  Enable module      - sudo a2enmod rewrite
  Disable module     - sudo a2dismod rewrite
  Test configuration - apache2ctl configtest

🔐 Security Tips
  Disable directory listing: Options -Indexes
  Set permissions:
    sudo chown -R www-data:www-data /var/www/example
    sudo chmod -R 755 /var/www/example

📈 Logs
  Access log: /var/log/apache2/access.log
  Error log : /var/log/apache2/error.log
  Live log: sudo tail -f /var/log/apache2/error.log

🔐 Enable HTTPS (Let's Encrypt)
  sudo apt install certbot python3-certbot-apache
  sudo certbot --apache


***************************************************************************************************

cheat_sheet = """
Linux Command Line Cheat Sheet

📁 File & Directory Operations
ls              # List files
ls -l /path     # Long listing format
cd /path        # Change directory
pwd             # Print current directory
mkdir new_dir   # Create directory
rm file.txt     # Delete file
rm -r folder/   # Delete directory
cp file1 file2  # Copy file
mv old new      # Rename or move file
touch file.txt  # Create empty file
cat file.txt    # View file content

🔍 Searching & Finding
find / -name filename         # Find file by name
find . -type f -name "*.log"  # Find all .log files
grep "error" file.txt         # Search text in file
grep -r "search" /dir         # Recursive search

📄 Viewing & Monitoring Files
head -n 10 file.txt     # First 10 lines
tail -n 20 file.txt     # Last 20 lines
tail -f /var/log/syslog # Live log monitoring
less file.txt           # Scrollable viewer

⚙️ Permissions & Ownership
chmod 755 file        # Set permissions
chown user:user file  # Change owner
ls -l                 # View permissions

🧠 Process Management
ps aux                   # List processes
top                      # Live process monitor
htop                     # Enhanced top (if installed)
kill <PID>               # Kill process by PID
kill -9 <PID>            # Force kill
pkill process_name       # Kill by name

🛠️ System Info & Resources
uname -a                # Kernel and system info
df -h                   # Disk usage
du -sh /folder          # Folder size
free -h                 # Memory usage
uptime                  # System load & uptime
who                     # Who is logged in

📦 Package Management
Debian/Ubuntu:
  sudo apt update
  sudo apt upgrade
  sudo apt install nginx
  sudo apt remove nginx

RHEL/CentOS:
  sudo yum install nginx
  sudo yum remove nginx

📂 Tar, Zip, and Compression
tar -czf file.tar.gz folder/    # Compress folder
tar -xzf file.tar.gz            # Extract
zip -r file.zip folder/         # Zip folder
unzip file.zip                  # Unzip file

🌐 Networking
ping google.com               # Check connectivity
curl http://example.com       # Fetch URL
wget http://example.com       # Download file
ifconfig / ip addr            # Network interfaces
netstat -tuln                 # Listening ports
ss -tuln                      # Replacement for netstat

🔐 User Management
adduser newuser
passwd newuser
deluser olduser
usermod -aG sudo user         # Add to sudo group

📦 System Services (Systemd)
systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable nginx        # Start on boot
"""

************************************************************************************************************
docker_cheat_sheet_txt


🔧 Basic Docker Commands
docker --version                  # Check Docker version
docker info                       # Display system-wide information
docker help                       # Show all Docker commands

📦 Working with Images
docker pull <image>              # Download image from Docker Hub
docker images                    # List all local images
docker rmi <image>               # Remove an image
docker build -t name .           # Build image from Dockerfile

🐳 Working with Containers
docker run <image>                        # Run container from image
docker run -it <image> bash               # Run container with interactive shell
docker run -d -p 8080:80 <image>          # Run in detached mode and map ports
docker start <container_id>               # Start stopped container
docker stop <container_id>                # Stop running container
docker restart <container_id>             # Restart a container
docker rm <container_id>                  # Remove a container
docker exec -it <container_id> bash       # Execute command in running container

📂 Volumes and Data
docker volume create myvol                # Create volume
docker volume ls                          # List volumes
docker run -v myvol:/data <image>         # Mount volume into container
docker inspect <container_id>             # Inspect container settings

🌐 Networking
docker network ls                         # List networks
docker network create mynet               # Create new network
docker run --network=mynet <image>        # Connect container to network

📋 Container Logs & Monitoring
docker logs <container_id>                # View container logs
docker top <container_id>                 # Show running processes
docker stats                              # Show container resource usage

🔄 Docker Compose
docker-compose up                         # Start services in background
docker-compose up --build                 # Rebuild and start services
docker-compose down                       # Stop and remove containers/networks

🧹 Cleanup Commands
docker container prune                    # Remove all stopped containers
docker image prune                        # Remove unused images
docker volume prune                       # Remove unused volumes
docker system prune                       # Remove all unused data

🛠️ Dockerfile Example
FROM ubuntu
RUN apt update && apt install -y nginx
COPY . /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]

📝 Notes
- Use `-it` for interactive mode
- Use `-d` for detached/background mode
- Use `-p` to map host to container ports (e.g. -p 8080:80)
- Use `--name` to name your container

*********************************************************************************************

Kubernetes Command Line Cheat Sheet 🧠

🔍 Cluster Info & Context
kubectl cluster-info               # Show master and services info
kubectl config view                # Show kubeconfig details
kubectl config use-context <ctx>  # Switch to specific cluster context
kubectl get nodes                  # List all cluster nodes

📦 Working with Pods
kubectl get pods                   # List pods in default namespace
kubectl get pods -n kube-system    # List pods in kube-system namespace
kubectl describe pod <pod>         # Detailed pod info
kubectl logs <pod>                 # Show pod logs
kubectl logs <pod> -f              # Follow pod logs
kubectl exec -it <pod> -- bash     # Get a shell inside the pod

🛠️ Create / Apply Resources
kubectl apply -f file.yaml         # Apply changes from a YAML file
kubectl create -f file.yaml        # Create from a YAML file
kubectl delete -f file.yaml        # Delete resources defined in file

💥 Pod Management
kubectl delete pod <pod>           # Delete a pod
kubectl delete pod --all           # Delete all pods in current namespace
kubectl run nginx --image=nginx    # Run a temporary pod
kubectl expose pod nginx --port=80 --type=NodePort  # Expose pod

📁 Deployment Management
kubectl get deployments            # List deployments
kubectl describe deployment <name> # Deployment details
kubectl rollout status deployment/<name>  # Check rollout status
kubectl rollout undo deployment/<name>    # Rollback deployment

🔄 Scaling
kubectl scale deployment <name> --replicas=3  # Scale deployment to 3 pods

📂 Namespaces
kubectl get namespaces             # List all namespaces
kubectl create namespace <name>    # Create new namespace
kubectl delete namespace <name>    # Delete namespace

📡 Services & Networking
kubectl get svc                    # List services
kubectl describe svc <name>        # Service details
kubectl port-forward <pod> 8080:80 # Forward port from pod to localhost

📜 ConfigMaps & Secrets
kubectl get configmap              # List configmaps
kubectl create configmap my-config --from-literal=key=value
kubectl get secrets                # List secrets
kubectl create secret generic my-secret --from-literal=password=1234

📈 Monitoring & Debugging
kubectl top pod                    # Show resource usage
kubectl top node                   # Show node metrics
kubectl describe node <node>       # Show node-level details
kubectl get events                 # Show recent cluster events

🛠️ Useful Shortcuts
kubectl get all                    # Get all resource types
kubectl get pods -o wide           # Show more pod info (IP, node)
kubectl explain pod                # Show pod schema (great for YAML)

📦 Helm (if using Helm charts)
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install myapp bitnami/nginx   # Install app with Helm
helm list                          # List all Helm releases
helm uninstall myapp               # Remove Helm release

🧹 Clean-up
kubectl delete all --all           # Delete all resources in namespace
kubectl delete pod,svc --all       # Delete all pods and services

📝 Notes
- Use `-n <namespace>` with most commands to target a specific namespace.
- Use `-o yaml` or `-o json` to view output in those formats.
*********************************************************************************888

Terraform Command Line Cheat Sheet 🌍

📦 Getting Started
terraform version                     # Show Terraform version
terraform init                        # Initialize Terraform in current directory
terraform fmt                         # Format Terraform code to canonical style
terraform validate                    # Check whether configuration is valid

📝 Plan & Apply Changes
terraform plan                        # Show changes without applying
terraform apply                       # Apply the Terraform plan
terraform apply -auto-approve         # Apply without confirmation prompt

🔄 Destroy Resources
terraform destroy                     # Destroy all managed infrastructure
terraform destroy -target=<res>       # Destroy a specific resource

📄 Output & State
terraform output                      # Show output variables
terraform output <name>               # Show specific output
terraform state list                  # List all resources in the state
terraform state show <res>            # Show details of a resource in state

📁 Files & Structure
main.tf        # Main configuration
variables.tf   # Variable definitions
outputs.tf     # Output definitions
terraform.tfvars # Values for variables

🔧 Resource Operations
terraform taint <res>                 # Mark resource for recreation
terraform untaint <res>               # Unmark taint
terraform state rm <res>              # Remove resource from state

🔍 Debug & Logging
TF_LOG=DEBUG terraform apply          # Enable detailed logging
TF_LOG_PATH=./log.txt terraform apply # Log to file

🧪 Modules
module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

📦 Providers
provider "aws" {
  region = "us-east-1"
}

🔐 Secrets & Remote State (Best Practices)
- Use environment variables for secrets: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
- Use remote state (S3, GCS, etc.) for team collaboration

🔁 Workspaces
terraform workspace list              # List all workspaces
terraform workspace new dev           # Create new workspace
terraform workspace select dev        # Switch to workspace

📝 Notes
- Always run `terraform init` after modifying providers/modules.
- `terraform plan` helps prevent accidental changes.
- Use version control (git) to manage `.tf` files.


*********************************************************************

Ansible Command Line Cheat Sheet 🤖

📦 Setup & Info
ansible --version                    # Check Ansible version
ansible localhost -m ping            # Test Ansible connection to localhost

📝 Inventory
# Default inventory file: /etc/ansible/hosts
ansible all --list-hosts             # List all hosts in inventory
ansible <group> --list-hosts         # List hosts in a group

🚀 Running Ad-Hoc Commands
ansible all -m ping                  # Ping all hosts
ansible webservers -m shell -a "uptime"  # Run uptime on webservers group
ansible dbservers -m command -a "systemctl status mysql"

📋 Playbooks
ansible-playbook site.yml            # Run playbook file
ansible-playbook playbook.yml -i inventory.ini   # Specify inventory file
ansible-playbook playbook.yml --check   # Dry run (no changes made)
ansible-playbook playbook.yml --diff    # Show diffs of changes

🧩 Modules Commonly Used
- ping: Test connectivity
- shell/command: Run shell commands
- yum/apt: Manage packages
- copy: Copy files
- template: Deploy Jinja2 templates
- service: Manage services

🧑‍💻 Managing Inventory Files
[webservers]
web1.example.com
web2.example.com

[dbservers]
db1.example.com

🔧 Vault (for secrets)
ansible-vault create secrets.yml    # Create encrypted file
ansible-vault edit secrets.yml      # Edit encrypted file
ansible-playbook playbook.yml --ask-vault-pass  # Use vault password

📜 Useful Flags
-v       # Verbose output
-vvv     # More verbose output (debugging)
-l host1 # Limit to specific host(s)
-K       # Prompt for sudo password

📂 Roles & Galaxy
ansible-galaxy init myrole           # Create new role skeleton
ansible-galaxy install geerlingguy.nginx   # Install role from Galaxy

📝 Notes
- Use YAML syntax for playbooks
- Test playbooks with --check first
- Use roles to organize complex playbooks
- Use variables and templates for flexibility


*************************************************************

Jenkins Command Line Cheat Sheet ⚙️

🚀 Basic Jenkins Commands
jenkins --version                     # Check Jenkins version
jenkins start                        # Start Jenkins service
jenkins stop                         # Stop Jenkins service
jenkins restart                      # Restart Jenkins service

🔧 Jenkins CLI (Command Line Interface)
java -jar jenkins-cli.jar -s http://localhost:8080/ help   # Show CLI commands
java -jar jenkins-cli.jar -s http://localhost:8080/ list-jobs  # List all jobs
java -jar jenkins-cli.jar -s http://localhost:8080/ build <jobname>  # Trigger job build
java -jar jenkins-cli.jar -s http://localhost:8080/ get-job <jobname>  # Get job config XML
java -jar jenkins-cli.jar -s http://localhost:8080/ create-job <jobname> < config.xml  # Create new job
java -jar jenkins-cli.jar -s http://localhost:8080/ delete-job <jobname>  # Delete job

📂 Working with Jobs
- Create jobs via Jenkins UI or CLI
- Use Pipeline jobs for scripted CI/CD
- Configure SCM, build triggers, and post-build actions

🛠️ Pipeline Syntax
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}

📊 Useful Plugins
- Git Plugin
- Pipeline Plugin
- Blue Ocean
- Credentials Plugin
- Slack Notification Plugin

🔐 Security
- Manage users and roles in Jenkins security settings
- Use Credentials Plugin to store secrets securely

📋 Common Jenkins Files
- Jenkinsfile: Pipeline definition script
- config.xml: Job configuration file (XML)

🌐 Jenkins Environment Variables & Parameters
- BUILD_NUMBER         # Current build number
- BUILD_ID             # Build identifier
- JOB_NAME             # Name of the job
- WORKSPACE            # Workspace directory for the build
- GIT_COMMIT           # Current Git commit SHA
- GIT_BRANCH           # Git branch name
- BRANCH_NAME          # Branch being built (Multibranch pipeline)
- CHANGE_ID            # Pull request ID (Multibranch)
- NODE_NAME            # Name of the node running the build
- EXECUTOR_NUMBER      # Executor slot number

🎯 Passing Parameters to Jenkins Jobs
- Define parameters in job (String, Boolean, Choice, etc.)
- Access parameters in pipeline:







