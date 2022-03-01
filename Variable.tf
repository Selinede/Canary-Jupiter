

# REFERENCE FILE
# REGION

variable "region" {
    type         = string
    description  = "US"
    default      ="us-east-1"
}

# VPC CIDR cidr_block

variable "vpc-cidr-Jupiter" {
  type         = string
  default      = "10.0.0.0/16"
  description  = "myvpc-cidr"
    
}


variable "tag-post" {
  type         = string
  default      = "Jupiter_vpc"
  description  = "tag name"
    
}

# PUBLIC SUBNET1 variable

variable "Pub_Sub1-cidr"{
    type          = string
    description   = "Pub_Sub1"
    default       = "10.0.1.0/24"
}

# PUBLIC SUBNET2 variable

variable "Pub_Sub2-cidr"{
    type          = string
    description   = "Pub_Sub2"
    default       = "10.0.2.0/24"
}

# PUBLIC SUBNET3 variable

variable "Pub_Sub3-cidr"{
    type          = string
    description   = "Pub_Sub3"
    default       = "10.0.3.0/24"
}




# PRIVATE SUBNET1 variable

variable "Pri_Sub1-cidr"{
    type          = string
    description   = "Pri_Sub1"
    default       = "10.0.4.0/24"
}

# PRIVATE SUBNET2 variable

variable "Pri_Sub2-cidr"{
    type          = string
    description   = "Pri_Sub2"
    default       = "10.0.5.0/24"
    
}


# PRIVATE SUBNET3 variable

variable "Pri_Sub3-cidr"{
    type          = string
    description   = "Pri_Sub3"
    default       = "10.0.6.0/24"
    
}


#First EC2 Instance AMI

variable "ami-ec2"{
    type          = string
    description   = "webserver1"
    default       = "ami-033b95fb8079dc481"
}

# Second EC2 Instance AMI

variable "ami1-ec2"{
    type          = string
    description   = "webserver2"
    default       = "ami-038b3df3312ddf25d"
    
}

# Instance type

variable "describe-instance-types-1"{
    type          = string
    description   = "server1"
    default       = "t2.micro"

    }
    
    variable "describe-instance-types-2"{
    type          = string
    description   = "server2"
    default       = "t2.micro"
    
    }