provider "aws" {
        region = "us-east-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_id = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"
}