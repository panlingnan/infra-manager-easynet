terraform {
  required_providers {
    volcenginecc = {
      source  = "volcengine/volcenginecc"
      version = "~> 0.0.49"
      endpoint = "open.stable.volcengineapi-test.com"
      region = "cn-guilin-boe"
    }
  }
}
resource "volcenginecc_iam_user" "UserDemo" {
  user_name   = "UserDemo"
  description = "user description"
  groups = [
    "UserGroupDemo"
  ]
  policies = [
    {
      policy_name = "TOSReadOnlyAccess"
      policy_type = "System"
    }
  ]
  tags = [
    {
      key   = "env"
      value = "test"
    }
  ]
}