output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "endpoint" {
  value = google_container_cluster.gke.endpoint
}

output "ca_certificate" {
  value = google_container_cluster.gke.master_auth[0].cluster_ca_certificate
}

output "workload_identity_namespace" {
  value = google_container_cluster.gke.workload_identity_config[0].workload_pool
}

output "debug_node_pool_disk_type" {
  value = [for pool in var.node_pools : pool.disk_type]
}