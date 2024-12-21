output "aws_s3_bucket_name" {
  description = "s3_bucket_name"
  value       = aws_s3_bucket.lambda_bucket.bucket

}

output "lambda_function_arn" {
  description = "lambda function arn "
  value       = aws_lambda_function.s3_lambda.arn
}

  