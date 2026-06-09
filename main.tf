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
  default     = "volcengineapi-boe-stable.byted.org"
}

variable "region" {
  type        = string
  description = "Volcengine 区域"
  default     = "cn-guilin-boe"
}

variable "user_name" {
  type        = string
  description = "IAM 用户名称"
  default     = "UserDemo"
}

variable "description" {
  type        = string
  description = "IAM 用户描述"
  default     = "user description"
}

variable "groups" {
  type        = list(string)
  description = "IAM 用户所属用户组"
  default     = ["UserGroupDemo"]
}

variable "policies" {
  type = list(object({
    policy_name = string
    policy_type = string
  }))
  description = "IAM 用户绑定的策略列表"
  default = [
    {
      policy_name = "TOSReadOnlyAccess"
      policy_type = "System"
    }
  ]
}

variable "tags" {
  type = list(object({
    key   = string
    value = string
  }))
  description = "IAM 用户标签"
  default = [
    {
      key   = "env"
      value = "test"
    }
  ]
}

resource "volcenginecc_iam_user" "UserDemo" {
  user_name   = var.user_name
  description = var.description
  groups      = var.groups
  policies    = var.policies
  tags        = var.tags
}
