
data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }
}

output "all_subnets" {
  value = data.aws_subnets.vpc_subnets.ids
}

