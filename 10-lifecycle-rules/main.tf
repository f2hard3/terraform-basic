resource "local_file" "pet" {
  filename        = var.filename
  content         = var.content
  file_permission = var.file_permission

  lifecycle {
    # create_before_destroy = true
    # prevent_destroy = true
    # ignore_changes = all
    ignore_changes = [ 
      filename
    ]
  }
}

