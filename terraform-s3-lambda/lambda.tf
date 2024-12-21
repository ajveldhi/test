
resource "aws_lambda_function" "s3_lambda" {

  function_name = var.lambda_function_name
  runtime       = "python3.9"
  handler       = "lambda_handeler.lambda_handeler"
  filename      = data.archive_file.lambda_zip.output_path

  role = aws_iam_role.lambda_role.arn

}

