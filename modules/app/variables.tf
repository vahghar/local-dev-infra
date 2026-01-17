variable "container_name" {
    type = string
}

variable "network_name" {
  type        = string
  description = "Docker network to attach the app to"
}

# ---- Postgres connection ----

variable "db_host" {
  type        = string
  description = "Postgres hostname"
}

variable "db_port" {
  type        = number
  description = "Postgres port"
}

variable "db_name" {
  type        = string
  description = "Postgres database name"
}

variable "db_user" {
  type        = string
  description = "Postgres username"
}

variable "db_password" {
  type        = string
  description = "Postgres password"
  sensitive   = true
}

# ---- Redis connection ----

variable "redis_host" {
  type        = string
  description = "Redis hostname"
}

variable "redis_port" {
  type        = number
  description = "Redis port"
}

variable "project_name" {
  type        = string
}
