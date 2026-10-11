resource "aws_waf_size_constraint_set" "waf_size_constraint_sets" {
  for_each = var.waf_size_constraint_sets

  name = each.value.name

  dynamic "size_constraints" {
    for_each = each.value.size_constraints != null ? each.value.size_constraints : []
    content {
      comparison_operator = size_constraints.value.comparison_operator
      field_to_match {
        data = size_constraints.value.field_to_match.data
        type = size_constraints.value.field_to_match.type
      }
      size                = size_constraints.value.size
      text_transformation = size_constraints.value.text_transformation
    }
  }
}

