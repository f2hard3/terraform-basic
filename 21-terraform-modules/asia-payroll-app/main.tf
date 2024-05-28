module "asia_payroll" {
  source = "../modules/payroll-app"
  app_region = "ap-northeast-1"
  ami = "ami-0cf2b4e024cdb6960"
}