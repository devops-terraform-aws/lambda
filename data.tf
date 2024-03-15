data "archive_file" "zip" {
  type        = "zip"
  source_file = "${path.module}/config/hello.js"
  output_path = "${path.module}/hello.zip"
}