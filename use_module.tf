terraform {

  backend "s3" {
    bucket = "ashutoshh-roche-terraform-bucket"
    key = "dev/ashutoshh/terraform.tfstate"
    dynamodb_table = "ashu-roche-table1"
    region = "ap-southeast-2"   
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # region location info 
  region = "ap-southeast-2"
}

# calling module 

module "my-ashutoshh-module-ec2" {
    source = "./modules/ec2"
    ashu-ami-id = "ami-0a25a306450a2cba3"
    vm-name = "ashutoshh-vmby-module-dayfinal"
    vm-size = "t2.nano"
    ec2-key-name = "ashukeyby-modedayfinal"
    private-key-algo = "RSA"
    key-size = 4096
    my-vpc-id = "vpc-02d56e9aa1ce2f114"
    my-sec-group-name = "ashutoshh-bymode-sec"
    novm = 2 
    

  
}