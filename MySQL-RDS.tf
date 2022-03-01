

# PROJECT ITALICS RDS 
# aws_db_instance

resource "aws_db_instance" "RDS-jupiter" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "jupiterdb"
  username             = "projupiter"
  password             = "JupiterRoyal80"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.Jupiter_sub_grp.name

  multi_az = "true"
}


# db_subnet group

resource "aws_db_subnet_group" "Jupiter_sub_grp" {
  name       = "jupiter-dbg"
  subnet_ids = [aws_subnet.Pri_Sub1.id, aws_subnet.Pri_Sub2.id, aws_subnet.Pri_Sub3.id  ]

  tags = {
    Name = "my-db-pri-sub-grp"
  }
}

# SECURITY GROUP FOR DATABASE instance

resource "aws_security_group" "jupiter-db-secgrp" {
  name              = "jupiter-db_sec-group"
  description       = "Allow mysql inbound traffic"
  vpc_id            = aws_vpc.Jupiter_vpc.id

}

resource "aws_security_group_rule" "Jupiter-inbound" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jupiter-db-secgrp.id
}

resource "aws_security_group_rule" "Jupiter-outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jupiter-db-secgrp.id
}