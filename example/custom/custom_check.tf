resource "aws_instance" "non_compliant" {
  ami           = "ami-1234"
  instance_type = "t2.small"

  tags = {
    Department = "Finance"
    yor_trace  = "e0cc7cdc-9695-4077-9aac-5daa817265c4"
  }

}

resource "aws_instance" "compliant" {
  ami            = "ami-12345"
  instance_type  = "t2.small"
  cpu_core_count = 4

  tags = {
    Department = "Finance"
    CostCentre = "CC1234"
    yor_trace  = "bccc9041-5287-4155-b951-7556b349b12e"
  }
}

resource "aws_s3_bucket" "unversioned_bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
  tags = {
    yor_trace = "08b0fbce-9439-4108-b516-e14c5f4b5f77"
  }
}

resource "aws_s3_bucket" "versioned_bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
  tags = {
    yor_trace = "e932dec9-a026-4928-b969-e06d27d346d6"
  }
}

resource "aws_s3_bucket" "disabled_versioned_bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
  tags = {
    yor_trace = "06dd838a-a542-4110-abfa-09681f66cb54"
  }
}

module "custom_bucket" {
  source      = "./modules/public_custom_bucket"
  bucket_name = "new-public-bucket"
  acl         = "private"
}

resource "aws_s3_bucket" "bucket_with_public_acl" {
  bucket = "my-tf-test-bucket"
  //  acl    = "public-read"
  //
  versioning {
    enabled = true
  }
  tags = {
    yor_trace = "aebb5b6d-a64d-4da4-824f-a035e2d9feaf"
  }
}