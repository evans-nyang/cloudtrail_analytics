# CloudTrail and CloudWatch Logs with S3 and IAM Role

This CloudFormation template deploys the necessary resources for logging AWS API activity with CloudTrail, storing logs in S3, and enabling CloudWatch Logs for centralized logging.

## Services Deployed

- Amazon S3 bucket for storing CloudTrail logs
- AWS CloudTrail trail with the following configuration:
  - Logs all regions
  - Includes global service events
  - Logs to the S3 bucket created in this stack
  - Validates log file integrity
  - Configures CloudWatch Logs to receive CloudTrail logs
  - Uses an IAM role for CloudTrail to access the S3 bucket and CloudWatch Logs
- CloudWatch Logs log group for storing CloudTrail logs
- IAM role for CloudTrail with the following permissions:
  - Read and write access to the S3 bucket
  - Read and write access to the CloudWatch Logs log group

## How to Deploy

1. Download the `cloudtrail_analytics.yml` file from this repository
2. In the AWS Management Console, navigate to CloudFormation
3. Click "Create Stack"
4. Select "Upload a template file"
5. Click "Choose file" and select the `cloudtrail_analytics.yml` file you downloaded in step 1
6. Click "Next"
7. Enter a name for your stack and any other required parameters
8. Click "Next"
9. Review the stack details and click "Create stack"

## Diagram

![CloudTrail Analytics](https://github.com/evans-nyang/cloudtrail_analytics/blob/main/images/cloudtrail_analytics-designer.png?raw=true)

This diagram shows the following components:

- CloudTrail Trail: logs AWS API activity and sends the logs to CloudWatch Logs and S3.
- CloudWatch Logs Log Group: stores the CloudTrail logs received from CloudTrail.
- S3 Bucket: stores the CloudTrail logs received from CloudTrail.
- IAM Role for CloudTrail: provides permissions for CloudTrail to access resources such as S3 and CloudWatch Logs.
