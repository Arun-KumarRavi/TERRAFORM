# Topic 19: Project - S3 Static Website Hosting

## What is S3 Static Website Hosting?
Amazon S3 can host static websites (HTML, CSS, JS, Images) without needing a web server like Apache or Nginx. It is extremely cheap, scales automatically, and is highly available.

## Why use S3 for Websites?
- **Zero Maintenance**: No servers to patch or manage.
- **Cost**: You only pay for the storage and data transfer (usually cents per month).
- **Performance**: Can be easily integrated with Amazon CloudFront for global delivery.

## Learning Guide: Building the Project

This project combines several AWS resources to make a website public:

### 1. The Bucket (`aws_s3_bucket`)
Creates the container for our website files.

### 2. Public Access (`aws_s3_bucket_public_access_block`)
By default, S3 buckets are private. We must explicitly disable the "Block Public Access" settings to allow the internet to see our site.

### 3. Policy (`aws_s3_bucket_policy`)
We add a JSON policy that says: "Allow anyone (`*`) to perform the `s3:GetObject` action on any file in this bucket."

### 4. Website Configuration (`aws_s3_bucket_website_configuration`)
Tells S3 which file is the home page (usually `index.html`) and which file to show if there's an error.

### 5. File Upload (`aws_s3_object`)
Uploads your local `index.html` file into the S3 bucket automatically.

## How it Works (Logic Flow)
1. Create Bucket.
2. Open Public Access.
3. Apply "Read-Only" Policy.
4. Enable Website Hosting.
5. Upload `index.html`.

## Hands-on Tutorial

1. **Prepare**: Ensure you have an `index.html` file inside a folder named `website/` in this directory.
2. **Initialize**: `terraform init`
3. **Apply**: `terraform apply`
4. **Visit your Site**:
   - Terraform will output the `website_url`.
   - Copy and paste it into your browser.
   - You should see your live website!

## Key Takeaways
- **Depends On**: We use `depends_on` in the code to ensure the policy is applied *after* public access is enabled, and the file is uploaded *after* the policy is ready.
- **Index vs Error**: Use `index.html` for the home page. In Single Page Apps (React/Vue), the error document is also often set to `index.html`.

> [!TIP]
> To use a custom domain (like `www.myapp.com`), you would pair this with **Amazon Route 53**.
