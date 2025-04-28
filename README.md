# Azure Terraform Infrastructure with CI/CD and Security Scanning

## Introduction
This project automates the deployment of infrastructure on **Azure** using **Terraform** and integrates with **Azure DevOps pipelines** for **CI/CD**. The pipeline includes steps for **Terraform initialization**, **validation**, **planning**, and **security scanning** using **tfsec**.

## Project Workflow
1. **Terraform Init, Validate, Plan**:
   - Initializes the Terraform working directory.
   - Validates the Terraform configuration.
   - Prepares a plan to show what changes will be made to the infrastructure.

2. **tfsec Security Scanning**:
   - Uses **tfsec** to scan the Terraform code for potential security vulnerabilities.
   - The scan results are generated as an HTML report.

3. **Artifact Publishing**:
   - After the scan, the **tfsec** HTML report is published as a build artifact for further analysis.

## CI/CD Pipeline Overview
The pipeline is divided into two main jobs:
1. **Terraform_Init_Validate_Plan**:
   - This job runs Terraform's init, validate, and plan commands.
   - It ensures that the Terraform configuration is valid and the proposed changes to infrastructure are as expected.

2. **tfsec_Security_Scanning**:
   - This job installs **tfsec** and runs a security scan on the Terraform code to check for common vulnerabilities.
   - The results are published as an artifact for future reference.

## Requirements
Before using this pipeline, you must have the following:
- **Azure Subscription** for deploying infrastructure.
- **Azure DevOps Account** for running the pipeline.
- **Terraform** installed and configured.
- **tfsec** (Security scanner for Terraform code) integrated into the pipeline.

## Setup and Configuration

### Azure DevOps Pipeline Setup
1. Create a **self-hosted agent pool** for the pipeline to run on.
2. Set up the pipeline YAML file as described below to automate the Terraform deployment and security scanning process.

### Variables and Secrets
You need to define these variables in the Azure DevOps pipeline:
- **ARM_CLIENT_ID**: The client ID of your Azure Service Principal.
- **ARM_CLIENT_SECRET**: The client secret of your Azure Service Principal.
- **ARM_SUBSCRIPTION_ID**: The Azure subscription ID where resources will be deployed.
- **ARM_TENANT_ID**: The tenant ID for Azure authentication.

### Terraform Backend Configuration
Ensure your **Terraform backend** is configured correctly for **state management**:
```yaml
backendServiceArm: 'Azure subscription 1(9117002a-2308-428d-993b-9f46dfdfd10c)'
backendAzureRmResourceGroupName: 'infra-rg'
backendAzureRmStorageAccountName: 'mystorageaccount199546'
backendAzureRmContainerName: 'mycontainer'
backendAzureRmKey: 'terraform.tfstate'
