# Resource
resource "google_compute_instance" "default" {
count = "${length(var.name_count)}"

name         = "list-${count.index+1}"
machine_type = var.machine_type["standard-1"]
# zone = ""
can_ip_forward = "false"

# Descriptive information about "default"
description = "This is our Virtual Machine"

# Firewall tags
tags = ["allow-http", "allow-https"]

# What to do with the VM on boot
boot_disk {
    initialize_params{
    image = var.image
    # size in gigabites of harddrive
    size = "10"
    }
}

labels = {
    name         = "list-${count.index+1}"
    machine_type = var.machine_type["standard-1"]
}

network_interface {
    network = "default"
}

metadata = {
    size = "10"
    foo = "bar"
}

# startup script
metadata_startup_script = "../scripts.sh"

service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
    # need to build second before defaul, to provide ordering.
    # depends_on = using from: resource "google_compute_instance" "default"
    # depends_on = ["google_compute_instance.second"]
}

resource "google_compute_disk" "default" {
name = "test-desk"
type = "pd-ssd"
size = "10"
# zone = ""
}

resource "google_compute_attached_disk" "default" {
    disk = "${google_compute_disk.default.self_link}"
    instance = "${google_compute_instance.default[0].self_link}"
}