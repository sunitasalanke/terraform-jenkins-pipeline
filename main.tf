provider "local" {}

resource "local_file" "file1" {
  content  = "This is file1"
  filename = "${path.module}/dir1/file1.txt"
}

resource "local_file" "file2" {
  content  = "This is file2"
  filename = "${path.module}/dir2/file2.txt"
}

resource "null_resource" "dir1" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/dir1"
  }
}

resource "null_resource" "dir2" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/dir2"
  }
}

