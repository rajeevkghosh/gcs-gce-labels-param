provider "google" {
 access_token = var.access_token
}

resource "google_storage_bucket" "gcp_bucket" {
  project      = "tokyo-nomad-323506"
  name          = "gcp_bucket_terraform_rajeev"
  location      = "US"
  force_destroy = true

  labels = {
      env        =  "dev"
      foo        =  "bar"
    }
}

resource "google_compute_instance" "terraform" {
  project      = "tokyo-nomad-323506"
  name         = "terraform2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  labels =  {

  env = "dev"
  foo = "bar"

  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
