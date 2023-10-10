# Se define grupo de seguridad para instancias Linux
resource "aws_security_group" "linux_security_group" {
  name = "linux_security_group"
  description = "Permite el trafico SSH"
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["186.80.28.36/32"]
    description = "Edwar Q"
    
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Se define grupo de seguridad para instancias Winodws
resource "aws_security_group" "windows_security_group" {
  name = "windows_security_group"
  description = "Permite el trafico RDP"
  
  ingress {
    protocol = "tcp"
    from_port = 3389
    to_port  = 3389
    cidr_blocks = ["186.80.28.36/32"]
    description = "Edwar Q"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Se levanta instancia 1 con Linux
resource "aws_instance" "linux_1" {
  ami = var.AMI_Linux
  instance_type = var.Type_instance_aws_Linux
  key_name = var.key_pair_name
  security_groups = ["linux_security_group"]
  tags = {
      Name = "Linux-instance-1-Test"
    }
  }

  # Se levanta instancia 2 con Linux
  resource "aws_instance" "linux_2" {
    ami = var.AMI_Linux
    instance_type = var.Type_instance_aws_Linux
    key_name = var.key_pair_name
    security_groups = ["linux_security_group"]
    tags = {
        Name = "Linux-instance-2-Test"
      }
  }
  
  # Se levanta instancia con Windows
  resource "aws_instance" "windows" {
    ami = var.AMI_Windows
    instance_type = var.Type_instance_aws_Windows
    key_name = var.key_pair_name
    security_groups = ["windows_security_group"]
      tags = {
        Name = "Windows-instance"
      }
}