# DevSecOps Security Pipeline

## Project Overview

This project demonstrates how security testing can be integrated into a Continuous Integration and Continuous Delivery (CI/CD) workflow using GitHub Actions and Trivy.

The pipeline automates Python unit testing and security scanning to identify vulnerable dependencies, infrastructure misconfigurations, and exposed secrets.

The objective is to demonstrate a shift-left security approach by identifying security issues earlier in the development lifecycle.

## Project Objectives

- Automate security scanning through GitHub Actions.
- Identify vulnerable software dependencies.
- Detect insecure Terraform configurations.
- Identify exposed credentials and secrets.
- Run automated Python unit tests.
- Generate security evidence and document remediation.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| GitHub Actions | CI/CD automation |
| Trivy | Vulnerability, misconfiguration and secret scanning |
| Python | Application and unit testing |
| Terraform | Infrastructure-as-Code security testing |
| Git | Version control |

## Project Structure

```text
DevSecOps-Security-Pipeline/
├── .github/
│   └── workflows/
│       └── security-pipeline.yml
├── evidence/
│   ├── trivy-final-security-scan.json
│   ├── trivy-final-security-scan.txt
│   ├── trivy-secure-terraform-scan.txt
│   └── Terraform scan reports
├── src/
│   └── app.py
├── tests/
│   └── test_app.py
├── terraform/
│   └── insecure.tf
├── secret_test.py
├── requirements.txt
├── .trivyignore
└── .gitignore
```

## Security Controls Implemented

### 1. Dependency Vulnerability Scanning

Trivy scans the project's dependency manifest to identify known vulnerabilities.

The dependency manifest currently specifies:

- requests: 2.32.4

### 2. Infrastructure-as-Code Scanning

Terraform configurations are scanned for security misconfigurations.

The testing process includes identifying insecure configurations and applying security controls such as:

- S3 public access blocking.
- Server-side encryption.
- AWS KMS key rotation.

### 3. Secret Detection

Trivy's secret scanner was tested using a synthetic GitHub Personal Access Token pattern.

The scanner successfully identified the test token. The test string was subsequently removed from the application source.

No real credentials were used.

### 4. Automated Python Testing

Python unit tests validate the application's password assessment function.

Run the tests locally:

```bash
python -m unittest discover -s tests -v
```

### 5. GitHub Actions Automation

The GitHub Actions workflow is configured to:

1. Check out the repository.
2. Set up Python 3.12.
3. Run Python unit tests.
4. Run Trivy vulnerability, misconfiguration and secret scans.

The workflow runs on pushes and pull requests targeting the `main` branch, and supports manual execution.

## Security Testing Results

| Test | Current result |
|---|---|
| Python unit tests | Passed locally |
| Trivy dependency scan | No HIGH/CRITICAL findings reported |
| Terraform security scan | 0 HIGH/CRITICAL misconfigurations |
| Secret detection | Synthetic token successfully detected |
| Remediated secret test | No finding after removal |
| GitHub Actions execution | Pending remote validation |

## Evidence

Security scan reports are stored in the `evidence/` directory.

These include:

- Trivy final JSON report.
- Trivy final text report.
- Terraform security scan reports.
- Before-and-after security testing evidence.

## Important Notes

This is a controlled cybersecurity portfolio lab.

No AWS infrastructure is deployed by this project. Terraform configurations are used for local security analysis only.

The results demonstrate the configured scanner checks and do not represent a guarantee that the application is free from all security vulnerabilities.

## Skills Demonstrated

- DevSecOps fundamentals.
- CI/CD security automation.
- Infrastructure-as-Code security.
- Vulnerability management.
- Secret detection.
- Python unit testing.
- Security documentation.
- Git and GitHub workflows.

## Project Status

Local testing and security scanning have been completed. GitHub Actions execution and remote pipeline validation are pending.

---

**Author:** Daliso  
**Focus:** Cybersecurity | DevSecOps | Cloud Security | Security Automation