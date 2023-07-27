#provider "aws" {
#  region  = var.region
#  profile = var.profile
#}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "cloudpart1buk"
    key    = "part1/terraform.tfstate"
    region = "${var.region}"
    #    profile = "${var.profile}"
  }
}

data "template_file" "ec2_cb_app" {
  template = file("../templates/ecs/ec2_cb_app.json.tpl")

  vars = {
    app_image = var.app_image
    app_port  = var.app_port
    #   cpu_size    = var.cpu_size
    #   memory_size = var.memory_size
    #   aws_region     = var.aws_region
    #   network_mode = var.network_mode
    container_name = var.container_name
  }
}