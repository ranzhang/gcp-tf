module "gcp_vpc" {
   source   = "../../modules/network"
   region   = "us-central1"
   zone     = "us-central1-a"
   company  = "cisco"
   env		= "dev"
}

module "gcp_compute_k3s" {
   source   = "../../modules/compute"
   region   = "us-central1"
   zone     = "us-central1-a"
   company  = "cisco"
   env		= "dev"
   vpc_name	= "${module.gcp_vpc.vpc_name}"
}