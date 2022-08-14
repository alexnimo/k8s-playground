resource "kubernetes_config_map" "aws_auth" {
   count       = 1
   depends_on  = [ aws_iam_role.role ]

   metadata  {
       name      = "aws-auth"
       namespace = "kube-system"
   }

   data      = {
       mapRoles    = yamlencode(local.aws_auth_roles)
   }


   lifecycle { 
       create_before_destroy = false
       ignore_changes        = all
   }
}

locals {
  aws_auth_roles = concat(
    [
      {
        rolearn  = var.node_iam_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"
        groups   = ["system:bootstrappers", "system:nodes"]
      },
      {
        rolearn  = aws_iam_role.role.arn
        username = aws_iam_role.role.name
        groups   = ["system:masters"]
      },
    ],
  )
}
