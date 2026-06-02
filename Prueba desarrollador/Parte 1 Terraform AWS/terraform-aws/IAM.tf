resource "aws_iam_role" "role" {
  name = "s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}


resource "aws_iam_policy" "policy" {
  name = "s3-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:List*",
          "s3:GetBucketLocation",
          "s3:CreateBucket",
          "s3:DeleteBucket",
          "s3:PutBucketTagging"
        ]
        Resource = "*"
      },
      {
        Effect = "Deny"
        Action = "s3:GetObject"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}