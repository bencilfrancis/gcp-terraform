resource "google_container_cluster" "gke" {
  name               = var.name
  location           = var.location
  deletion_protection = false
  project = var.project_id
  remove_default_node_pool = true
  initial_node_count = 1
  network = var.network
  subnetwork = var.subnetwork
  release_channel {
    channel = var.release_channel
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
}
}

resource "google_container_node_pool" "node_pools" {
  for_each = { for pool in var.node_pools : pool.name => pool}
  name       = each.key
  cluster    = google_container_cluster.gke.name
  location   = var.location
  node_count = each.value.node_count
  autoscaling {
    min_node_count = each.value.min_count
    max_node_count = each.value.max_count
  }

  node_config {
    machine_type = each.value.machine_type
    service_account = each.value.service_account
    disk_type = each.value.disk_type
    disk_size_gb =  each.value.disk_size_gb
    labels = each.value.labels
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}