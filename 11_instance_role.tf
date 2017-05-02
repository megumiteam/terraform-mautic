resource "aws_iam_instance_profile" "instance_role" {
    name = "instance_role"
    role = "${aws_iam_role.instance_role.name}"
}
resource "aws_iam_role" "instance_role" {
    name               = "instance_role"
    path               = "/"
    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
resource "aws_iam_role_policy_attachment" "RoleforDataPipeline" {
    role       = "${aws_iam_role.instance_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
resource "aws_iam_policy" "CreateSnapshot" {
    name        = "AmazonEC2CreateSnapshot"
    description = ""
    policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "ec2:CreateSnapshot",
                "ec2:DeleteSnapshot"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}
resource "aws_iam_role_policy_attachment" "CreateSnapshot" {
    role       = "${aws_iam_role.instance_role.name}"
    policy_arn = "${aws_iam_policy.CreateSnapshot.arn}"
}
