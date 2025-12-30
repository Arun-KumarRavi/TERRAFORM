variable "vpc_config" {
  description = "To get the CIDR and the name of the vpc from user"
  type = object({
    cidr_block = string
    vpc_name   = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Each cidr_block must be a valid CIDR format."
  }
}

variable "aws_subnets" {
  description = "To get the CIDR and availability zone from user"
  type = map(object({
    cidr_block         = string
    availability_zone  = string
    public             = optional(bool, false)
  }))

  validation {
    condition = alltrue([
      for config in var.aws_subnets :
      can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", config.cidr_block))
    ])
    error_message = "Each cidr_block must be a valid CIDR format."
  }
}
