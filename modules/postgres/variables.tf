variable "container_name" {
    type = string
    default = "postgres"
}

variable "network_name" {
  type        = string
  description = "Docker network to attach Postgres to"
}

variable "db_name" {
  type        = string
  description = "Name of the database"
}

variable "db_user" {
  type        = string
  description = "Postgres user"
}

variable "db_password" {
  type        = string
  description = "Postgres password"
  sensitive   = true
}