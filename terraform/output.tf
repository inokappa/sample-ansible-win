output "EC2 IP address" {
 value = "${join(",", aws_instance.win-test.*.public_ip)}"
}

output "EC2 Instance ID" {
  value = "${join(",", aws_instance.win-test.*.id)}"
}

output "ELB Endpoint" {
  value = "${aws_elb.iis-elb.dns_name}"
}

