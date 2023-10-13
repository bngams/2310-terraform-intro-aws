variable "some_override" {
  description = "Some var override / context testing"
  type = string
  default = ""
}

variable "env_name" {
  description = "Env name"
  type = string
  default = null
}

variable "buckets" {
  type = list(object({
    bucket_name = string
    tag_name = string
    env_name = string
  }))
  default = []
}

