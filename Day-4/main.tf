provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "jiban" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "jiban-s3-demo"
    force_destroy = true
}

# resource "aws_dynamodb_table" "terraform_lock" {
#     name = "terraform-lock"
#     billing_mode = "PAY_PER_REQUEST"
#     hash_key = "LockID"

#     attribute {
#       name = "LockID"
#       type = "S"
#     }
# }