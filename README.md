# 3-Tier Multi-Region High Availability Infrastructure with AWS and Terraform

## Overview

This project implements a production-ready 3-tier multi-region infrastructure using AWS and Terraform. The architecture ensures high availability and fault tolerance by distributing traffic across multiple AWS regions. The infrastructure includes:

- Web Tier: Elastic Load Balancer (ELB) to distribute traffic across application instances.
- Application Tier: EC2 instances running the application, managed by Auto Scaling Groups.
- Database Tier: Multi-region RDS database with read replicas for cross-region failover.

## Project Structure
```
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
├── terraform.tfvars
├── modules/
│ ├── vpc/
│ ├── elb/
│ ├── ec2/
│ ├── rds/
│ └── route53/
└── envs/
└── dev/
```

## Prerequisites

- Terraform v0.13.0 or later
- AWS CLI configured with appropriate credentials
- S3 bucket for storing Terraform state (update `backend.tf` with your bucket name)
- DynamoDB table for state locking (update `backend.tf` with your table name)

## Usage

1. Clone this repository
2. Navigate to the `envs/dev` directory
3. Update `terraform.tfvars` with your desired values
4. Initialize Terraform:
    ```
    terraform init
    ```

5. Review the plan:
    ```
    terraform plan
    ```

6. Apply the changes:
    ```
    terraform apply
    ```

## Modules

### VPC

Creates a VPC with public and private subnets across multiple availability zones.

### ELB (Elastic Load Balancer)

Deploys an Application Load Balancer in public subnets to handle incoming web traffic.

### EC2

Manages EC2 instances in private subnets, including Auto Scaling Groups for the application tier.

### RDS

Deploys a primary RDS instance with cross-region read replicas to ensure database failover.

### Route53

Configures Route53 to manage DNS and failover routing between regions.

## Configuration

Main configuration variables are set in `envs/dev/terraform.tfvars`. Key variables include:

- `primary_region`: Primary AWS region (e.g., "us-east-1")
- `secondary_region`: Secondary AWS region for failover (e.g., "us-west-2")
- `vpc_cidr_primary`: CIDR block for the primary VPC
- `vpc_cidr_secondary`: CIDR block for the secondary VPC
- `instance_type`: EC2 instance type for the application servers
- `db_name`: Name of the database to be created
- `db_username`: Master username for the database
- `db_password`: Master password for the database (use AWS Secrets Manager in production)
- `domain_name`: Domain name for Route53 configuration

## Security Considerations

- Ensure all sensitive data (like database passwords) are stored securely, preferably using AWS Secrets Manager.
- Review and adjust security group rules to follow the principle of least privilege.
- Enable encryption for data at rest and in transit.
- Regularly update and patch EC2 instances and RDS.

## Monitoring and Logging

- Set up CloudWatch alarms for key metrics across all services.
- Enable CloudTrail for AWS API call logging.
- Configure VPC Flow Logs to monitor network traffic.

## Backup and Disaster Recovery

- RDS is configured with automated backups and multi-region replication.
- Consider implementing S3 cross-region replication for any static assets.
- Regularly test failover procedures to ensure business continuity.

## Cost Optimization

- Use Reserved Instances or Savings Plans for predictable workloads.
- Implement auto-scaling policies to match capacity with demand.
- Regularly review and optimize resource utilization.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

