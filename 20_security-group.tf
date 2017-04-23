resource "aws_security_group" "ec2" {
    name        = "${var.site_name}-EC2"
    description = "for ${var.domain} EC2"
    vpc_id      = "${aws_vpc.vpc.id}"
    ingress = [
        {
            from_port       = 80
            to_port         = 80
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
            self            = false
        },
        {
            from_port       = 443
            to_port         = 443
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
            self            = false
        },
        {
            from_port       = 22
            to_port         = 22
            protocol        = "tcp"
            cidr_blocks     = ["${var.allow_ip}"]
            self            = false
        }
    ]
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}
