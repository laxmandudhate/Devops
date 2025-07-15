How to Reduce Your GCP Bill
Right-Size Your Resources

Analyze your VM instances, storage, and databases to ensure they are not over-provisioned.

Use smaller machine types or custom machine types that fit your actual workload.

Use Committed Use Discounts (CUDs)

Purchase commitments for 1 or 3 years to get significant discounts on compute resources.

Use Preemptible VMs

These are short-lived VMs offered at a much lower price, suitable for batch jobs or fault-tolerant workloads.

Shut Down Unused Resources

Regularly audit and delete or stop idle instances, unattached disks, and unused IP addresses.

Optimize Storage Costs

Use appropriate storage classes (Nearline, Coldline, Archive) for infrequently accessed data.

Delete obsolete data or move it to cheaper storage.

Use Autoscaling

Configure autoscaling for compute resources to handle load dynamically instead of running large instances 24/7.

Optimize Network Usage

Minimize data egress charges by colocating services in the same region.

Use Cloud CDN to cache content closer to users.

Monitor and Set Budgets/Alerts

Use GCP’s billing reports, cost breakdowns, and set up budget alerts to track and control spending.

Use Serverless Options When Possible

Cloud Functions, Cloud Run, or App Engine can be more cost-effective for certain workloads since you pay only for actual usage.

Leverage Sustained Use Discounts

Automatically applies discounts if you run VMs for a significant portion of the month.



: How do you set up GKE with Fluentd to send logs to Splunk?

A:

Create a GKE cluster on Google Cloud.

Set up Splunk HTTP Event Collector (HEC) and get the token and endpoint URL.

Create a Kubernetes secret in the cluster with the Splunk HEC token.

Deploy Fluentd as a DaemonSet on GKE to collect logs from all nodes.

Configure Fluentd to send logs to Splunk using the HEC token.

Verify logs are reaching Splunk by checking Fluentd pod logs and Splunk dashboard.



Q: What Google Cloud services have you used?

A:

I’ve worked with several key GCP services, including:

GKE (Google Kubernetes Engine) – for container orchestration and application deployment.

Cloud Logging & Monitoring (Stackdriver) – for observability and alerting.

Cloud Storage (GCS) – for storing application data and logs.

Cloud Pub/Sub – for message streaming in microservices.

Cloud Build / Artifact Registry – for CI/CD and managing Docker images.

IAM (Identity & Access Management) – to manage permissions and roles securely.

Cloud Functions / Cloud Run – for serverless compute in lightweight tasks.


 What is Pub/Sub and how does it work?
Google Cloud Pub/Sub is a messaging service used to send and receive messages between independent systems. It helps build loosely coupled, scalable, and event-driven architectures.

🔄 How it works (in simple steps):
Publisher sends messages to a topic.

Pub/Sub stores and delivers the messages.

Subscribers pull or receive messages from the topic.

Once a subscriber acknowledges, the message is marked as delivered.


 Why Google Cloud (GCP):

GKE – Best managed Kubernetes (Google invented Kubernetes).

Global private network – Fast, low-latency infrastructure.

BigQuery – Powerful, serverless data analytics engine.

Automatic sustained-use discounts – No need for reserved instances.

Strong CI/CD tools – Cloud Build, Artifact Registry, Cloud Deploy.

Open-source friendly – Works well with Terraform, Prometheus, etc.

Clean UI & billing – Easier for developers and teams to manage.


