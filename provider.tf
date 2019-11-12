variable "path" {default = "/home/geirkv/terraform/"}

provider "google" {
    project = "terrible-258516"
    region = "europe-west-2-a"
    zone        = "europe-west4-a"
    credentials = "${file("${var.path}terrible-1c13dde1164a.json")}"
}
