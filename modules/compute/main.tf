# Create two compute instances
resource "google_compute_instance" "instances" {
   count = 2
   name = "${var.env}-${count.index}"
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



