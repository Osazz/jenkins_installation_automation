variable "aws_ami" {
  default     = "ami-08523c5075ba75813"
  type        = string
  description = "Ami id to be used for creating the server currently have one in ca-central-1"

}

variable "additional_tags" {
  default     = {}
  description = "Tags for jenkin instance"
  type        = map(string)

}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8080, 22]
}

variable "cidr_block" {
  default     = ["0.0.0.0/0", "::/0"]
  description = "List of cidr for jenkins server access "
}
