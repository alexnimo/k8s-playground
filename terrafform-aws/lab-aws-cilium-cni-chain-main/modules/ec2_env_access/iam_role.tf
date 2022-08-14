resource "aws_iam_policy" "policy" {
  name        = "Policy-${var.tags}"
  path        = "/"
  description = "Provides EKS Management ${var.tags}"

  policy = <<EOT
{
    "Statement": [
        {
            "Action": [
                "eks:ListNodegroups",
                "eks:UntagResource",
                "eks:ListTagsForResource",
                "eks:ListAddons",
                "eks:DescribeAddon",
                "eks:ListFargateProfiles",
                "eks:DescribeNodegroup",
                "eks:ListUpdates",
                "eks:DescribeUpdate",
                "eks:TagResource",
                "eks:AccessKubernetesApi",
                "eks:DescribeCluster",
                "eks:ListIdentityProviderConfigs"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "VisualEditor0"
        },
        {
            "Action": [
                "eks:ListClusters",
                "eks:DescribeAddonVersions"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "VisualEditor1"
        }
    ],
    "Version": "2012-10-17"
}
EOT
  
}
resource "aws_iam_role" "role" {
  name = "EKS-MGMT-Role-${var.tags}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    role = "${var.tags}"
  }
}
resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
resource "aws_iam_instance_profile" "ec2_vnc_profile" {
  name = "Profile-${var.tags}"
  role = aws_iam_role.role.name
}
