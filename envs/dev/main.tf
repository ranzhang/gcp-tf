module "gcp-vpc" {
   source   = "../../modules/network"
   region   = "us-central1"
   zone     = "us-central1-a"
   company  = "acme"
   env      = "dev"
}

module "gcp-compute" {
   source   = "../../modules/compute"
   region   = "us-central1"
   zone     = "us-central1-a"
   company  = "acme"
   env      = "dev"
   vpc-name	= "${module.gcp-vpc.vpc-name}"
}