resource "google_compute_instance" "demoinstance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  boot_disk {
    initialize_params {
      image = var.image
      type  = var.disk_type
      labels = {
        cost_center = var.cost_center
      }
    }
  }
  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }
}


