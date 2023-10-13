# create my buckets manually 
resource "aws_s3_bucket" "s3" {
  bucket = "aelion-terraform-2310-eu-central-01"

  tags = {
    Name        = "My S3 bucket ${var.some_override != "" ?  var.some_override : "empty"}"
    Environment = var.env_name
  }
}

# or create them dynamically
resource "aws_s3_bucket" "s3_dyn" {
  count = length(var.buckets)
  bucket = var.buckets[count.index].bucket_name

  tags = {
    Name        = var.buckets[count.index].tag_name
    Environment = var.buckets[count.index].env_name
  }
}
