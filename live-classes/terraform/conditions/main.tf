# ? and :
# condition ? true_value : false_value


resource "aws_instance" "test" {
    count=2
    ami = "ami-0533f2ba8a1995cf9"
    instance_type = can(regex("^t2", var.instance_type)) ? "t3.micro" : var.instance_type
    tags = {
        Name = "Server - ${count.index}"
  }
}

variable "instance_type" {}

# variable "create_instance" {}

#make this ami dynamic with the data block