module "test" {
  source = "../day-9 modules_practice"
  ami_id = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
  vpc_name = "test-vpc"
  instance_name = "test-instance"
}