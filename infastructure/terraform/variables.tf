variable "client_id" {
  type        = string
  description = "The name of the client id"
}
variable "client_secret" {
  type        = string
  description = "The value of the client secret"
}
variable "tenant_id" {
  type        = string
  description = "The name of the tenant id"
}
variable "subscription_id" {
  type        = string
  description = "The name of the subscription id"
}

variable "environment" {
  default = "dev"
}

variable "location" {
  description = "The location to deploy resources to."
}
