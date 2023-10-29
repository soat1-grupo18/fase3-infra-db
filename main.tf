provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  name                 = "database"
  username             = "dbuser"
  password             = "dbpassword"
  parameter_group_name = "default.postgres15"

  tags = {
    Name = "database"
  }
}
