variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "project_id" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "node_pools" {
  description = "List of node pool definitions"
  type = list(object({
    name           = string
    machine_type   = string
    node_count     = number
    min_count      = number
    max_count      = number
    service_account = string
    labels         = map(string)
    disk_size_gb   = number
    disk_type      = string
  }))
}

variable "enable_workload_identity" {
  type    = bool
  default = true
}

variable "release_channel" {
  type    = string
  default = "REGULAR"
}