# call domain modules which handle users
module "users" {
  source = "./modules/iam_users"
  user_names = ["aelion2310.01", "aelion2310.02", "aelion2310.03", "aelion2310.04"]
}

# use module to create buckets instead
module "s3" {
  source = "./modules/s3_instances"
  buckets = [
    {
      bucket_name = "aelion-terraform-2310-dynbucket1-${var.env_name}"
      tag_name = "My S3 dyn bucket 1"
      env_name = var.env_name
    },
    {
      bucket_name = "aelion-terraform-2310-dynbucket2-${var.env_name}"
      tag_name = "My S3 bucket 2"
      env_name = var.env_name
    }
  ]
}

module "s3_website" {
  source = "./modules/s3_website"
  region = var.aws_region
  bucket_name = "aelionmystaticwebsite2312nb"
} 

# Use outputs from the users_iam module
output "website_from_module_manual_url" {
  value = module.s3_website.website_url_manual
}
output "website_from_module_dyn_url" {
  value = module.s3_website.website_url
}

