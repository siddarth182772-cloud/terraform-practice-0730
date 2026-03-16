# resource "aws_vpc" "test_09" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "test - 09"
#   }
# }
# resource "aws_subnet" "test_09_sb1" {
#   vpc_id = aws_vpc.test_09.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "test_09_sb1"
#   }
#   availability_zone = "us-west-2a"
# }
# resource "aws_subnet" "test_09_sb2" {
#   vpc_id = aws_vpc.test_09.id
#   cidr_block = "10.0.2.0/24"
#   tags = {
#     Name = "test_09_sb2"
#   }
#   availability_zone = "us-west-2b"
# }
# resource "aws_db_subnet_group" "test_09_db_sg" {
#   name = "test_09_db_sg"
#   subnet_ids = [aws_subnet.test_09_sb1.id, aws_subnet.test_09_sb2.id]
# }

# resource "aws_db_instance" "test_09_db" {
#     identifier = "test-09-db"
#     allocated_storage = 10
#     engine = "mysql"
#     instance_class = "db.t3.micro"
#     db_subnet_group_name = aws_db_subnet_group.test_09_db_sg.name
#     db_name = "testdb"
#     engine_version = "8.0"
#     username = "admin"
#     manage_master_user_password = true
#     parameter_group_name = "default.mysql8.0"
#     backup_retention_period = 7
#     backup_window = "03:00-04:00"
#     maintenance_window = "Sun:04:00-Sun:05:00"
#     deletion_protection = false
#     skip_final_snapshot = true
# }
# resource "aws_db_instance" "test_09_replica" {
#   identifier = "test-09-replica"
#   replicate_source_db = aws_db_instance.test_09_db.id
#   instance_class = "db.t3.micro"
#   publicly_accessible = false
#   skip_final_snapshot = true
#   tags ={
#     Name = "test-09-replica"
#   }
# }
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "mande-vpc"
  }
}

resource "aws_subnet" "name" {
  vpc_id            = aws_vpc.name.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "mande-subnet"
  }
}

resource "aws_subnet" "name2" {
  vpc_id            = aws_vpc.name.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.5.0/24"

  tags = {
    Name = "mande-subnet2"
  }
}

resource "aws_db_subnet_group" "subnet" {
  name       = "mande-subnet-group"
  subnet_ids = [aws_subnet.name.id, aws_subnet.name2.id]

  tags = {
    Name = "mande-subnet-group"
  }
}

# PRIMARY DATABASE
resource "aws_db_instance" "main" {
  identifier              = "mande-db-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "Mandu1234!"
  db_subnet_group_name    = aws_db_subnet_group.subnet.name

  backup_retention_period = 1
  skip_final_snapshot     = true

  monitoring_interval = 60
  monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn
}

# READ REPLICA
resource "aws_db_instance" "read_replica" {
  identifier          = "mande-db-replica"
  instance_class      = "db.t3.micro"

  replicate_source_db = aws_db_instance.main.identifier

  publicly_accessible = false
  skip_final_snapshot = true

  monitoring_interval = 60
  monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn
}
####### IAM ROLE FOR RDS ENHANCED MONITORING
resource "aws_iam_role" "rds_monitoring_role" {
  name = "rds-enhanced-monitoring-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "rds_monitoring_attach" {
  role       = aws_iam_role.rds_monitoring_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

###### ELASTICACHE CLUSTER
resource "aws_elasticache_subnet_group" "redis_subnet" {
  name       = "mande-redis-subnet-group"
  subnet_ids = [
    aws_subnet.name.id,
    aws_subnet.name2.id
  ]

  tags = {
    Name = "mande-redis-subnet-group"
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "mande-redis-cache"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"

  subnet_group_name = aws_elasticache_subnet_group.redis_subnet.name
  port              = 6379

  tags = {
    Name = "mande-redis-cache"
  }
}