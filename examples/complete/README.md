# Complete example
This example will create the following IAM resources/configurations for the `my-org` GitHub organisation :
- `githubActions-default-role` IAM role scoped to :
  - `another-repository` from the `main` branches
  - `third-repository` from the `my-branch`and `my-other-branch` branches
- `my-role` IAM role scoped to : 
  - `my-repository` from the `main` branch
- `global-role` IAM role scoped to :
  - ANY repository from any branch that begins with `feature/*`