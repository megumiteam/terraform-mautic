resource "aws_route_table" "rtb" {
    vpc_id     = "${aws_vpc.vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags {
    }
}

resource "aws_main_route_table_association" "route_main" {
    vpc_id = "${aws_vpc.vpc.id}"
    route_table_id = "${aws_route_table.rtb.id}"
}

resource "aws_route_table_association" "route_subnet" {
    subnet_id = "${aws_subnet.subnet.id}"
    route_table_id = "${aws_route_table.rtb.id}"
}
