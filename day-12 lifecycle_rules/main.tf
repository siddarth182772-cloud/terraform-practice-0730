resource "aws_instance" "sid" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    tags = {
  Name = "dev-78"
}
#     lifecycle {
#     ignore_changes = [tags]
# }
# lifecycle {
#   create_before_destroy = true;
# }
lifecycle {
  prevent_destroy = false
}
}
resource "aws_s3_bucket" "sid" {
  bucket = "sid-bucket-terraform-950"
}