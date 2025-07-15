Apache Server Cheat Sheet
📦 Installation
Ubuntu/Debian:

bash
sudo apt update
sudo apt install apache2
CentOS/RHEL:

bash
sudo yum install httpd
🔄 Service Management
Ubuntu:

bash
# Start
sudo systemctl start apache2
# Stop
sudo systemctl stop apache2
# Restart
sudo systemctl restart apache2
# Status
sudo systemctl status apache2
# Enable
sudo systemctl enable apache2
CentOS:

bash
sudo systemctl start httpd
sudo systemctl stop httpd
sudo systemctl restart httpd
sudo systemctl status httpd
sudo systemctl enable httpd
🛠️ Configuration Files
Main config: /etc/apache2/apache2.conf or /etc/httpd/conf/httpd.conf
Sites-available: /etc/apache2/sites-available/
Sites-enabled: /etc/apache2/sites-enabled/
Document root: /var/www/html
🏠 Virtual Hosts Template
ApacheConf
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

bash
sudo a2ensite example.conf
sudo systemctl reload apache2
🔍 Modules & Testing (Ubuntu)
bash
# List modules
apache2ctl -M
# Enable module
sudo a2enmod rewrite
# Disable module
sudo a2dismod rewrite
# Test configuration
apache2ctl configtest
🔐 Security Tips
bash
# Disable directory listing
Options -Indexes

# Set permissions
sudo chown -R www-data:www-data /var/www/example
sudo chmod -R 755 /var/www/example
📈 Logs
Access log: /var/log/apache2/access.log
Error log: /var/log/apache2/error.log
Live log:
bash
sudo tail -f /var/log/apache2/error.log
🔐 Enable HTTPS (Let's Encrypt)
bash
sudo apt install certbot python3-certbot-apache
sudo certbot --apache
Linux Command Line Cheat Sheet
📁 File & Directory Operations
bash
ls                  # List files
ls -l /path         # Long listing format
cd /path            # Change directory
pwd                 # Print current directory
mkdir new_dir       # Create directory
rm file.txt         # Delete file
rm -r folder/       # Delete directory
cp file1 file2      # Copy file
mv old new          # Rename or move file
touch file.txt      # Create empty file
cat file.txt        # View file content
🔍 Searching & Finding
bash
find / -name filename         # Find file by name
find . -type f -name "*.log"  # Find all .log files
grep "error" file.txt         # Search text in file
grep -r "search" /dir         # Recursive search
📄 Viewing & Monitoring Files
bash
head -n 10 file.txt           # First 10 lines
tail -n 20 file.txt           # Last 20 lines
tail -f /var/log/syslog       # Live log monitoring
less file.txt                 # Scrollable viewer
⚙️ Permissions & Ownership
bash
chmod 755 file                # Set permissions
chown user:user file          # Change owner
ls -l                         # View permissions
🧠 Process Management
bash
ps aux                        # List processes
top                           # Live process monitor
htop                          # Enhanced top (if installed)
kill <PID>                    # Kill process by PID
kill -9 <PID>                 # Force kill
pkill process_name            # Kill by name
🛠️ System Info & Resources
bash
uname -a                      # Kernel and system info
df -h                         # Disk usage
du -sh /folder                # Folder size
free -h                       # Memory usage
uptime                        # System load & uptime
who                           # Who is logged in
📦 Package Management
Debian/Ubuntu:

bash
sudo apt update
sudo apt upgrade
sudo apt install nginx
sudo apt remove nginx
RHEL/CentOS:

bash
sudo yum install nginx
sudo yum remove nginx
📂 Tar, Zip, and Compression
bash
tar -czf file.tar.gz folder/    # Compress folder
tar -xzf file.tar.gz            # Extract
zip -r file.zip folder/         # Zip folder
unzip file.zip                  # Unzip file
🌐 Networking
bash
ping google.com               # Check connectivity
curl http://example.com       # Fetch URL
wget http://example.com       # Download file
ifconfig / ip addr            # Network interfaces
netstat -tuln                 # Listening ports
ss -tuln                      # Replacement for netstat
🔐 User Management
bash
adduser newuser
passwd newuser
deluser olduser
usermod -aG sudo user         # Add to sudo group
📦 System Services (Systemd)
bash
systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable nginx        # Start on boot
Docker Cheat Sheet
🔧 Basic Docker Commands
bash
docker --version                  # Check Docker version
docker info                       # Display system-wide information
docker help                       # Show all Docker commands
📦 Working with Images
bash
docker pull <image>              # Download image from Docker Hub
docker images                    # List all local images
docker rmi <image>               # Remove an image
docker build -t name .           # Build image from Dockerfile
🐳 Working with Containers
bash
docker run <image>                        # Run container from image
docker run -it <image> bash               # Run container with interactive shell
docker run -d -p 8080:80 <image>          # Run in detached mode and map ports
docker start <container_id>               # Start stopped container
docker stop <container_id>                # Stop running container
docker restart <container_id>             # Restart a container
docker rm <container_id>                  # Remove a container
docker exec -it <container_id> bash       # Execute command in running container
📂 Volumes and Data
bash
docker volume create myvol                # Create volume
docker volume ls                          # List volumes
docker run -v myvol:/data <image>         # Mount volume into container
docker inspect <container_id>             # Inspect container settings
🌐 Networking
bash
docker network ls                         # List networks
docker network create mynet               # Create new network
docker run --network=mynet <image>        # Connect container to network
📋 Container Logs & Monitoring
bash
docker logs <container_id>                # View container logs
docker top <container_id>                 # Show running processes
docker stats                              # Show container resource usage
🔄 Docker Compose
bash
docker-compose up                         # Start services in background
docker-compose up --build                 # Rebuild and start services
docker-compose down                       # Stop and remove containers/networks
🧹 Cleanup Commands
bash
docker container prune                    # Remove all stopped containers
docker image prune                        # Remove unused images
docker volume prune                       # Remove unused volumes
docker system prune                       # Remove all unused data
🛠️ Dockerfile Example
Dockerfile
FROM ubuntu
RUN apt update && apt install -y nginx
COPY . /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
📝 Notes
Use -it for interactive mode
Use -d for detached/background mode
Use -p to map host to container ports (e.g. -p 8080:80)
Use --name to name your container
Kubernetes Command Line Cheat Sheet 🧠
🔍 Cluster Info & Context
bash
kubectl cluster-info
kubectl config view
kubectl config use-context <ctx>
kubectl get nodes
📦 Working with Pods
bash
kubectl get pods
kubectl get pods -n kube-system
kubectl describe pod <pod>
kubectl logs <pod>
kubectl logs <pod> -f
kubectl exec -it <pod> -- bash
🛠️ Create / Apply Resources
bash
kubectl apply -f file.yaml
kubectl create -f file.yaml
kubectl delete -f file.yaml
💥 Pod Management
bash
kubectl delete pod <pod>
kubectl delete pod --all
kubectl run nginx --image=nginx
kubectl expose pod nginx --port=80 --type=NodePort
📁 Deployment Management
bash
kubectl get deployments
kubectl describe deployment <name>
kubectl rollout status deployment/<name>
kubectl rollout undo deployment/<name>
🔄 Scaling
bash
kubectl scale deployment <name> --replicas=3
📂 Namespaces
bash
kubectl get namespaces
kubectl create namespace <name>
kubectl delete namespace <name>
📡 Services & Networking
bash
kubectl get svc
kubectl describe svc <name>
kubectl port-forward <pod> 8080:80
📜 ConfigMaps & Secrets
bash
kubectl get configmap
kubectl create configmap my-config --from-literal=key=value
kubectl get secrets
kubectl create secret generic my-secret --from-literal=password=1234
📈 Monitoring & Debugging
bash
kubectl top pod
kubectl top node
kubectl describe node <node>
kubectl get events
🛠️ Useful Shortcuts
bash
kubectl get all
kubectl get pods -o wide
kubectl explain pod
📦 Helm (if using Helm charts)
bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install myapp bitnami/nginx
helm list
helm uninstall myapp
🧹 Clean-up
bash
kubectl delete all --all
kubectl delete pod,svc --all
📝 Notes
Use -n <namespace> with most commands to target a specific namespace.
Use -o yaml or -o json to view output in those formats.
Terraform Command Line Cheat Sheet 🌍
📦 Getting Started
bash
terraform version
terraform init
terraform fmt
terraform validate
📝 Plan & Apply Changes
bash
terraform plan
terraform apply
terraform apply -auto-approve
🔄 Destroy Resources
bash
terraform destroy
terraform destroy -target=<res>
📄 Output & State
bash
terraform output
terraform output <name>
terraform state list
terraform state show <res>
📁 Files & Structure
Text
main.tf            # Main configuration
variables.tf       # Variable definitions
outputs.tf         # Output definitions
terraform.tfvars   # Values for variables
🔧 Resource Operations
bash
terraform taint <res>
terraform untaint <res>
terraform state rm <res>
🔍 Debug & Logging
bash
TF_LOG=DEBUG terraform apply
TF_LOG_PATH=./log.txt terraform apply
🧪 Modules
HCL
module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
}
📦 Providers
HCL
provider "aws" {
  region = "us-east-1"
}
🔐 Secrets & Remote State (Best Practices)
Use environment variables for secrets:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
Use remote state (S3, GCS, etc.) for team collaboration
🔁 Workspaces
bash
terraform workspace list
terraform workspace new dev
terraform workspace select dev
📝 Notes
Always run terraform init after modifying providers/modules.
terraform plan helps prevent accidental changes.
Use version control (git) to manage .tf files.
Ansible Command Line Cheat Sheet 🤖
📦 Setup & Info
bash
ansible --version
ansible localhost -m ping
📝 Inventory
bash
# Default inventory file: /etc/ansible/hosts
ansible all --list-hosts
ansible <group> --list-hosts
🚀 Running Ad-Hoc Commands
bash
ansible all -m ping
ansible webservers -m shell -a "uptime"
ansible dbservers -m command -a "systemctl status mysql"
📋 Playbooks
bash
ansible-playbook site.yml
ansible-playbook playbook.yml -i inventory.ini
ansible-playbook playbook.yml --check
ansible-playbook playbook.yml --diff
🧩 Modules Commonly Used
ping: Test connectivity
shell/command: Run shell commands
yum/apt: Manage packages
copy: Copy files
template: Deploy Jinja2 templates
service: Manage services
🧑‍💻 Managing Inventory Files
INI
[webservers]
web1.example.com
web2.example.com

[dbservers]
db1.example.com
🔧 Vault (for secrets)
bash
ansible-vault create secrets.yml
ansible-vault edit secrets.yml
ansible-playbook playbook.yml --ask-vault-pass
📜 Useful Flags
bash
-v       # Verbose output
-vvv     # More verbose output (debugging)
-l host1 # Limit to specific host(s)
-K       # Prompt for sudo password
📂 Roles & Galaxy
bash
ansible-galaxy init myrole
ansible-galaxy install geerlingguy.nginx
📝 Notes
Use YAML syntax for playbooks
Test playbooks with --check first
Use roles to organize complex playbooks
Use variables and templates for flexibility
Jenkins Command Line Cheat Sheet ⚙️
🚀 Basic Jenkins Commands
bash
jenkins --version
jenkins start
jenkins stop
jenkins restart
🔧 Jenkins CLI (Command Line Interface)
bash
java -jar jenkins-cli.jar -s http://localhost:8080/ help
java -jar jenkins-cli.jar -s http://localhost:8080/ list-jobs
java -jar jenkins-cli.jar -s http://localhost:8080/ build <jobname>
java -jar jenkins-cli.jar -s http://localhost:8080/ get-job <jobname>
java -jar jenkins-cli.jar -s http://localhost:8080/ create-job <jobname> < config.xml
java -jar jenkins-cli.jar -s http://localhost:8080/ delete-job <jobname>
📂 Working with Jobs
Create jobs via Jenkins UI or CLI
Use Pipeline jobs for scripted CI/CD
Configure SCM, build triggers, and post-build actions
🛠️ Pipeline Syntax
Groovy
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
Git Plugin
Pipeline Plugin
Blue Ocean
Credentials Plugin
Slack Notification Plugin
🔐 Security
Manage users and roles in Jenkins security settings
Use Credentials Plugin to store secrets securely
📋 Common Jenkins Files
Jenkinsfile: Pipeline definition script
config.xml: Job configuration file (XML)
🌐 Jenkins Environment Variables & Parameters
BUILD_NUMBER # Current build number
BUILD_ID # Build identifier
JOB_NAME # Name of the job
WORKSPACE # Workspace directory for the build
GIT_COMMIT # Current Git commit SHA
GIT_BRANCH # Git branch name
BRANCH_NAME # Branch being built (Multibranch pipeline)
CHANGE_ID # Pull request ID (Multibranch)
NODE_NAME # Name of the node running the build
EXECUTOR_NUMBER # Executor slot number
🎯 Passing Parameters to Jenkins Jobs
Define parameters in job (String, Boolean, Choice, etc.)
Access parameters in pipeline:
Let me know if you want any section separated or highlighted differently!

You said: how to add this in my respo
how to add this in my respo
Copilot said: To add the file sheet.md from https://github.com/laxmandudhate/Devops/blob/main/sheet.md
To add the file sheet.md from https://github.com/laxmandudhate/Devops/blob/main/sheet.md to your own repository, follow these steps:

