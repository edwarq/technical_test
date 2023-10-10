# Variable contenedora del nombre de la llave que se va usar en las instancias
variable "key_pair_name" {
  default = "Test_Instances"
}

# Variable contenedora de la region de aws que se va usar
variable "Region_aws" {
  default = "us-east-2"
}

# Variable contenedora tipo de instancia para instancias linux
variable "Type_instance_aws_Linux" {
  default = "t3.micro"
}

# Variable contenedora tipo de instancia para instancias Windows
variable "Type_instance_aws_Windows" {
  default = "t3.medium"
}

# Variable contenedora del id de la ami que se va usar para instancias Linux
variable "AMI_Linux" {
  default = "ami-036f5574583e16426"
}

# Variable contenedora del id de la ami que se va usar para instancias Windows
variable "AMI_Windows" {
  default = "ami-060b1c20c93e475fd"
}

# Variable contenedora de las llaves cli de AWS
variable "access_key_aws" {
  default = "AKIA5PZ2Z27MK63U2MWD"
}

variable "secret_key_aws" {
  default = "ubg4C8HsTxnMSS4Rz7MFjZcNyZxrS4RXXRfICwHI"
}


