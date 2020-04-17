# Create a master instance
resource "google_compute_instance" "master" {
   name = "${var.env}-master"
   machine_type = "custom-1-1024"
   zone = var.zone
   boot_disk {
      initialize_params {
         image = "ubuntu-1604-lts"
      }
   }
   network_interface {
      network = "${var.vpc_name}"
      access_config {}
   }
   service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
      }
}

# Create a worker instance
resource "google_compute_instance" "worker" {
   name = "${var.env}-worker"
   machine_type = "custom-1-1024"
   zone = var.zone
   boot_disk {
      initialize_params {
         image = "ubuntu-1604-lts"
      }
   }
   network_interface {
      network = "${var.vpc_name}"
      access_config {}
   }
   service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
      }
}

