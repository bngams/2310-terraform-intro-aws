# call domain modules which handle users
module "users_iam" {
  source = "./modules/users_iam"
}


# test bucket manually
resource "aws_s3_bucket" "example" {
  bucket = "aelion-terraform-2310-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# use modue to create buckets instead
module "s3" {
  source = "./modules/storage_instances"
  
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
