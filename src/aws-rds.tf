data "aws_subnets" "private" {
  tags = {
    "fiap-private-subnet" = "true"
  }
}

resource "aws_db_subnet_group" "fiap_private_subnets" {
  name       = "fiap-private-subnets"
  subnet_ids = data.aws_subnets.private.ids
}

resource "aws_db_instance" "fiap_food_api" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          = "15.3"
  instance_class          = "db.t3.micro"
  db_name                 = "fiap_food_api"
  username                = "dbuser"
  password                = "dbpassword"
  parameter_group_name    = "default.postgres15"
  skip_final_snapshot     = true
  backup_retention_period = 0
  apply_immediately       = true

  db_subnet_group_name = aws_db_subnet_group.private_subnets.name
}
