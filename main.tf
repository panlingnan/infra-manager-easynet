terraform {
  required_providers {
    volcenginecc = {
      source = "volcengine/volcenginecc"
    }
  }
}

provider "volcenginecc" {
  endpoints = {
    cloudcontrolapi = var.cloudcontrolapi_endpoint
  }
  region = var.region
}

variable "cloudcontrolapi_endpoint" {
  type        = string
  description = "Volcengine Cloud Control API 域名"
  default     = "open.stable.volcengineapi-test.com"
}

variable "region" {
  type        = string
  description = "Volcengine 区域"
  default     = "cn-guilin-boe"
}

variable "vpc_id" {
  type        = string
  description = "子网所属 VPC ID"
  default     = "vpc-2d65j3301rg1s58ozfer0ix1b"
}

variable "zone_id" {
  type        = string
  description = "子网所在可用区"
  default     = "cn-guilin-a"
}

variable "subnet_name" {
  type        = string
  description = "子网名称"
  default     = "subnet2323232"
}

variable "description" {
  type        = string
  description = "子网描述"
  default     = "subnet2232323 description"
}

variable "cidr_block" {
  type        = string
  description = "子网 CIDR 段"
  default     = "192.168.0.0/2"
}

variable "tags" {
  type = list(object({
    key   = string
    value = string
  }))
  description = "子网标签"
  default = [
    {
      key   = "env"
      value = "test"
    }
  ]
}

resource "volcenginecc_vpc_subnet" "SubnetDemo" {
  vpc_id      = var.vpc_id
  zone_id     = var.zone_id
  subnet_name = var.subnet_name
  description = var.description
  cidr_block  = var.cidr_block
  tags        = var.tags
}
