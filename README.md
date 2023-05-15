# AWS EC2 Instance Provisioning with User Data

This Terraform code provisions an AWS EC2 instance with user data execution. It creates an EC2 instance, assigns security groups, tags, and provisions the instance using a user data script. The user data script is uploaded to the instance using SSH and executed remotely. Finally, it saves the public IP of the provisioned instance to a local file named "ip.txt".

## Prerequisites

- Terraform installed on your machine
- AWS account credentials configured

## Getting Started

1. Clone the repository to your local machine.

```
git clone https://github.com/your-username/your-repository.git
```

2. Navigate to the project directory.

```
cd your-repository
```

3. Update the necessary variables in the Terraform code, such as AMI, instance type, key name, security group IDs, and tags.

4. Initialize the Terraform configuration.

```
terraform init
```

5. Preview the changes that Terraform will make.

```
terraform plan
```

6. Apply the Terraform configuration to provision the EC2 instance.

```
terraform apply
```

7. Once the provisioning is complete, the public IP of the provisioned instance will be saved to a file named "ip.txt" in the project directory.

# Cleaning Up
To clean up and destroy the provisioned resources, run the following command:

```
terraform destroy
```

This will remove the EC2 instance and any associated resources.



