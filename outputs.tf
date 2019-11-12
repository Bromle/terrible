output "name" {value = "${google_compute_instance.default.*.name}"}
output "machine_type" {value = "${google_compute_instance.default.*.machine_type}"}
output "zone" {value = "${google_compute_instance.default.*.zone}"}
output "instance_id" {value = "${join(", ", google_compute_instance.default.*.id)}"}