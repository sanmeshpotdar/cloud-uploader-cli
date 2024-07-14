# cloud-uploader-cli
Bash-based CLI tool that allows users to quickly upload files to a specified cloud storage solution.

Install AWS CLI:

Ensure AWS CLI is installed on your system. You can install it using pip if you have Python installed:
bash

pip install awscli
Configure AWS CLI:

Configure your AWS CLI with your credentials:
bash

aws configure
AWS Access Key ID, Secret Access Key, Default region name, and Default output format.
Create the Bash Script:

bash script that will handle the file uploads to S3.

Make the Script Executable:

Save the script as upload_to_s3.sh.
Make the script executable:
bash
Copy code
chmod +x upload_to_s3.sh
Using the CLI Tool:

To use the tool, run the script with the required options:
bash
Copy code
./upload_to_s3.sh -b my-bucket -d my-directory myfile.txt
This will upload myfile.txt to the specified S3 bucket and directory.
