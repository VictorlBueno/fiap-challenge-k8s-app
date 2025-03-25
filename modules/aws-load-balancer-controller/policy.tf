resource "aws_iam_policy" "eks_load_balancer_controller" {
  name   = "${var.project_name}-aws-load-balancer-controller"
  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}