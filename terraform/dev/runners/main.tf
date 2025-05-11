provider "google" {
  project = var.project_id
  region  = var.location
}

module "github_runner_sa" {
  source       = "../../modules/iam_service_account"
  account_id   = "github-runner-sa"
  display_name = "GitHub GKE Runner Service Account"
  project_id   = var.project_id

  iam_roles = [
    "roles/container.admin",
    "roles/iam.serviceAccountUser",
    "roles/container.nodeServiceAgent"
  ]
}


module "gke_runners" {
  source     = "../../modules/gke"
  name       = "github-runner-cluster"
  location   = var.location
  project_id = var.project_id
  network    = var.network
  subnetwork = var.subnetwork

  node_pools = [
    {
      name            = "runner-pool"
      machine_type    = "e2-standard-2"
      disk_type       = "pd-standard"
      disk_size_gb    = 30
      node_count      = 1
      min_count       = 1
      max_count       = 2
      service_account = module.github_runner_sa.email
      labels          = { "application" : "github-runner" }
    }
  ]
}