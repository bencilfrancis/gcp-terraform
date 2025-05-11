module "demo_vm" {
    source = "../../modules/compute_engine"
    name = var.name
    machine_type = var.machine_type
    zone = var.zone
    disk_type = var.disk_type
    image = var.image
    cost_center = var.cost_center
    tags = var.tags
    network = var.network
    subnetwork = var.subnetwork
    
}