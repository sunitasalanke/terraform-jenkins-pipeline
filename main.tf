resource "null_resource" "create_dirs" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/dir1 ${path.module}/dir2"
  }
}

resource "local_file" "file1" {
  depends_on = [null_resource.create_dirs]
  content  = var.content1
  filename = "${path.module}/dir1/file1.txt"
}

resource "local_file" "file2" {
  depends_on = [null_resource.create_dirs]
  content  = var.content2
  filename = "${path.module}/dir2/file2.txt"
}

