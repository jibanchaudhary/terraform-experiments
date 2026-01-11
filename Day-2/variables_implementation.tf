# Define an input variable for the EC2 instance instance_type

provider "aws"{
    region = "us-east-1"
}

variable "instance_type"{
    description = "EC2 instance type"
    type        = string
    default     = "t3.micro"
}

variable "ami_id"{
    description = "EC2 AMI ID"
    type = string
}

resource "aws_instance" "example"{
    ami = var.ami_id
    instance_type = var .instance_type
    tags = {
        Name = "First_EC2"
    }
}


# Define an output variable to expose the public IP address of the ec2 instance
output "public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.example.public_ip
}