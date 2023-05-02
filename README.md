AWS CloudTrail Logging Solution
This CloudFormation template sets up a CloudTrail Trail to log and monitor AWS API activity, and stores the logs in an S3 bucket. The CloudFormation template creates an S3 bucket, a CloudTrail Trail, a CloudWatch Logs Log Group, and an IAM Role for CloudTrail to access resources.

Prerequisites
Before deploying this CloudFormation stack, you need:

An AWS account with permissions to create CloudFormation stacks, S3 buckets, CloudTrail Trails, CloudWatch Logs, and IAM Roles.
Basic knowledge of CloudFormation, AWS CloudTrail, AWS S3, CloudWatch Logs, and IAM.
A local environment with AWS CLI and AWS SAM CLI installed.
Deployment
To deploy this CloudFormation stack, follow these steps:

Clone the repository to your local environment.
Change to the cloned directory: cd aws-cloudtrail-logging-solution.
Create an S3 bucket to store the CloudFormation deployment package: aws s3 mb s3://<your-bucket-name>.
Package the CloudFormation template and upload it to the S3 bucket: aws cloudformation package --template-file cloudtrail.yaml --s3-bucket <your-bucket-name> --output-template-file packaged.yaml.
Deploy the CloudFormation stack: aws cloudformation deploy --stack-name <your-stack-name> --template-file packaged.yaml --capabilities CAPABILITY_IAM.
Wait for the CloudFormation stack to complete the deployment.
Stack Outputs
After the CloudFormation stack is deployed, it creates the following resources:

S3Bucket: The name of the S3 bucket that stores the CloudTrail logs.
CloudTrailTrail: The ARN of the CloudTrail Trail.
CloudTrailLogGroup: The ARN of the CloudWatch Logs Log Group.
CloudTrailLogRole: The ARN of the IAM Role for CloudTrail.
Removal
To remove the CloudFormation stack, run the following command: aws cloudformation delete-stack --stack-name <your-stack-name>. This will delete all resources created by the stack.

License
This code is licensed under the MIT License. See the LICENSE file for more information.

Credits
This CloudFormation template was created by evans-nyang. If you have any feedback or suggestions, please submit an issue or pull request.
