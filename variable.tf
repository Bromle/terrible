#Variables used for files sharing same parent folder.variable

# How to use an variable? in terraform 12. We can now use var.variable_name to direct to this variable previously it was
# ${var.variable_name}
variable "image" {default = "ubuntu-os-cloud/ubuntu-1604-lts"}
variable "machine_count" {default = "1"}

variable "name_count" {default = ["server1","server2","server3"] }

variable "machine_type" {
    type = "map"
    default = {
        standard-1 = "n1-standard-1"
        prod = "f1-micro"
    }
            
}