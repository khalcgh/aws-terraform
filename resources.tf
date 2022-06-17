resource "aws_instance" "test" {
  ami           = "ami-0bd2099338bc55e6d"
  instance_type = "t2.micro"

  tags = {
    environment = "dev"
  }
}