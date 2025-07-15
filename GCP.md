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
