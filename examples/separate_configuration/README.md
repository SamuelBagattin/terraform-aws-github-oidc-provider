# Separated configuration
This example show how the OIDC provider and the IAM roles can be created separately :
1. Creates the OIDC provider
2. Stores the ARN of the OIDC provider in an SSM parameter
3. Retrieves the ARN of the OIDC provider from the SSM parameter in another root module
4. Creates the IAM role and attaches it to the OIDC provider