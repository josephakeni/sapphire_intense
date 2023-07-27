module "ecs-ec2" {
  source               = "git::git@github.com:josephakeni/aws_modules.git//ecs-ec2"
  # source = "../../modules"
  security_groups       = [data.terraform_remote_state.network.outputs.ecs-lbsg]
  subnets               = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  aws_vpc_main          = data.terraform_remote_state.network.outputs.main_vpc_id
  container_definitions = data.template_file.ec2_cb_app.rendered
  container_name        = var.container_name
  ecs_cluster_name      = var.ecs_cluster_name
  launch_type           = var.launch_type
  execution_role_arn    = data.terraform_remote_state.network.outputs.ecs_task_execution_role
  network_mode          = var.network_mode
  iam_instance_profile  = var.iam_instance_profile
  instance_type         = var.instance_type
  key_name              = var.key_name
  app_image             = var.app_image 
  app_port              = var.app_port
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size
  min_size              = var.min_size
  health_check_path = var.health_check_path
}
