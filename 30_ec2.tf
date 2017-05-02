resource "aws_instance" "mautic" {
    ami                         = "${lookup(var.mautic_ami, data.aws_region.current.name)}"
    availability_zone           = "${data.aws_availability_zones.available.names[0]}"
    ebs_optimized               = false
    instance_type               = "${var.instance_size}"
    key_name                    = "${var.key_name}"
    subnet_id                   = "${aws_subnet.subnet.id}"
    vpc_security_group_ids      = ["${aws_security_group.ec2.id}"]
    iam_instance_profile        = "${aws_iam_instance_profile.instance_role.id}"
    associate_public_ip_address = true
    monitoring                  = true
    source_dest_check           = true
    disable_api_termination     = false
    user_data = <<EOF
IyEvYmluL2Jhc2gKIyBmb3IgdXNlcmRhdGEKc3VkbyBzZXJ2aWNlIGh0dHBkIHJl
c3RhcnQKZXhpdCAwCg==
EOF
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = false
    }

    tags {
      "Name" = "Mautic (${var.site_name})"
      "workload-type" = "${var.stage}"
    }
}
