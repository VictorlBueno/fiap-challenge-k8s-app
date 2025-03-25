resource "aws_vpc" "eks_vpc" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = var.cidr_block

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-vpc"
    }
  )
}