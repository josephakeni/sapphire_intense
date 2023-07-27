module "ecs-fargate" {
  source                               = "git::git@github.com:josephakeni/aws_modules.git//ecs-fargate"
  aws_vpc_main                         = data.terraform_remote_state.network.outputs.main_vpc_id
  subnets                              = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  security_groups                      = [data.terraform_remote_state.network.outputs.ecs-lbsg]
  ecs_cluster_name                     = var.ecs_cluster_name
  container_name                       = var.container_name
  network_mode                         = var.network_mode
  launch_type                          = var.launch_type
  execution_role_arn                   = data.terraform_remote_state.network.outputs.ecs_task_execution_role
  ecs_container_service_autoscale_role = data.terraform_remote_state.network.outputs.ecs_container_service_autoscale_role
  target_type                          = "ip"
  app_image                            = var.app_image
  app_port                             = var.app_port
  health_check_path = var.health_check_path
}