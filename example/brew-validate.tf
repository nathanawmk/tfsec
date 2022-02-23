resource "aws_alb_listener" "my-alb-listener" {
  port     = "443"
  protocol = "HTTPS"
  tags = {
    yor_trace = "2f1ba980-a381-4c59-a4a9-5c6721bf3abf"
  }
}
