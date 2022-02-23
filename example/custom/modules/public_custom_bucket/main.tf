resource "aws_s3_bucket" "custom_module_bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  versioning {
    enabled = true
  }
  tags = {
    yor_trace = "0fb34223-a450-41b2-be1b-34e6b275a551"
  }
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

variable "acl" {
  type        = string
  description = "The acl to use"
}