# Deploy Hello World Using Lambda Function [![Pipeline Status](https://github.com/devops-terraform-aws/lambda/actions/workflows/pipeline.yml/badge.svg)](https://github.com/devops-terraform-aws/lambda/actions/workflows/pipeline.yml)

### Terraform Virtual Environment Configuration - WSL-Ubuntu (Optional)
- Configure virtual environment on `Ubuntu WSL`

```
sudo apt update && sudo apt upgrade -y
sudo ln -sf $(which python3) /usr/bin/python && sudo apt install python3-venv -y && sudo apt install unzip -y
python -m venv venv && source venv/bin/activate
```

- Terraform Installation
    - Run the `install-terraform.sh` script
    ```
    ./scripts/install-terraform.sh 
    ```
    - Reload the virtual environment to ensure you have the latest terraform version
    ```
    source venv/bin/activate
    ```


## Deploy Application to AWS
- Verify `terraform` installation by running
```
terraform --version
```

### AWS Credentials Setup (Optional)
```
sudo apt install awscli -y
```
```
aws --version
```