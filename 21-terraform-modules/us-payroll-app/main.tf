module "us_payroll" {
  source = "../modules/payroll-app"
  app_region = "ap-west-2"
  ami = "ami-0cf2b4e024cdb6960"
}