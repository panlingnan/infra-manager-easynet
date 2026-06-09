terraform {
  required_providers {
    volcenginecc = {
      source  = "volcengine/volcenginecc"
      version = "~> 0.0.1-beta"
    }
  }
}
resource "volcenginecc_vpc_subnet" "SubnetDemo" {
  vpc_id      = "vpc-2bytdc3ac6z282dx0eg69pwdo"
  zone_id     = "cn-guilin-a"
  subnet_name = "subnet123"
  description = "subnet123 description"
  cidr_block  = "192.168.0.0/25"
  tags = [
    {
      key   = "env"
      value = "test"
    }
  ]
}