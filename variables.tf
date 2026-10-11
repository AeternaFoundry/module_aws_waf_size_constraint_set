variable "waf_size_constraint_sets" {
  description = <<EOT
Map of waf_size_constraint_sets, attributes below
Required:
    - name
Optional:
    - size_constraints (block):
        - comparison_operator (required)
        - field_to_match (required, block):
            - data (optional)
            - type (required)
        - size (required)
        - text_transformation (required)
EOT

  type = map(object({
    name = string
    size_constraints = optional(list(object({
      comparison_operator = string
      field_to_match = object({
        data = optional(string)
        type = string
      })
      size                = number
      text_transformation = string
    })))
  }))
}

