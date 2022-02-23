resource "aws_sns_topic" "sns_topic" {

  tags = {
    yor_trace = "c66fb4ae-d911-4d13-a6bf-96819b2287e2"
  }
}

resource "aws_instance" "some_instance" {

  tags = {
    yor_trace = "c245f668-3ded-4046-a460-5ea1caacd923"
  }
}