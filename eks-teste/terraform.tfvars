aws_region = "us-east-1"

project_name = "eks-01teste"

environment = "dev"

vpc_cidr = "10.0.0.0/16"

cluster_version = "1.36"

node_instance_types = [
  "t3.medium"
]

node_min_size     = 2
node_max_size     = 4
node_desired_size = 2
