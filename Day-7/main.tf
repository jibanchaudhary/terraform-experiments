provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "<>"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "<>"
      secret_id = "<>"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "<>" 
  name  = "<>" 
}

resource "aws_instance" "example" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"

    tags = {
        secret = data.vault_kv_secret_v2.example.data["<>"]
        # secret = "dev-destroy"
    }
}
