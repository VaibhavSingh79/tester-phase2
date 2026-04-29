# Generated Terraform for VPC: vbl-network-endpoint-main

resource "aws_vpc" "vbl_network_endpoint_main" {
  cidr_block           = "10.0.0.0/21"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "vbl-network-endpoint-main"
    Environment = "POC"
    AccountName = "Network"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "vbl_network_endpoint_main_igw" {
  vpc_id = aws_vpc.vbl_network_endpoint_main.id
  tags = { Name = "vbl-network-endpoint-main-igw" }
}


# ── Subnets ────────────────────────────────────────────────

resource "aws_subnet" "vbl_ue2_network_db_A" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.0.0/26"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = false

  tags = {
    Name = "vbl-ue2-network-db-A"
    Tier = "Private"
    Type = "private"
  }
}

resource "aws_subnet" "vbl_ue2_network_db_B" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.0.64/26"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = false

  tags = {
    Name = "vbl-ue2-network-db-B"
    Tier = "Private"
    Type = "private"
  }
}

resource "aws_subnet" "vbl_ue2_network_db_C" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.0.128/26"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = false

  tags = {
    Name = "vbl-ue2-network-db-C"
    Tier = "Private"
    Type = "private"
  }
}

resource "aws_subnet" "vbl_ue2_network_lb_A" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.1.0/25"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = true

  tags = {
    Name = "vbl-ue2-network-lb-A"
    Tier = "Private"
    Type = "load-balancer"
  }
}

resource "aws_subnet" "vbl_ue2_network_lb_B" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.1.128/25"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = true

  tags = {
    Name = "vbl-ue2-network-lb-B"
    Tier = "Private"
    Type = "load-balancer"
  }
}

resource "aws_subnet" "vbl_ue2_network_lb_C" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.2.0/25"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = true

  tags = {
    Name = "vbl-ue2-network-lb-C"
    Tier = "Private"
    Type = "load-balancer"
  }
}

resource "aws_subnet" "vbl_ue2_network_app_A" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.3.0/24"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = false

  tags = {
    Name = "vbl-ue2-network-app-A"
    Tier = "Private"
    Type = "private"
  }
}

resource "aws_subnet" "vbl_ue2_network_app_B" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.4.0/24"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = false

  tags = {
    Name = "vbl-ue2-network-app-B"
    Tier = "Private"
    Type = "private"
  }
}

resource "aws_subnet" "vbl_ue2_network_app_C" {
  vpc_id     = aws_vpc.vbl_network_endpoint_main.id
  cidr_block = "10.0.5.0/24"

  # LB subnets and explicitly-public subnets get public IPs
  map_public_ip_on_launch = false

  tags = {
    Name = "vbl-ue2-network-app-C"
    Tier = "Private"
    Type = "private"
  }
}



# ── Public Route Table ──────────────────────────────────────
resource "aws_route_table" "vbl_network_endpoint_main_public_rt" {
  vpc_id = aws_vpc.vbl_network_endpoint_main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vbl_network_endpoint_main_igw.id
  }
  tags = { Name = "vbl-network-endpoint-main-public-rt" }
}


# ── EIP + NAT Gateway ──────────────────────────────────────
resource "aws_eip" "vbl_network_endpoint_main_nat_eip" {
  domain = "vpc"
  tags = { Name = "vbl-network-endpoint-main-nat-eip" }
}

# NAT placed in first LB subnet if available, else first public subnet
resource "aws_nat_gateway" "vbl_network_endpoint_main_nat" {
  allocation_id = aws_eip.vbl_network_endpoint_main_nat_eip.id
  subnet_id     = aws_subnet.vbl_ue2_network_db_A.id
  tags          = { Name = "vbl-network-endpoint-main-nat" }
  depends_on    = [aws_internet_gateway.vbl_network_endpoint_main_igw]
}

# ── Private Route Table ────────────────────────────────────
resource "aws_route_table" "vbl_network_endpoint_main_private_rt" {
  vpc_id = aws_vpc.vbl_network_endpoint_main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.vbl_network_endpoint_main_nat.id
  }
  tags = { Name = "vbl-network-endpoint-main-private-rt" }
}


# ── Route Table Associations ───────────────────────────────







# vbl-ue2-network-db-A → private route table (via NAT)

resource "aws_route_table_association" "vbl_ue2_network_db_A_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_db_A.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_private_rt.id
}










# vbl-ue2-network-db-B → private route table (via NAT)

resource "aws_route_table_association" "vbl_ue2_network_db_B_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_db_B.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_private_rt.id
}










# vbl-ue2-network-db-C → private route table (via NAT)

resource "aws_route_table_association" "vbl_ue2_network_db_C_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_db_C.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_private_rt.id
}










# vbl-ue2-network-lb-A → public route table (LB subnet)
resource "aws_route_table_association" "vbl_ue2_network_lb_A_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_lb_A.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_public_rt.id
}








# vbl-ue2-network-lb-B → public route table (LB subnet)
resource "aws_route_table_association" "vbl_ue2_network_lb_B_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_lb_B.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_public_rt.id
}








# vbl-ue2-network-lb-C → public route table (LB subnet)
resource "aws_route_table_association" "vbl_ue2_network_lb_C_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_lb_C.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_public_rt.id
}








# vbl-ue2-network-app-A → private route table (via NAT)

resource "aws_route_table_association" "vbl_ue2_network_app_A_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_app_A.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_private_rt.id
}










# vbl-ue2-network-app-B → private route table (via NAT)

resource "aws_route_table_association" "vbl_ue2_network_app_B_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_app_B.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_private_rt.id
}










# vbl-ue2-network-app-C → private route table (via NAT)

resource "aws_route_table_association" "vbl_ue2_network_app_C_rta" {
  subnet_id      = aws_subnet.vbl_ue2_network_app_C.id
  route_table_id = aws_route_table.vbl_network_endpoint_main_private_rt.id
}





