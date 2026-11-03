# DevSecOps Security Pipeline

## Project Overview

This project demonstrates how security testing can be integrated into a Continuous Integration and Continuous Delivery (CI/CD) workflow using GitHub Actions, Trivy, Python, and Terraform.

The pipeline automates Python unit testing and security scanning to identify vulnerable dependencies, infrastructure misconfigurations, and exposed secrets.

The project applies the **Shift-Left Security** approach by integrating security checks early into the software development lifecycle rather than waiting until deployment.

## Project Objectives

- Automate security scanning through GitHub Actions.
- Identify vulnerable software dependencies.
- Detect insecure Terraform configurations.
- Identify exposed credentials and secrets.
- Execute automated Python unit tests.
- Document security findings, remediation, and testing evidence.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| GitHub Actions | CI/CD automation |
| Trivy | Vulnerability, misconfiguration, and secret scanning |
| Python 3.12 | Application logic and unit testing |
| Terraform | Infrastructure-as-Code security testing |
| Git and GitHub | Version control and project hosting |

## Project Structure

```text
DevSecOps-Security-Pipeline/
├── .github/
│   └── workflows/
│       └── security-pipeline.yml
├── evidence/
│   ├── github-actions-success.png
│   ├── python-tests-passed.png
│   ├── trivy-github-scan.png
│   ├── trivy-final-security-scan.json
│   ├── trivy-final-security-scan.txt
│   ├── trivy-secure-terraform-scan.txt
│   └── trivy insecure terraform scan.txt
├── src/
│   └── app.py
├── tests/
│   └── test_app.py
├── terraform/
│   └── insecure.tf
├── requirements.txt
├── .trivyignore
├── .gitignore
└── README.md
```

## Security Controls Implemented

### 1. Dependency Vulnerability Scanning

Trivy scans the project's dependency manifest to identify known vulnerabilities in third-party software packages.

The project uses a dependency manifest containing the specified Python package requirements.

The scan is configured to report HIGH and CRITICAL severity findings.

### 2. Infrastructure-as-Code Security Scanning

Terraform configurations are scanned for infrastructure security misconfigurations.

The testing process covers security controls including:

- S3 public access blocking.
- Server-side encryption.
- AWS KMS encryption key rotation.

An insecure configuration was used during testing to demonstrate security findings and remediation. The final Terraform fixture contains the remediated configuration.

### 3. Secret Detection

Trivy's secret scanner was tested using a synthetic GitHub Personal Access Token pattern.

The scanner successfully identified the test token as a security finding. The synthetic test string was subsequently removed from the application source.

No real credentials were used.

### 4. Automated Python Unit Testing

The project includes a Python password assessment function with automated unit tests.

The tests validate:

- Short passwords are classified as weak.
- Alphabetic-only passwords are classified as moderate.
- Mixed-character passwords are classified as strong.

Run the tests locally:

```bash
python -m unittest discover -s tests -v
```

All three unit tests passed locally and were executed successfully through GitHub Actions.

### 5. GitHub Actions Security Automation

The GitHub Actions workflow automates the security testing process whenever changes are pushed to the `master` branch or a pull request targets that branch.

The workflow performs the following operations:

1. Checks out the repository.
2. Sets up Python 3.12.
3. Runs automated Python unit tests.
4. Executes Trivy vulnerability scanning.
5. Checks Terraform configurations for security misconfigurations.
6. Scans files for exposed secrets.

The workflow uses the Trivy GitHub Action pinned to version `v0.36.0`.

The pipeline is configured to fail when HIGH or CRITICAL findings are detected.

## Security Testing Results

| Test | Result |
|---|---|
| Python unit tests | 3 tests passed |
| Trivy dependency scan | No HIGH/CRITICAL findings reported |
| Terraform security scan | 0 HIGH/CRITICAL misconfigurations |
| Synthetic secret detection | Test token successfully detected |
| Secret removal verification | No finding after removal |
| GitHub Actions execution | Successfully passed |
| Remote pipeline validation | Successfully completed |

*Results reflect the configured scans and test cases; they do not establish that the entire project is free from all possible vulnerabilities.*

## Evidence and Documentation

The `evidence/` directory contains supporting documentation and screenshots from the security testing process.

Key evidence includes:

- `github-actions-success.png` — successful GitHub Actions workflow execution.
- `python-tests-passed.png` — automated Python unit test results.
- `trivy-github-scan.png` — Trivy security scan output from GitHub Actions.
- `trivy-final-security-scan.json` — machine-readable Trivy scan report.
- `trivy-final-security-scan.txt` — readable Trivy scan report.
- `trivy-secure-terraform-scan.txt` — Terraform security scan evidence.
- `trivy insecure terraform scan.txt` — historical evidence of the initial insecure configuration findings.

## Important Notes

This project is a controlled cybersecurity portfolio lab.

No AWS infrastructure was deployed as part of this project. Terraform configurations were used for local security analysis only.

The project demonstrates the use of automated security tools and CI/CD security controls. Passing scans do not guarantee that an application or infrastructure configuration is completely secure.

## Skills Demonstrated

- DevSecOps fundamentals.
- CI/CD security automation.
- GitHub Actions workflow configuration.
- Infrastructure-as-Code security.
- Vulnerability management.
- Secret detection.
- Python unit testing.
- Security testing and remediation.
- Git and GitHub version control.
- Technical security documentation.

## Project Status

**Completed — GitHub Actions security pipeline successfully executed and validated.**

Local testing, automated Python unit testing, and Trivy security scanning were completed. The remote GitHub Actions workflow successfully executed using the pinned Trivy Action version `v0.36.0`.

---

**Author:** Daliso  
**Focus:** Cybersecurity | DevSecOps | Cloud Security | Security Automation