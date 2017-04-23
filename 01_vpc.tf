resource "aws_vpc" "vpc" {
    cidr_block           = "${var.cidr}"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"
    tags {
        "Name" = "${var.site_name}"
        "workload-type" = "${var.stage}"
    }
}
