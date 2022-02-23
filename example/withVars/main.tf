
resource "aws_security_group_rule" "my-rule" {
  type        = "ingress"
  cidr_blocks = var.cidr_blocks
}

resource "aws_alb_listener" "my-alb-listener" {
  port     = "80"
  protocol = "HTTP"
  tags = {
    yor_trace = "b05e5cbb-7b05-4188-b5c5-fc6c16acbbb4"
  }
}

resource "aws_db_security_group" "my-group" {

  tags = {
    yor_trace = "8a7598c0-9aa5-4eb1-addf-6ee68fb80419"
  }
}

resource "azurerm_managed_disk" "source" {
  encryption_settings {
    enabled = var.enableEncryption
  }
  tags = {
    yor_trace = "fe88803b-4d61-48bb-976b-be656adbbe37"
  }
}

resource "aws_api_gateway_domain_name" "missing_security_policy" {
  tags = {
    yor_trace = "a2766131-d5bf-4bb9-a9f7-909236834200"
  }
}

resource "aws_api_gateway_domain_name" "empty_security_policy" {
  security_policy = ""
  tags = {
    yor_trace = "40d1ba56-2043-4edb-bae2-ac6c24ac7836"
  }
}

resource "aws_api_gateway_domain_name" "outdated_security_policy" {
  security_policy = "TLS_1_0"
  tags = {
    yor_trace = "3d018a65-57f2-47e6-a737-186619af5323"
  }
}

resource "aws_api_gateway_domain_name" "valid_security_policy" {
  security_policy = "TLS_1_2"
  tags = {
    yor_trace = "3c95f1ad-aef5-48f3-bdc1-00e754df29fb"
  }
}
