
---

# Terraform EC2 Instance Project

This project demonstrates how to use Terraform to create and destroy an EC2 instance in AWS.
It includes Terraform configuration files, AWS CLI setup steps, and the required workflow for applying and destroying infrastructure.

This README also contains placeholders where you can upload the required screenshots.

---

## 1. Project Structure

The project contains the following Terraform files:

* `main.tf` – main Terraform configuration (provider and EC2 resource)
* `variables.tf` – definitions for variables used in the configuration
* `outputs.tf` – details printed after successful creation of the instance
* `terraform.tfvars` – actual values for AMI ID, instance name, instance type, and region
* `.gitignore` – prevents Terraform-generated files from being committed

---

## 2. What This Terraform Project Does

This Terraform configuration:

1. Connects to AWS using your configured credentials
2. Creates a single EC2 instance in the **ap-south-1 (Mumbai)** region
3. Uses an **Ubuntu 22.04 LTS** AMI
4. Uses a **free-tier eligible instance type**
5. Tags the instance with a Name value
6. Outputs:

   * Instance ID
   * Public IP
   * Availability Zone
7. Destroys the instance when finished

---

## 3. Prerequisites

Before running Terraform, ensure the following are installed and configured:

### Required:

1. **AWS Account**
2. **IAM User with programmatic access**

   * Recommended permissions:

     * `AmazonEC2FullAccess` (or similar)
3. **Access Key ID and Secret Access Key**
4. **Terraform installed**

   * The binary added to system PATH
5. **AWS CLI installed**

   * Also added to PATH
6. **Git Bash or a terminal**

---

## 4. Configure AWS CLI

Run the following command:

```bash
aws configure
```

Enter values when asked:

* AWS Access Key ID: insert access key
* AWS Secret Access Key: inserted secret access key
* Default region:

  ```
  ap-south-1
  ```
* Default output format:

  ```
  json
  ```

To test your credentials:

```bash
aws sts get-caller-identity
```

You should see your AWS account details.

---

## 5. Terraform Files Overview

### `main.tf`

Defines the AWS provider and the EC2 instance resource.

### `variables.tf`

Defines variables such as AMI ID, region, instance type, and instance name.

### `outputs.tf`

Prints instance information after creation.

### `terraform.tfvars`

Stores actual values used for the instance.

---

## 6. How to Use Terraform Step-by-Step

Run all commands from your project folder:

```bash
cd ~/OneDrive/Documents/terraform-task
```

---

### Step 1: Initialize Terraform

This downloads the AWS provider and prepares the working directory.

```bash
terraform init
```

---

### Step 2: Preview the Changes Using Terraform Plan

```bash
terraform plan
```

Terraform will display what it intends to create.

<img width="1834" height="231" alt="TF1" src="https://github.com/user-attachments/assets/299550d2-ec63-4ce8-bb4e-2b18904908b6" />


---

### Step 3: Apply the Configuration and Create the EC2 Instance

```bash
terraform apply
```

Terraform will ask:

```
Do you want to perform these actions?
Enter a value:
```

Type:

```
yes
```

After a few seconds you will see output similar to:

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:
Image pasted
```

<img width="1836" height="736" alt="TF2" src="https://github.com/user-attachments/assets/752c7932-e79d-46d7-9279-d43d2b880949" />


---

### Step 4: Verify the Running Instance in AWS Console

1. Open AWS Console
2. Go to EC2 → Instances
3. Set region to **ap-south-1**
4. Find your instance in Running state
5. Confirm:

   * Name tag
   * Instance ID
   * Instance type
   * Availability Zone
   * Public IP

<img width="1912" height="1018" alt="TF3" src="https://github.com/user-attachments/assets/028a3178-86a8-49ba-bb01-c89af4ad1a54" />


---

### Step 5: Destroy the EC2 Instance

When you are done:

```bash
terraform destroy
```

Terraform will ask:

```
Do you really want to destroy all resources?
Enter a value:
```

Type:

```
yes
```

You should see:

```
Destroy complete! Resources: 1 destroyed.
```
<img width="1583" height="823" alt="Screenshot 2025-12-05 141608" src="https://github.com/user-attachments/assets/d0003a75-ab0d-4629-ba85-b72cb41eeef5" />


---

## 7. Common Issues and Fixes

### 1. Invalid AMI ID

Make sure the AMI ID exists in the selected region.

### 2. Instance type not eligible for free tier

Use `t3.micro` or another free-tier type allowed by your account.

### 3. Resource shows as terminated immediately

Usually caused by:

* Wrong instance type
* Wrong AMI architecture
* AWS capacity error

Update values in `terraform.tfvars` accordingly.

### 4. Accidentally committing `.terraform` folder

Use `.gitignore` to prevent this.

---

## 8. Conclusion

This Terraform project demonstrates:

* How to deploy an EC2 instance using infrastructure-as-code
* How to control AWS resources through Terraform workflows
* How to safely create and destroy cloud infrastructure

You now have a working example of a full Terraform workflow including initialization, planning, applying, verifying, and destroying an EC2 instance.

---

