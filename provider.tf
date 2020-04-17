// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("terraform-252601-161286279508.json")}"
 project     = "terraform-252601"
}