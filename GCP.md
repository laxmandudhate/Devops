## Q: How do you set up GKE with Fluentd to send logs to Splunk?

**A:**

1. Create a GKE cluster on Google Cloud.
2. Set up Splunk HTTP Event Collector (HEC) and get the token and endpoint URL.
3. Create a Kubernetes secret in the cluster with the Splunk HEC token.
4. Deploy Fluentd as a DaemonSet on GKE to collect logs from all nodes.
5. Configure Fluentd to send logs to Splunk using the HEC token.
6. Verify logs are reaching Splunk by checking Fluentd pod logs and Splunk dashboard.

---

## Q: What Google Cloud services have you used?

**A:**

I’ve worked with several key GCP services, including:

- **GKE (Google Kubernetes Engine):** For container orchestration and application deployment.
- **Cloud Logging & Monitoring (Stackdriver):** For observability and alerting.
- **Cloud Storage (GCS):** For storing application data and logs.
- **Cloud Pub/Sub:** For message streaming in microservices.
- **Cloud Build / Artifact Registry:** For CI/CD and managing Docker images.
- **IAM (Identity & Access Management):** To manage permissions and roles securely.
- **Cloud Functions / Cloud Run:** For serverless compute in lightweight tasks.

---

## Q: What is Pub/Sub and how does it work?

**A:**

Google Cloud Pub/Sub is a messaging service used to send and receive messages between independent systems. It helps build loosely coupled, scalable, and event-driven architectures.

**How it works (in simple steps):**
1. Publisher sends messages to a topic.
2. Pub/Sub stores and delivers the messages.
3. Subscribers pull or receive messages from the topic.
4. Once a subscriber acknowledges, the message is marked as delivered.

---

## Q: Why Google Cloud (GCP)?

**A:**

- **GKE:** Best managed Kubernetes (Google invented Kubernetes).
- **Global private network:** Fast, low-latency infrastructure.
- **BigQuery:** Powerful, serverless data analytics engine.
- **Automatic sustained-use discounts:** No need for reserved instances.
- **Strong CI/CD tools:** Cloud Build, Artifact Registry, Cloud Deploy.
- **Open-source friendly:** Works well with Terraform, Prometheus, etc.
- **Clean UI & billing:** Easier for developers and teams to manage.

---

## Q: What is Google Cloud Armor?

**A:**

Google Cloud Armor is a security service to protect your applications from DDoS attacks, web attacks, and malicious traffic.

- Works with Google Cloud Load Balancers.
- Helps create rules to allow, deny, or rate-limit traffic based on IPs, geography, or other criteria.

**How to set up Google Cloud Armor (Steps):**
1. Enable Cloud Armor API in your GCP project.
2. Go to Google Cloud Console > Security > Cloud Armor.
3. Click "Create Security Policy."
4. Add rules to allow or block traffic (e.g., block IPs, allow certain countries).
5. Attach the policy to your HTTP(S) Load Balancer backend service.
6. Save and deploy.
7. Monitor using Cloud Logging and Cloud Monitoring.
