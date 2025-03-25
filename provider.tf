terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
  }
  backend "s3" {
    bucket = "fiap-challenge-remote-terraform"
    key    = "app/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = var.KUBE_HOST
  cluster_ca_certificate = base64decode(var.KUBE_CA_CERT)
  token                  = var.KUBE_TOKEN
}

provider "helm" {
  kubernetes {
    host                   = var.KUBE_HOST
    cluster_ca_certificate = base64decode(var.KUBE_CA_CERT)
    token                  = var.KUBE_TOKEN
  }
}
