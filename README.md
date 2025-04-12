# Cloud Computing Assignment
**GCP Setup with Auto-Scaling & Security**

## Introduction
This assignment outlines the process of setting up a Virtual Machine (VM) in Google Cloud Platform (GCP), implementing auto-scaling, and applying security measures such as IAM roles and firewall rules. I also tested auto-scaling by generating CPU load and observed dynamic instance creation and deletion.

## Creating a Virtual Machine (VM)
To begin, I created a virtual machine in GCP:
- **Name:** cloud-assignment-02
- **Region:** asia-south1-c
- **Machine Type:** E2
- **Boot Disk:** Ubuntu 20.04 LTS
- **Networking:** Allowed HTTP & HTTPS traffic

## Configuring Auto-Scaling

### 1. Creating an Instance Template
- Navigate to **Compute Engine > Instance Templates**.
- Clicked **"Create Instance Template"**, and configured it similarly to my VM.
- Saved the template.

### 2. Creating a Managed Instance Group (MIG)
- Navigate to **Compute Engine > Instance Groups**.
- Created a **Managed Instance Group**, attached the instance template, and set auto-scaling:
  - Scale based on CPU utilization.
  - Target CPU usage: **60%**.
  - Minimum instances: **1**, Maximum instances: **5**.

## Configuring Security

### 1. Setting Up Firewall Rules
- Created a new firewall rule under **VPC Network > Firewall**.
- Allowed incoming HTTP & HTTPS traffic on ports 80 and 443.

### 2. Setting IAM Roles for Restricted Access
- Navigated to **IAM & Admin > IAM**.
- Assigned the following roles:
  - **Compute Viewer** (read-only access).
  - **Compute Admin** (full control).

### Example: Giving read access to another user.

## Testing Auto-Scaling
- Went to **Compute Engine > Instance Groups**, selected an instance, and clicked **SSH**.
- Installed the **stress** tool:
  ```bash
  sudo apt update
  sudo apt install stress -y
  ```
- Simulated high CPU load:
  ```bash
  stress --cpu 4 --timeout 300
  ```
- **Auto-Scaling Observations:**
  - New instances were created as CPU usage increased.
  - Instances were removed after 5 minutes as CPU usage dropped.
