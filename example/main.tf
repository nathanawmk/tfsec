
resource "aws_security_group_rule" "my-rule" {
  type        = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_alb_listener" "my-alb-listener" {
  port     = "80"
  protocol = "HTTP"
  tags = {
    yor_trace = "847ebde0-a174-434b-ad79-441592d01c0e"
  }
}

resource "aws_db_security_group" "my-group" {

  tags = {
    yor_trace = "cc18a9db-da0f-415d-ad40-55c68147700b"
  }
}

resource "aws_instance" "bad_user_data" {
  user_data = <<EOF
DB_PASSWORD = "Some passwprkd"
EOF
  tags = {
    yor_trace = "bbc45fc3-4f2a-4269-abac-2533832e24bb"
  }
}

variable "enableEncryption" {
  default = false
}

resource "azurerm_managed_disk" "source" {
  encryption_settings {
    enabled = var.enableEncryption
  }
  tags = {
    yor_trace = "eac0c045-0fb5-4e18-bb57-48fc2a94e378"
  }
}

resource "aws_api_gateway_domain_name" "missing_security_policy" {
  tags = {
    yor_trace = "9d18dc1e-758e-4256-9b94-db702e46c0ad"
  }
}

resource "aws_api_gateway_domain_name" "empty_security_policy" {
  security_policy = ""
  tags = {
    yor_trace = "7259db22-a1a7-40c0-b41d-5d6ca496bd19"
  }
}

resource "aws_api_gateway_domain_name" "outdated_security_policy" {
  security_policy = "TLS_1_0"
  tags = {
    yor_trace = "29f644bd-45e6-4749-997a-6cec865726cd"
  }
}

resource "aws_api_gateway_domain_name" "valid_security_policy" {
  security_policy = "TLS_1_2"
  tags = {
    yor_trace = "f18b708d-a534-4b37-89d7-dbab0459898a"
  }
}

resource "aws_dynamodb_table" "bad_example" {
  name             = "example"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }
  tags = {
    yor_trace = "596033ea-0918-4ae7-83dc-9c88d5e6a4bd"
  }
}
