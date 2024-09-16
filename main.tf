resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = (var.cidr != "" && var.gateway_id != "") ? [1] : []
    content {
      cidr_block = var.cidr
      gateway_id = var.gateway_id
    }
  }

  tags = merge(
    {
      "Name" = format("%s-rt", var.name)
    },
    var.tags,
  )
}
