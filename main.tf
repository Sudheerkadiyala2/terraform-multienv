provider "aws"  {
    region="us-east-1"
}

module "web" {
    source = "./modules/ec2-web"
    env=var.env
    vpc_cidr =var.vpc_cidr
    subnet_cidr=var.subnet_cidr
    ami_id=var.ami_id
    instance_type=var.instance_type
}
