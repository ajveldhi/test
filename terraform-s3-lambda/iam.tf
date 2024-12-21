
resource "aws_iam_role" "lambda_role" {
  name = "lambda_s3_readonly_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",

    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_s3_policy" {

  name        = "lambda_s3_readonly_policy"
  description = "Allow Lambda to read s3 objects "

  policy = jsonencode({
    Version = "2012-10-17",

    Statement = [
      {
        Action = ["s3:GetObject", "s3:ListBucket"],
        Effect = "Allow",
        Resource = [
          aws_s3_bucket.lambda_bucket.arn,
          "${aws_s3_bucket.lambda_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_s3_attach" {

  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_s3_policy.arn

}

resource "aws_lambda_permission" "lambda_invoke" {

  statement_id  = "AssumeS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.lambda_bucket.arn
}

