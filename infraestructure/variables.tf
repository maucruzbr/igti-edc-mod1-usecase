variable "aws_region"{
  default = "sa-east-1"
}

variable "lambda_function_name" {
  default = "IGTIexecutaEMR"
}

variable "key_pair_name" {
  default = "edc-igti-airflow-test"
}

variable "airflow_subnet_id" {
  default = "subnet-0b89cca32642f3716"
}

variable "vpc_id" {
  default = "vpc-065431cb95489c19a"
}