resource "aws_instance" "bastion" {
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }

  tags = {
    Environment = "test"
    yor_trace   = "b9ccf3dd-2ca4-418b-a1b1-3bfc8d084cb4"
  }
}


resource "aws_s3_bucket" "disabled_versioned_bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    "CostCentre" : "CD0012"
    yor_trace = "188089f7-4d19-4c7e-84be-4153300c3bbe"
  }
}
