######## Create vpcbu1 ########

resource "aws_vpc" "bu2" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "tgw-spoke-bu2"
  }
}



######## public subnet bu1 #######
resource "aws_subnet" "public-vpc-bu2" {
    vpc_id =  aws_vpc.bu2.id
    cidr_block = "10.2.0.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-2a"
    # tags {
    #     Name = "bu1-pub-subnet"
    # }
}

resource "aws_subnet" "private-vpc-bu2" {
    vpc_id =  aws_vpc.bu2.id
    cidr_block = "10.2.1.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-2a"
    # tags {
    #     Name = "bu1-pub-subnet"
    # }
}

