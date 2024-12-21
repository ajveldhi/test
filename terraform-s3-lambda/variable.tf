
variable "bucket_name" {
  description = "the name of s3 bucket "
  default     = "mys3forlambda11223344"
}

variable "lambda_function_name" {
  description = "lambda function name "
  default     = "s3_object_trigger_function"
}

