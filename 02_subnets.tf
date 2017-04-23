resource "aws_subnet" "subnet" {
    vpc_id                  = "${aws_vpc.vpc.id}"
    cidr_block              = "${cidrsubnet(var.cidr, 4, 1)}"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = true
    tags {
        "Name" = "${var.site_name}-subnet"
        "workload-type" = "${var.stage}"
    }
}
