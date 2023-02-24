terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "asherl"

    workspaces {
      name = "asherl-aws-k8s"
    }
  }
}