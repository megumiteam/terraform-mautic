resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.mautic.id}"
  allocation_id = "${aws_eip.mautic_web.id}"
}

resource "aws_eip" "mautic_web" {
  vpc = true
}
