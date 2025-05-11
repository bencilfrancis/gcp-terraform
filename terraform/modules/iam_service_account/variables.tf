variable "account_id" {
  description = "Service account ID"
  type        = string
}

variable "display_name" {
  description = "Name for the service account"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "iam_roles" {
  description = "List of IAM roles to bind to the service account"
  type        = list(string)
}
