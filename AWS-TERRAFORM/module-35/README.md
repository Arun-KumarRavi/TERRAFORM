# Topic 35: Best Practices - The `backend.tf` File

## Why a separate `backend.tf`?
In earlier modules, we put the `backend` configuration inside `main.tf`. However, as your projects grow, it is a **Best Practice** to separate your configuration into logical files:
- `main.tf`: Core infrastructure.
- `variables.tf`: Inputs.
- `output.tf`: Outputs.
- **`backend.tf`**: Where the state is stored.
- `provider.tf`: AWS/Azure/GCP setup.

## Learning Guide: Why this matters
Separating the backend config makes it easier to:
1. **Audit Security**: You can quickly see where the state is stored without scrolling through hundreds of lines of code.
2. **Reusable Code**: You can copy your `main.tf` logic to another project but swap out the `backend.tf` to point to a different S3 bucket.

## How it Works
Terraform simply merges all `.tf` files in a directory when it runs. It doesn't care if the code is in 1 file or 10. By putting the `backend` block in its own file, we are organizing for *humans*, not for the computer.

```hcl
terraform {
  backend "s3" {
    bucket = "my-company-terraform-states"
    key    = "production/network/terraform.tfstate"
    region = "us-east-1"
  }
}
```

## Hands-on Tutorial

1. **Observe**: Look at the file list in this directory. Notice how small and clean each file is.
2. **Initialize**: Run `terraform init`.
3. **The Result**: Terraform automatically reads `backend.tf`, connects to S3, and downloads the state.

## Key Takeaways
- **Key naming**: The `key` should ideally match your folder structure (e.g., `prod/vpc/terraform.tfstate`).
- **One Backend**: You can only have **one** backend block per folder.

> [!TIP]
> Always check `backend.tf` before running `apply` to make sure you aren't accidentally overwriting the state of a different environment!
