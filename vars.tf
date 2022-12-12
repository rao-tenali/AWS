variable "AWS_REGION"{
    default= "us-east-1"
}

variable "AWS_CIDRBLOCK"{
    default= "10.0.0.0/16"
}

variable "subnet_cidr"{
    default= ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "subnet_azs"{
    default=["us-east-1a","us-east-1b","us-east-1c"]
}