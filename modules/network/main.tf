####create a vpc, with firewall rules

resource "google_compute_network" "vpc-network" {
  name = "${var.company}-${var.env}"
}

resource "google_compute_firewall" "allow-internal" {
  name    = "${var.company}-${var.env}-fw-allow-internal"
  network = "${google_compute_network.vpc-network.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
}

resource "google_compute_firewall" "allow-http" {
  name    = "${var.company}-${var.env}-fw-allow-http"
  network = "${google_compute_network.vpc-network.name}"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http"] 
}



