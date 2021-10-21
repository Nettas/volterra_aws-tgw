resource "aws_instance" "bu1-web" {
    ami = var.ami
    instance_type = "t2.micro"
    # VPC
  #  vpc_id = aws_vpc.bu1.id

    vpc_security_group_ids = [aws_security_group.ssh_allowed.id]
    # aws_security_group = aws_security_group.ssh_allowed.id
    # Security Group
    #security_groups = aws_security_group.ssh_allowed.id
    # the Public SSH key
    key_name = aws_key_pair.aws-tgw-key-pair.id
    # nginx installation
    provisioner "file" {
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/nginx.sh",
             "sudo /tmp/nginx.sh"
        ]
    }
    connection {
        user = var.EC2_USER
        private_key = file("../../../.ssh/netta_aws.pem")
        host = self.public_ip
    }
}
// Sends your public key to the instance
resource "aws_key_pair" "aws-tgw-key-pair" {
    key_name = "aws-tgw-key-pair"
    public_key = var.pub_key
}