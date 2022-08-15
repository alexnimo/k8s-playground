module "internet_gateway" {
  source             = "./modules/internet_gateway"
  vpc_id             = module.vpc.aws_vpc_id
  tags               = var.user_name
}
module "nat_gateway" {
  source             = "./modules/nat_gateway"
  subnet_id          = module.vpc.aws_subnet_public_cidrs_az
  tags               = var.user_name
}
module "vpc" {
  source               = "./modules/vpc"
  az_count_private     = var.az_count_private
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  name                 = var.user_name
  region               = var.region
  aws_azs              = var.aws_azs
  vpc_cidr_base        = var.vpc_cidr_base
  az_count_public      = var.az_count_public
  gateway_id           = module.internet_gateway.aws_internet_gateway_id
  nat_gateway_id       = module.nat_gateway.aws_nat_gateway_id
  tags                 = var.user_name
}
module "eks" {
  source             = "./modules/eks"
  subnet_ids         = module.vpc.aws_subnet_private_cidrs_az
  aws_vpc_cidr       = module.vpc.aws_vpc_cidr
  vpc_id             = module.vpc.aws_vpc_id
  ami_type           = var.ami_type 
  instance_types     = var.instance_types 
  capacity_type      = var.capacity_type 
  region             = var.region
  tags               = var.user_name
}
/*module "ec2_env_access" {
  source                 = "./modules/ec2_env_access"
  cluster_name_var       = module.eks.eks_cluster_name
  public_subnet          = module.vpc.aws_subnet_public_cidrs_az
  wait_before_deploy     = module.cilium.wait_before_deploy
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = module.eks.cluster_certificate_authority_data
  region_var             = var.region
  vpc_id                 = module.vpc.aws_vpc_id
  node_iam_role_arn      = module.eks.iam_role_NodeGroupRole_arn
  tags                   = var.user_name
  ami                    = var.ami
  instance_type          = var.instance_type
  ec2_password_var       = var.ec2_password_var
}*/
module "cilium" {
  source             = "./modules/kubernetes_resources/cilium"
  depends_on         = [module.eks]
}
module "kyverno" {
  kyverno            = var.kyverno
  source             = "./modules/kubernetes_resources/kyverno"
  depends_on         = [module.cilium]
}
module "metrics_server" {
  metrics_server     = var.metrics_server
  source             = "./modules/kubernetes_resources/metrics_server"
  depends_on         = [module.cilium]
}
module "argocd_application" {
  argocd             = var.argocd
  source             = "./modules/kubernetes_resources/argocd_application"
  depends_on         = [module.cilium]
  argocd_password    = module.vpc.argocd_password
  subnets            = module.vpc.aws_subnet_private_cidrs_az
  tags               = var.user_name
  vpc_id             = module.vpc.aws_vpc_id
  cluster_name       = module.eks.eks_cluster_name
}
