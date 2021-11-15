data "aws_s3_bucket" "codedeploy" {
  bucket = "codedeploy.csye7200.xyz"
}

resource "aws_iam_policy" "CodeDeploy-EC2-S3" {
  name        = "CodeDeploy-EC2-S3"
  path        = "/"
  description = "CodeDeploy-EC2-S3"

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        "Action" : [
          "s3:Get*",
          "s3:List*"
        ],
        "Effect" : "Allow",
        "Resource" : ["arn:aws:s3:::${data.aws_s3_bucket.codedeploy.bucket}", "arn:aws:s3:::${data.aws_s3_bucket.codedeploy.bucket}/*"]
      }
    ]
  })
}
