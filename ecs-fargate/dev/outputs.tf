output "fargate_alb_hostname" {
  value = join("", [module.ecs-fargate.alb_hostname, var.health_check_path])
  #  sensitive   = true
  description = "fargate alb hostname"
  #  depends_on  = []
}
