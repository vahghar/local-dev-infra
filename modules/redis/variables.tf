variable "network_name" {
  type        = string
  description = "Docker network to attach Redis to"
}

variable "container_name" {
  type    = string
  default = "localredis"
}
