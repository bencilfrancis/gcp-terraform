variable "name" {
    description = "The name of the compute engine instance"
    type = string
}

variable "machine_type" {
    description = "The machine type for compute engine"
    type = string
}

variable "zone" {
    description = "The zone for compute engine instance"
    type = string
}

variable "image" {
    description = "The image for compute engine instance"
    type = string
}

variable "disk_type" {
    description = "Boot disk type"
    type = string
    default = "pd-balanced"
}

variable "cost_center" {
    description = "Label to tag the instance with a cost center."
    type = string 
    default = "123"
}

variable "tags" {
    description = "A list of network tags to attach to the instance."
    type = list(string)
    default = []
}

variable "network" {
    description = "The VPC network name to attach the instance"
    type = string
}

variable "subnetwork" {
    description = "The subnetwork name to attach the instance"
    type = string
}

variable "metadata" {
    description = "Metadata key/value pairs to make available to the instance."
    type = map(string)
    default = {}
}
